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

public class CompileArithExp {

    public static Map<Node, List<String>> compileAllArithToAsse(Map<Node, StackMachine> map, String t0, String t1, String s0, Integer offset) {
        //return the maxHeigh for the virtual stack;
        Map<Node, List<String>> result = new HashMap<>();
        for (Map.Entry<Node, StackMachine> entry : map.entrySet()) {
            result.put(entry.getKey(), compileArithToAsse(entry.getValue(), t0, t1, s0, offset));
        }
        return result;

    }

    public static List<String> compileArithToAsse(StackMachine stackMachine, String t0, String t1, String s0, Integer offset ) {
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
                    //todo
                }
            } else if (code.getCode().equals(StackMachineCode.MUL)) {
                asseCode.add(AsseCodeFactory.mul(t0, t0, t1));

            } else if (code.getCode().equals(StackMachineCode.ADD)) {
                asseCode.add(AsseCodeFactory.add(t0, t0, t1));
            } else if (code.getCode().equals(StackMachineCode.SUB)) {
                asseCode.add(AsseCodeFactory.sub(t0, t1, t0));
            }

        }
        return asseCode;
    }
}
