package sheng.zhong.project2.optimize;

import sheng.zhong.project2.AST.*;
import sheng.zhong.project2.CFG.*;
import sheng.zhong.project2.codegenerator.*;
import sheng.zhong.project2.parser.ParseExp;
import sheng.zhong.project2.statckmachine.StackMachineCode;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;


public class Optimizer {
    Generator slowGenerator;
    //fields for project3
    public FlowGraph flowGraph;
    public Map<ReachingDef, List<ReachingDef>> dataFlowEquations = new HashMap<>();
    public FlowGraph newFlowGraph;
    public RIG rig;
    public RIG colorRig;
    public Map<String, Integer> varsRegMap = new HashMap<>();
    public List<Node> expNode;
    public Map<Node, List<String>> expAsseMap = new HashMap<>();


    Set<String> calleeReg = new HashSet<>(); //s0 -- s11
    Map<String, Integer> calleeRegMap = new HashMap<>();
    int stackSize;
    Set<String> vars = new HashSet<>();
    Integer varsOffset; //with respect to s0.
    Integer inputOffset;//with respect to s0.
    public Map<String, Integer> varsMap = new HashMap<>();
    Map<String, Integer> inputMap = new HashMap<>();

    Map<String, Integer> argumentMapArray = new HashMap<>(); //vars offsets in the input array

    List<String> code = new ArrayList<>();
    //Map<Integer, String> regHistoryMap = new HashMap<>();
    //Set<Integer> regUsed = new HashSet<>();
    Map<Integer, List<String>> regVarMap = new HashMap<>();

    Map<Integer, String> removedCodeMap;

    int label = 1;
    Integer numColor; ;
    int stackOffset;

    public Optimizer(Generator slowGenerator) {
        this.slowGenerator = slowGenerator;
        numColor = slowGenerator.numColor;
    }

    private void initCalleeSaveReg() {
        this.calleeReg.add(getReg(0));
//        for (int i = 0; i < this.numColor + 1; i++) {
//            this.calleeReg.add(getReg(i));
//        }
        for (Map.Entry<Integer, List<String>> entry : this.regVarMap.entrySet()) {
            this.calleeReg.add(getReg(entry.getKey()));
        }
    }

    public void generateFlowGraph() {
        this.flowGraph = new FlowGraph(this.slowGenerator.root);
        flowGraph.generateFlowGraph();
        flowGraph.drawCFG(slowGenerator.path + "/" + slowGenerator.file, false);
    }

    public void showDataFlowEquations() {
        ReachingDefUtils.showDataFlowEquations(this.flowGraph, dataFlowEquations);
    }

    public void showReachingDefSet() {
        //first solve
        ReachingDefUtils.calculateDataFlowEquations(this.flowGraph, this.slowGenerator.vars, this.dataFlowEquations);
        //then printOut
        System.out.println("******** Reaching Definition result:");
        Map<Integer, Block> blockMap = this.flowGraph.blockMap;
        int numBlocks = blockMap.size() - 2; //start and end doesn't count

        for (int i = 0; i < numBlocks; i++) {
            System.out.println(blockMap.get(i).reachingDefIn.toStringWithSet());
            System.out.println(blockMap.get(i).reachingDefExit.toStringWithSet());
        }
    }

    public void drawNewAst() {
        DrawTree.draw(this.slowGenerator.root, this.slowGenerator.path + "/" + slowGenerator.file + "_new");
    }

    public void runConsFolding() {
        ConsFolding.constantFolding(this.flowGraph);
    }

    public void checkBlockVars() {
        Map<Integer, Block> blockMap = this.flowGraph.blockMap;
        int size = blockMap.size() - 2;
        for (int i = 0; i < size; i++) {
            System.out.println("label: " + i + "--" + blockMap.get(i).checkVars());
        }
    }

    public void runLivenessAnalysis() {
        LivenessUtils.analyzeLiveness(this.flowGraph, this.slowGenerator.vars, this.slowGenerator.output);
    }

    public void showLiveResult() {
        Map<Integer, Block> blockMap = this.flowGraph.blockMap;
        int size = blockMap.size() - 2;
        System.out.println("**************** Liveness ******************");
        for (int i = 0; i < size; i++) {
            Block curBlock = blockMap.get(i);
            System.out.print("LV" + i + "_In:   ");
//            for (String var : curBlock.liveSetIn.set) {
//                System.out.print(" " + var);
//            }
//            System.out.println("}");
            System.out.println(curBlock.liveSetIn.toString());

            System.out.print("LV" + i + "_Exit: ");
//            for (String var : curBlock.liveSetExit.set) {
//                System.out.print(" " + var);
//            }
//            System.out.println("}");
            System.out.println(curBlock.liveSetExit.toString());
        }
    }

    public void removeDeadCode() {

       this.removedCodeMap = new HashMap<>();
        int size = removedCodeMap.size();
        boolean stop = false;
        while (!stop) {
            stop = true;
            Map<Integer, Block> blockMap = this.flowGraph.blockMap;
            int mapSize = blockMap.size() - 2;

            for (int i = 0; i < mapSize; i++) {
                Block curBlock = this.flowGraph.blockMap.get(i);
                if (BlockUtils.isAssign(curBlock)) {
                    String lhsVar = curBlock.node.jjtGetChild(0).toString();
                    if (!curBlock.liveSetExit.contains(lhsVar)) {
                        this.removedCodeMap.put(curBlock.label, curBlock.toString());
                        //replace this assignment node with skip node
                        replaceWithSkip(curBlock);
                    }
                }
            }

            if (removedCodeMap.size() - size > 0) {
                stop = false;
                size = removedCodeMap.size();
                //re-do liveness analysis
                LivenessUtils.reSet(this.flowGraph);
                LivenessUtils.analyzeLiveness(this.flowGraph, this.slowGenerator.vars, this.slowGenerator.output);
            }
        }
    }

    public void replaceWithSkip(Block block) {
        Node skipNode = new ASTSkip(NodeIDMap.getNodeIDMap().get(NodeUtils.SKIP));
       // skipNode.setLabel(block.node.getLabel());
        ConsFolding.replaceNode(block.node, skipNode);

        block.node = skipNode;
        block.varsNodeMap.clear();
        block.lhsVar = null;
        block.arithNodes.clear();
    }

    public void generateNewFlowGraph() {
        //CFG after constant folding
//        this.newFlowGraph = new FlowGraph(this.slowGenerator.root);
//        newFlowGraph.generateFlowGraph();
        this.flowGraph.drawCFG(slowGenerator.path + "/" + slowGenerator.file + "_new", false);
        this.flowGraph.drawCFG(slowGenerator.path + "/" + slowGenerator.file + "_new_live", true);

    }

    public void generateRIG() {
        rig = new RIG(this.slowGenerator.vars, this.flowGraph.blockMap);
        rig.buildRIG();
        rig.drawRIG(slowGenerator.path + "/" + slowGenerator.file);
    }

    public void solveColor() {
        //varsRegMap will be initialized here.
        RIG tmp = rig.deepCopyRIG();
        Map<RIG.RigNode, Integer> nodeColorMap = tmp.assignColor(numColor, tmp);

        tmp.drawRIG(slowGenerator.path + "/" + slowGenerator.file + "_Color");

        for (Map.Entry<RIG.RigNode, Integer> entry : nodeColorMap.entrySet()) {

            this.varsRegMap.put(entry.getKey().val, entry.getValue());
            List<String> assignedVar = regVarMap.get(entry.getValue());
            if (assignedVar == null) {
                assignedVar = new ArrayList<>();
                assignedVar.add(entry.getKey().val);
                if (entry.getValue() != null) {
                    this.regVarMap.put(entry.getValue(), assignedVar);
                }
            } else {
                assignedVar.add(entry.getKey().val);
            }
        }
    }

    public void showVarRegMap() {
        System.out.println("*********Var-Reg Map *********");
        for (Map.Entry<String, Integer> entry : varsRegMap.entrySet()) {
            System.out.println(entry.getKey() + ": " + entry.getValue());
        }
    }

    public void reGenExpAsse() {
        //first re-search all the exp nodes, since some node got replaced.
//        this.expNode = ParseExp.findExpNode(this.slowGenerator.root, false);

        //re-generate assembly code for the exp
//        for (Node expNode : this.expNode) {
//            List<String> asseCode = expToAsse(expNode);
//            this.expAsseMap.put(expNode, asseCode);
//        }

        int size = this.flowGraph.blockMap.size() - 2;
        for (int i = 0; i < size; i++) {
            Block curBlock = this.flowGraph.blockMap.get(i);
            if (BlockUtils.isAssign(curBlock)) {
                Node expNode = curBlock.node.jjtGetChild(1);
                List<String> asseCode = expToAsse(expNode);
                this.expAsseMap.put(expNode, asseCode);

                String lhsVar = curBlock.node.jjtGetChild(0).toString();
                Integer reg = varsRegMap.get(lhsVar);

            } else if (BlockUtils.isCondition(curBlock)) {
                Node expNode = curBlock.node;
                List<String> asseCode = expToAsse(expNode);
                this.expAsseMap.put(expNode, asseCode);
            }
        }
    }

    private List<String> expToAsse(Node expNode) {
        List<String> result = new ArrayList<>();
        expToAsseHelper(expNode, result, stackOffset);
        return result;
    }

    private void expToAsseHelper(Node curNode, List<String> result, Integer offset) {
        int maxHeight = 0;
        if (NodeIDMap.isID(curNode)) {
            //first need to check if curNode has a related register
            Integer regNum = this.varsRegMap.get(curNode.toString());
            if (regNum == null) {
                //this register is spilled register
                //first need to load value from stack to t0
                loadVarFromMem(result, curNode.toString(), Register.t0, Register.s0);
            } else {
                result.add(AsseCodeFactory.mov(Register.t0, getReg(regNum)));
            }
            return;
        }
        if (NodeIDMap.isInt(curNode)) {
            result.add(AsseCodeFactory.loadImme(Register.t0, curNode.toString()));
            return;
        }
        if (NodeIDMap.isBLiter(curNode)) {
            result.add(AsseCodeFactory.loadImme(Register.t0, curNode.toString().equals("true") ? "1" : "0"));
            return;
        }

        //go to left
        expToAsseHelper(curNode.jjtGetChild(0), result, offset);

        //save t0 to top of stack
        //result.add(AsseCodeFactory.mov(Register.t1, Register.t0));
        result.add(AsseCodeFactory.storeToMem(Register.t0, offset.toString(), Register.s0));
        offset -= 8;

        //go to right
        if (!NodeIDMap.isNot(curNode)) {
            expToAsseHelper(curNode.jjtGetChild(1), result, offset);
        }

        //1. move up offset
        //2. put value from topstack to t1;
        offset += 8;
        result.add(AsseCodeFactory.loadFromMem(Register.t1, offset.toString(), Register.s0));
        //left branch result in t1;
        //right branch result in t0;


        if (curNode.toString().equals("*") || curNode.toString().equals("And")) {
            result.add(AsseCodeFactory.mul(Register.t0, Register.t0, Register.t1));
        } else if (curNode.toString().equals("+")) {
            result.add(AsseCodeFactory.add(Register.t0, Register.t0, Register.t1));
        } else if (curNode.toString().equals("-")) {
            result.add(AsseCodeFactory.sub(Register.t0, Register.t1, Register.t0));
        } else if (curNode.toString().equals("Less")) {
            //t1 is left, t0 is right
            result.add(AsseCodeFactory.less(Register.t0, Register.t1, Register.t0));
        } else if (curNode.toString().equals("Gre")) {
            //t1 is left, t0 is right
            result.add(AsseCodeFactory.greater(Register.t0, Register.t1, Register.t0));
        } else if (curNode.toString().equals("Less=")) {
            //not greater
            ////t1 is left, t0 is right

            //greater
            result.add(AsseCodeFactory.greater(Register.t0, Register.t1, Register.t0));
            //not
            result.add(AsseCodeFactory.not(Register.t0, Register.t0));
        } else if (curNode.toString().equals("Gre=")) {
            //not less
            ////t1 is left, t0 is right

            //less
            result.add(AsseCodeFactory.less(Register.t0, Register.t1, Register.t0));
            //not
            result.add(AsseCodeFactory.not(Register.t0, Register.t0));
        } else if (curNode.toString().equals("=")) {
            result.add(AsseCodeFactory.equal(Register.t0, Register.t1, Register.t0));
        } else if (curNode.toString().equals("Not")) {
            result.add(AsseCodeFactory.not(Register.t0, Register.t1));
        } else if (curNode.toString().equals("or")) {
            result.add(AsseCodeFactory.or(Register.t0, Register.t0, Register.t1));
        }
        //less right - left
        //greater  left - right
        //less equal not greater
        //greater equal not less
        return;
    }

    private String getReg(Integer num) {
        return "s" + num;
    }

    public void loadVarFromMem(List<String> result, String var, String targetReg, String s0) {
        Integer offset = this.varsMap.get(var); //need to use new varsMap since some vars may be removed
        result.add(AsseCodeFactory.loadFromMem(targetReg, offset.toString(), s0));
    }

    public void generateCode() {

        if (code.isEmpty()) {
            //calculate stackSpace;
            initStack();
            generateCodeBegin();

            generateCodeCommands(this.slowGenerator.root.jjtGetChild(0));
            generateCodeEnd();
        }

        //generateMain(); use the same main method.
        try{
            String path = this.slowGenerator.path;
            String file = this.slowGenerator.file;
            File outputFile =new File(path + "/" + file + "_new.s");
            //if file doesnt exists, then create it
            if(!outputFile.exists()){
                outputFile.createNewFile();
            }

            //true = append file
            //System.out.println("src/file/" + file + "/" + file + ".s");
            // FileWriter fileWritter = new FileWriter("src/file/" + file + "/" + file + ".s");
            FileWriter fileWritter = new FileWriter(path + "/" + file + "_new.s");
            BufferedWriter bufferWritter = new BufferedWriter(fileWritter);
            for (String s : code) {
                bufferWritter.write(s + "\n");
            }

            bufferWritter.close();

            System.out.println("new assembly code generated successfully");

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void initStack() {
        initCalleeSaveReg();  //calleeReg and calleeRegMap will be initialized

        this.stackSize = GeneratorUtils.calculateStackSize(this.slowGenerator.root, vars, calleeReg, this.slowGenerator.numInput, null);
        this.stackSize = this.slowGenerator.stackSize;
        stackOffset = GeneratorUtils.mapCalleeSaveReg(calleeReg, stackSize, calleeRegMap) - stackSize;
        varsOffset =  varsOffset = stackOffset - this.slowGenerator.virtualStackHeight * 8 - 8;
        //varsOffset = GeneratorUtils.mapCalleeSaveReg(calleeReg, stackSize, calleeRegMap) - stackSize;  //respect to s0, should < 0

        inputOffset = GeneratorUtils.mapVars(vars, varsMap, varsOffset) - 8;

        GeneratorUtils.mapInputs(this.slowGenerator.inputName, inputMap, inputOffset);

        GeneratorUtils.mapArgumentArray(this.slowGenerator.argumentList, argumentMapArray); //in order to keep consistency, still use the argument list from the slowGenerator

        reGenExpAsse();       //expAsseMap will be initialized
    }

    private void generateCodeBegin() {
        this.code.add(AsseCodeFactory.generateHeader(this.slowGenerator.file));
        code.addAll(CompileCalleeSave.compileCalleeSave(calleeRegMap, Register.s0, Register.sp, stackSize));
        code.addAll(CompileInputSave.compileInputSave(this.slowGenerator.inputName, Register.a0, inputMap));
        code.addAll(CompileArguments.compileArgumentInit(this.slowGenerator.inputName, this.slowGenerator.argumentList, varsMap, argumentMapArray, inputMap));

        code.addAll(CompileCalleeSave.initReg(regVarMap, varsMap, this.flowGraph.blockMap));

        code.add(AsseCodeFactory.nop());
        code.add(AsseCodeFactory.nop());
        code.add(AsseCodeFactory.nop());
    }
    private void generateCodeEnd() {
        code.add(AsseCodeFactory.nop());
        code.add(AsseCodeFactory.nop());
        code.add(AsseCodeFactory.nop());

        code.addAll(CompileCalleeSave.saveBackReg(this.slowGenerator.output, varsMap, varsRegMap, regVarMap));

        code.addAll(CompileArguments.compileArgumentSave(this.slowGenerator.inputName, this.slowGenerator.argumentList, varsMap,argumentMapArray, inputMap));
        code.addAll(CompileCalleeSave.compileCalleeRestore(calleeRegMap, Register.s0, Register.sp, stackSize));
        code.add(AsseCodeFactory.generateFooter(this.slowGenerator.file));
    }

    private void generateCodeCommands(Node node) {
        //level order traverse from left to right
        if (NodeIDMap.isCommands(node)) {
            int numChild = node.jjtGetNumChildren();
            for (int i = 0; i < numChild; i++) {
                generateCodeCommand(node.jjtGetChild(i));
            }
        }
    }
    private void generateCodeCommand(Node node) {
        if (NodeIDMap.isSkip(node)) {
            code.add("  #label: " + node.getLabel());
            code.add(AsseCodeFactory.nop());
        } else if (NodeIDMap.isAssign(node)) {

            code.add("  #" + node.jjtGetChild(0).toString() + " := " + NodeUtils.expToString(node.jjtGetChild(1)));
            code.add("  #label: " + node.getLabel());

            //need to init the register before use
//            Block curBlock = this.flowGraph.blockMap.get(node.getLabel());
//            for (Map.Entry<String, List<Node>> entry : curBlock.varsNodeMap.entrySet()) {
//                Integer regNum = this.varsRegMap.get(entry.getKey());
//                if (regNum != null && !this.regUsed.contains(regNum)) {
//                    code.add(AsseCodeFactory.loadFromMem("s"+regNum, varsMap.get(entry.getKey()).toString(), Register.s0));
//                    regUsed.add(regNum);
//                }
//            }

            code.addAll(this.expAsseMap.get(node.jjtGetChild(1)));
            //expToAsseHelper(node.jjtGetChild(1), code);

            String lhsVar = node.jjtGetChild(0).toString();
            Integer reg = varsRegMap.get(lhsVar);

            if (reg == null) {
                //spilled variables
                //save to the stack
                code.add(AsseCodeFactory.storeToMem(Register.t0, varsMap.get(lhsVar).toString(),Register.s0));
            } else {
                //save to the register that used.
                code.add(AsseCodeFactory.mov(getReg(reg), Register.t0));
                //this.regHistoryMap.put(reg, lhsVar);
                //this.regUsed.add(reg);
            }
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
            code.add("  #label: " + node.jjtGetChild(0).getLabel());
            code.add(AsseCodeFactory.addLable(tmpLabel1));
            List<String> expCode = expAsseMap.get(node.jjtGetChild(0));
            if (expCode == null || expCode.isEmpty()) {
                System.out.println("the exp node is not found");
            }
            code.addAll(expCode);
            //need to generate exp code on the fly
            //expToAsseHelper(node.jjtGetChild(0), code);

            // if true go to the tmp2
            code.add(AsseCodeFactory.branchNotEqualZero(Register.t0, ".L" + tmpLabel2));
            code.add("#code for while condition " + NodeUtils.expToString(node.jjtGetChild(0)) +  " not met: ");

        } else if (NodeIDMap.isIf(node)) {
            int tmpLabel1 = ++label;   //not meet condition
            int tmpLabel2 = ++label;   //rest of the code

            //boolean expression
            code.add("#IF condition: " + NodeUtils.expToString(node.jjtGetChild(0)));
            code.add("  #label: " + node.jjtGetChild(0).getLabel());

            List<String> expCode = expAsseMap.get(node.jjtGetChild(0));
            if (expCode == null || expCode.isEmpty()) {
                System.out.println("the exp node is not found");
            }
            code.addAll(expCode);
            //code.addAll(expAsseMap.get(node.jjtGetChild(0)));

            //expToAsseHelper(node.jjtGetChild(0), code);

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
    public void showRegVarMap() {
        for (Map.Entry<Integer, List<String>> entry : this.regVarMap.entrySet()) {
            System.out.println("s"+entry.getKey() +": " + entry.getValue().toString());
        }
    }
    public void showInfo() {
        System.out.println("inputs from main.c: " + this.slowGenerator.inputName);
        System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
        System.out.println("argument for " + this.slowGenerator.file + ": ");

        for (String argument : this.slowGenerator.argumentList) {
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



        System.out.println("local variables" + " start at stack offset " + varsOffset + " with respect to the bottom of stack ");
        for (String var : vars) {
            System.out.println("    " + var + " in stack offset " + varsMap.get(var));
        }
        System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");

        System.out.println("input variables from main.c" + " start at stack offset " + inputOffset + " with respect to the bottom of stack ");
        System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");

        System.out.println("    " + this.slowGenerator.inputName + " in stack offset " + inputMap.get(this.slowGenerator.inputName));

    }
    public void showRemovedDeadCode() {
        System.out.println();
        System.out.println();
        System.out.println("Following code is dead and removed");

        for (Map.Entry<Integer, String> entry : this.removedCodeMap.entrySet()) {
            System.out.println(entry.getKey() +": " + entry.getValue());
        }

        System.out.println();
        System.out.println();
    }
}
