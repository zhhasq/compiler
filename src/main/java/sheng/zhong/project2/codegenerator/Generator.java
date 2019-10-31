package sheng.zhong.project2.codegenerator;

import sheng.zhong.project2.AST.Node;
import sheng.zhong.project2.AST.NodeIDMap;
import sheng.zhong.project2.AST.NodeUtils;
import sheng.zhong.project2.AST.SimpleNode;
import sheng.zhong.project2.parser.Parse;
import sheng.zhong.project2.parser.ParseExp;
import sheng.zhong.project2.statckmachine.StackMachine;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;

/*
*      |                                 |  <--s0
*      | sec1: for callee save register  |
*      |                                 |
*      | sec2: for the virtual stack     |
*      |                                 |
*      | sec3: for the local variable    |
*      | sec4: for the input argument    |
*      |                                 |  <--sp
* */

public class Generator {
    public int virtualStackHeight;
    public int stackSize;
    public Node root;
    public String file;
    Map<Node, StackMachine> expStackMachineMap;
    List<String> code;
    Set<String> calleeReg;
    Integer stackOffset; //offset for the virtualStack, with respect to s0 so all should be < 0
    Map<String, Integer> calleeRegMap;
    Map<Node, List<String>> expCodeMap;
    List<String> argumentList;
    Integer numInput;
    Set<String> vars;   //for local variable
    Map<String, Integer> varsMap;
    Integer varsOffset; //with respect to s0.
    Integer inputOffset;

    Map<String, Integer> inputMap;

    Map<String, Integer> argumentMapArray;
    String inputName;
    int label = 1;

    public Generator(String file, String inputName) {
        //argument refers to the inputs of the while language.
        //input refers to the c language;
        code = new ArrayList<>();
        vars = new HashSet<>();
        expStackMachineMap = new HashMap<>();
        this.file = file;
        this.calleeRegMap = new HashMap<>();
        calleeReg = new HashSet<>();
        calleeReg.add(Register.s0);
        expCodeMap = new HashMap<>();
        //this.argumentList = argumentList;
        numInput = 1;  //only pass in the array
        this.inputMap = new HashMap<>();
        this.inputName = inputName;
        varsMap = new HashMap<>();
        argumentMapArray = new HashMap<>();
    }

    public void init() {
        root = Parse.toAst( "src/file/" + file + "/" + file + ".txt");

//        List<Node> test = ParseExp.findExpNode(root);
//        for (Node node : test) {
//            SimpleNode snode =(SimpleNode) node;
//            System.out.println("*******************");
//
//            snode.dump("");
//        }



        // expStackMachineMap = ParseAriExp.parseAllArith(root);
        expStackMachineMap = ParseExp.toStackMachine(root);

        virtualStackHeight = Parse.findStackHeight(expStackMachineMap);

        Parse.findID(root, vars);

        sortVars(vars);

        stackSize = GeneratorUtils.calculateStackSize(root, vars, calleeReg, numInput, expStackMachineMap);

        stackOffset = GeneratorUtils.mapCalleeSaveReg(calleeReg, stackSize, calleeRegMap) - stackSize;

        varsOffset = stackOffset - virtualStackHeight * 8 - 8;

        inputOffset = GeneratorUtils.mapVars(vars, varsMap, varsOffset) - 8;

        GeneratorUtils.mapInputs(inputName,inputMap, inputOffset);

        GeneratorUtils.mapArgumentArray(argumentList, argumentMapArray);

        expCodeMap = CompileExp.StatckMachineToAsse(expStackMachineMap, varsMap, Register.t0, Register.t1,Register.s0, stackOffset);

    }

    public void sortVars(Set<String> vars) {
        String[] varsSort = new String[vars.size()];
        int i = 0;
        for (String s : vars) {
            varsSort[i++] = s;
        }
        Arrays.sort(varsSort);
        this.argumentList = Arrays.asList(varsSort);
    }

    public List<String> generateCode() {
        if (code.isEmpty()) {
            //calculate stackSpace;
            init();
            generateCodeBegin();
          //  Map<Node, List<String>> arithCodeMap = CompileArithExp.compileAllArithToAsse(expStackMachineMap, Register.t0, Register.t1, Register.s0, stackOffset);

//            expCodeMap = CompileExp.StatckMachineToAsse(expStackMachineMap, Register.t0, Register.t1, Register.s0, stackOffset);
//            for (Map.Entry<Node, List<String>> entry : expCodeMap.entrySet()) {
//                code.addAll(entry.getValue());
//            }
            generateCodeCommands(root.jjtGetChild(0));
            generateCodeEnd();

        }
        generateMain();
        return code;
    }

    public void generateCodeBegin() {
        code.add(AsseCodeFactory.generateHeader(file));
        code.addAll(CompileCalleeSave.compileCalleeSave(calleeRegMap, Register.s0, Register.sp, stackSize));
        code.addAll(CompileInputSave.compileInputSave(inputName, Register.a0, inputMap));
        //code.addAll(CompileArguments.compileArgumentInit(inputName, argumentList, varsMap,argumentMapArray, inputMap));
        code.addAll(CompileArguments.compileArgumentInit(inputName, argumentList, varsMap,argumentMapArray, inputMap));
        code.add(AsseCodeFactory.nop());
        code.add(AsseCodeFactory.nop());
        code.add(AsseCodeFactory.nop());
    }
    public void generateCodeEnd() {
        code.add(AsseCodeFactory.nop());
        code.add(AsseCodeFactory.nop());
        code.add(AsseCodeFactory.nop());
        code.addAll(CompileArguments.compileArgumentSave(inputName, argumentList, varsMap,argumentMapArray, inputMap));
        code.addAll(CompileCalleeSave.compileCalleeRestore(calleeRegMap, Register.s0, Register.sp, stackSize));
        code.add(AsseCodeFactory.generateFooter(file));
    }

    public void generateCodeCommands(Node node) {
        //level order traverse from left to right
        if (NodeIDMap.isCommands(node)) {
            int numChild = node.jjtGetNumChildren();
            for (int i = 0; i < numChild; i++) {
                generateCodeCommand(node.jjtGetChild(i));
            }
        }

    }

    public void generateCodeCommand(Node node) {
        if (NodeIDMap.isSkip(node)) {
            code.add(AsseCodeFactory.nop());
        } else if (NodeIDMap.isAssign(node)) {
            code.add("  #" + node.jjtGetChild(0).toString() + " := " + NodeUtils.expToString(node.jjtGetChild(1)));
            code.addAll(expCodeMap.get(node.jjtGetChild(1)));
            //save t0 to the local variable
            code.add(AsseCodeFactory.storeToMem(Register.t0, varsMap.get(node.jjtGetChild(0).toString()).toString(), Register.s0));
        } else if (NodeIDMap.isWhile(node)) {
            int tmpLabel1 = ++label;  //condition and reset

            int tmpLabel2 = ++label;  //for the expression in the loop
            //j  tmp1
            //tmp2:
            //    commands
            //tmp1:
//                 condition;
//                 branch to tmp2;
//                 rest code;
            code.add(AsseCodeFactory.jumpLable(tmpLabel1));
            code.add("#code for while condition " + NodeUtils.expToString(node.jjtGetChild(0)) +  " met: ");
            code.add(AsseCodeFactory.addLable(tmpLabel2));

            generateCodeCommands(node.jjtGetChild(1));

            code.add("#while condition: " + NodeUtils.expToString(node.jjtGetChild(0)));
            code.add(AsseCodeFactory.addLable(tmpLabel1));
            code.addAll(expCodeMap.get(node.jjtGetChild(0)));

            // if true go to the tmp2
            code.add(AsseCodeFactory.branchNotEqualZero(Register.t0, ".L" + tmpLabel2));
            code.add("#code for while condition " + NodeUtils.expToString(node.jjtGetChild(0)) +  " not met: ");

        } else if (NodeIDMap.isIf(node)) {
            int tmpLabel1 = ++label;   //not meet condition
            int tmpLabel2 = ++label;   //rest of the code

            //boolean expression
            code.add("#IF condition: " + NodeUtils.expToString(node.jjtGetChild(0)));
            code.addAll(expCodeMap.get(node.jjtGetChild(0)));
            //branch if condition not met
            code.add("#go to .L" + tmpLabel1 + " if condition not met");
            code.add(AsseCodeFactory.branchEqualZero(Register.t0, ".L" + tmpLabel1));

            //commands if condition is met
            code.add("#Things to do when IF condition: " + NodeUtils.expToString(node.jjtGetChild(0)) + " is met");
            generateCodeCommands(node.jjtGetChild(1));

            code.add(AsseCodeFactory.jumpLable(tmpLabel2));

            //commands if condition not met
            code.add("#Things to do when IF condition: " + NodeUtils.expToString(node.jjtGetChild(0)) + " is Not met");
            code.add(AsseCodeFactory.addLable(tmpLabel1));
            generateCodeCommands(node.jjtGetChild(2));

            code.add("#code after if " + NodeUtils.expToString(node.jjtGetChild(0)));
            code.add(AsseCodeFactory.addLable(tmpLabel2));

        }
    }

    public void showStackMachine() {
        for (Map.Entry<Node, StackMachine> entry : this.expStackMachineMap.entrySet()) {
            SimpleNode sNode = (SimpleNode) entry.getKey();
            sNode.dump("");
            for (String code : entry.getValue().getCode()) {
                System.out.println(code);
            }
        }
    }

    public void showAsseCode() {
        for (String s : code) {
            System.out.println(s);
        }
    }

    public void showInfo() {
        System.out.println("inputs from main.c: " + inputName);
        System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
        System.out.println("argument for " + file + ": ");

        for (String argument : argumentList) {
            System.out.println("    " + argument + " in array offset " + argumentMapArray.get(argument));
        }

        System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");

        System.out.println("stack size: " + stackSize);
        System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");

        System.out.println("callee saved registers  " + " start at stack offset " + (stackSize - 8) + " with respect to the top of stack(sp) ");
        for (String reg : calleeReg) {
            System.out.println("    " + reg + " in stack offset " + calleeRegMap.get(reg));
        }
        System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");


        System.out.println("virtual stack size: " + virtualStackHeight * 8 + " start at stack offset " + stackOffset + " with respect to the bottom of stack(s0) ");
        System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");


        System.out.println("local variables" + " start at stack offset " + varsOffset + " with respect to the bottom of stack ");
        for (String var : vars) {
            System.out.println("    " + var + " in stack offset " + varsMap.get(var));
        }
        System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");

        System.out.println("input variables from main.c" + " start at stack offset " + inputOffset + " with respect to the bottom of stack ");
        System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");

        System.out.println("    " + inputName + " in stack offset " + inputMap.get(inputName));

    }
    public void toFile() {
        try{
            File outputFile =new File("src/file/" + file + "/" + file + ".s");

            //if file doesnt exists, then create it
            if(!outputFile.exists()){
                outputFile.createNewFile();
            }

            //true = append file
            System.out.println("src/file/" + file + "/" + file + ".s");
            FileWriter fileWritter = new FileWriter("src/file/" + file + "/" + file + ".s");
            BufferedWriter bufferWritter = new BufferedWriter(fileWritter);
            for (String s : code) {
                bufferWritter.write(s + "\n");
            }


            bufferWritter.close();

            System.out.println("Done");

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void generateMain() {
        List<String> main = new ArrayList<>();
        main.add("#include <stdlib.h>\n");
        main.add("#include <stdio.h>\n");
        main.add("extern long int " + file + "(long int *vars);\n");
        main.add("long int vars[" + argumentList.size() + "];");
        main.add("int main (int argc, char ** argv)\n");
        main.add("{");
        main.add("    if (argc != " + (argumentList.size() + 1) + ") {");
        main.add("        printf(\"Usage: " + file + argumentList + "\\n\");");
        main.add("        exit(1);");
        main.add("    }");

        int i = 0;
        for (String argument : argumentList) {
            main.add("    vars[" + i + "] = atoi(argv[ " + (i + 1) +  "]);");
            i++;
        }

        i = 0;
        main.add("\n");
        main.add("    printf(\"Initial state: \\n\");");
        for (String argument : argumentList) {
            main.add("    printf(\"" + argument + " is %ld\\n\"" + "," + "vars[" + i + "]);");
            i++;
        }
        main.add("\n");
        main.add("    " + file + "(vars);\n");

        i = 0;
        main.add("    printf(\"\\nEnd state: \\n\");");
        for (String argument : argumentList) {
            main.add("    printf(\"" + argument + " is %ld\\n\"" + "," + "vars[" + i + "]);");
            i++;
        }
        main.add("}");

        try{
            File outputFile =new File("src/file/" + file + "/" + "main" + ".c");

            //if file doesnt exists, then create it
            if(!outputFile.exists()){
                outputFile.createNewFile();
            }

            //true = append file
            FileWriter fileWritter = new FileWriter("src/file/" + file + "/" + "main" + ".c");
            BufferedWriter bufferWritter = new BufferedWriter(fileWritter);
            for (String s : main) {
                bufferWritter.write(s + "\n");
            }
            bufferWritter.close();

            System.out.println("main.c generated");

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
