package sheng.zhong.project2.codegenerator;

import sheng.zhong.project2.AST.Node;
import sheng.zhong.project2.AST.NodeUtils;
import sheng.zhong.project2.statckmachine.CodeTuple;
import sheng.zhong.project2.statckmachine.StackMachine;
import sheng.zhong.project2.statckmachine.StackMachineCode;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CompileExp {

    public static Map<Node, List<String>> StatckMachineToAsse(Map<Node, StackMachine> map, Map<String, Integer> varsMap, String t0, String t1, String s0, Integer offset) {

        Map<Node, List<String>> result = new HashMap<>();
        for (Map.Entry<Node, StackMachine> entry : map.entrySet()) {
            result.put(entry.getKey(), StatckMachineToAsseHelper(entry.getValue(), varsMap, t0, t1, s0, offset));
        }
        return result;

    }

    public static List<String> StatckMachineToAsseHelper(StackMachine stackMachine, Map<String, Integer> varsMap, String t0, String t1, String s0, Integer offset ) {
        //s0 is frame pointer
        //offset is how many bytes from the points that s0 points to;
        //the position s0 points to is the bottom of the current stack frame;
        //register t0 is acc;
        //register t1 is used for store the value poped from stack;

        List<String> asseCode = new ArrayList<>();
        for (CodeTuple code : stackMachine.getCodeTuple()) {
            //Push
            if (code.getCode().equals(StackMachineCode.PUSHACC)) {
                //1. store to the top of this virtual stack.
                //2. move down offset;
                asseCode.add(AsseCodeFactory.storeToMem(t0, offset.toString(), s0));
                offset -= 8;
            }
            //Pop
            else if (code.getCode().equals(StackMachineCode.POP)) {
                //1. move up offset
                //2. put value from topstack to t1;
                offset += 8;
                asseCode.add(AsseCodeFactory.loadFromMem(t1, offset.toString(), s0));
            } else if (code.getCode().equals(StackMachineCode.ASSI)) {
                if (code.varType.equals(NodeUtils.INT)) {
                    asseCode.add(AsseCodeFactory.loadImme(t0, code.var));
                } else if (code.varType.equals(NodeUtils.ID)) {
                    asseCode.add(AsseCodeFactory.loadFromMem(t0, varsMap.get(code.var).toString(), s0));
                } else if (code.varType.equals(NodeUtils.BLITER)) {
                    asseCode.add(AsseCodeFactory.loadImme(t0, code.var));
                }
            } else if (code.getCode().equals(StackMachineCode.MUL)) {
                asseCode.add(AsseCodeFactory.mul(t0, t0, t1));

            } else if (code.getCode().equals(StackMachineCode.ADD)) {
                asseCode.add(AsseCodeFactory.add(t0, t0, t1));
            } else if (code.getCode().equals(StackMachineCode.SUB)) {
                asseCode.add(AsseCodeFactory.sub(t0, t1, t0));
            } else if (code.getCode().equals(StackMachineCode.LESS)) {
                //t1 is left, t0 is right
                asseCode.add(AsseCodeFactory.less(t0, t1, t0));
            } else if (code.getCode().equals(StackMachineCode.GREATER)) {
                //t1 is left, t0 is right
                asseCode.add(AsseCodeFactory.greater(t0, t1, t0));
            } else if (code.getCode().equals(StackMachineCode.NOT)) {
                asseCode.add(AsseCodeFactory.not(t0, t1));
            } else if (code.getCode().equals(StackMachineCode.GREATEREQ)) {
                //not less
                ////t1 is left, t0 is right

                //less
                asseCode.add(AsseCodeFactory.less(t0, t1, t0));
                //not
                asseCode.add(AsseCodeFactory.not(t0, t0));
            } else if (code.getCode().equals(StackMachineCode.LESSEQ)) {
                //not greater
                ////t1 is left, t0 is right

                //greater
                asseCode.add(AsseCodeFactory.greater(t0, t1, t0));
                //not
                asseCode.add(AsseCodeFactory.not(t0, t0));
            } else if (code.getCode().equals(StackMachineCode.EQUAL)) {
                asseCode.add(AsseCodeFactory.equal(t0, t1, t0));
            }

        }
        return asseCode;
    }
}
