package sheng.zhong.project2.statckmachine;

import com.sun.org.apache.bcel.internal.classfile.Code;
import sheng.zhong.project2.AST.Node;
import sheng.zhong.project2.AST.NodeIDMap;
import sheng.zhong.project2.AST.NodeUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StackMachine {
    int maxHeight;
    Node ast;
    List<CodeTuple> codeTupleList = new ArrayList<>();
    List<String> codeList = new ArrayList<>();

    public StackMachine(Node ast) {
        this.ast = ast;
        this.maxHeight = 0;
    }

    public List<String> getCode() {
        if (codeList.isEmpty()) {
            toStackMachineCode();
            for (CodeTuple codeTuple : codeTupleList) {
                codeList.add(codeTuple.toString());
            }
        }

        return this.codeList;
    }
    public List<CodeTuple> getCodeTuple() {
        if (codeTupleList.isEmpty()) {
            toStackMachineCode();
        }
        return this.codeTupleList;
    }
    public int getMaxHeight() {
        return this.maxHeight;
    }

    public void toStackMachineCode() {
        if (codeTupleList.isEmpty()) {
            toStackMachineCodeHelper(ast, codeTupleList, new int[]{0});
        }
    }
//
//    private void toStackMachineCodeHelper(Node node, List<CodeTuple> result, int[] height){
//        if (NodeIDMap.isID(node)) {
//            result.add(StackMachineCode.assign(node.toString(), NodeUtils.ID));
//            return;
//        }
//        if (NodeIDMap.isInt(node)) {
//            result.add(StackMachineCode.assign(node.toString(), NodeUtils.INT));
//            return;
//        }
//
//        //go to left
//        toStackMachineCodeHelper(node.jjtGetChild(0), result, height);
//        //save acc to top of stack
//        result.add(StackMachineCode.push());
//        height[0] = height[0] + 1;
//        maxHeight = Math.max(height[0], maxHeight);
//        //go to right
//        toStackMachineCodeHelper(node.jjtGetChild(1), result, height);
//        result.add(StackMachineCode.pop());
//        height[0] = height[0] - 1;
//
//        if(node.toString().equals("*")) {
//            result.add(StackMachineCode.mul());
//        } else if (node.toString().equals("+")) {
//            result.add(StackMachineCode.add());
//        } else if (node.toString().equals("-")) {
//            result.add(StackMachineCode.sub());
//        }
//        //less right - left
//        //greater  left - right
//        //less equal not greater
//        //greater equal not less
//        return;
//    }


    private void toStackMachineCodeHelper(Node node, List<CodeTuple> result, int[] height){
        if (NodeIDMap.isID(node)) {
            result.add(StackMachineCode.assign(node.toString(), NodeUtils.ID));
            return;
        }
        if (NodeIDMap.isInt(node)) {
            result.add(StackMachineCode.assign(node.toString(), NodeUtils.INT));
            return;
        }
        if (NodeIDMap.isBLiter(node)) {
            result.add(StackMachineCode.assign((node.toString().equals("true")) ? "1" : "0", NodeUtils.BLITER));
            return;
        }

        //go to left
        toStackMachineCodeHelper(node.jjtGetChild(0), result, height);
        //save acc to top of stack
        result.add(StackMachineCode.push());
        height[0] = height[0] + 1;
        maxHeight = Math.max(height[0], maxHeight);

        //go to right
        if (!NodeIDMap.isNot(node)) {
            toStackMachineCodeHelper(node.jjtGetChild(1), result, height);

        }
        result.add(StackMachineCode.pop());
        height[0] = height[0] - 1;


        if(node.toString().equals("*") || node.toString().equals("And")) {
            result.add(StackMachineCode.mul());
        } else if (node.toString().equals("+") || node.toString().equals("or")) {
            result.add(StackMachineCode.add());
        } else if (node.toString().equals("-")) {
            result.add(StackMachineCode.sub());
        } else if (node.toString().equals("Less")) {
            result.add(StackMachineCode.less());
        } else if (node.toString().equals("Gre")) {
            result.add(StackMachineCode.greater());
        } else if (node.toString().equals("Less=")) {
            result.add(StackMachineCode.lessEq());
        } else if (node.toString().equals("Gre=")) {
            result.add(StackMachineCode.greaterEq());
        } else if (node.toString().equals("=")) {
            result.add(StackMachineCode.equal());
        } else if (node.toString().equals("Not")) {
            result.add(StackMachineCode.not());
        }
        //less right - left
        //greater  left - right
        //less equal not greater
        //greater equal not less
        return;
    }
}
