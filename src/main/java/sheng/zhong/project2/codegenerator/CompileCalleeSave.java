package sheng.zhong.project2.codegenerator;

import sheng.zhong.project2.AST.Node;
import sheng.zhong.project2.CFG.Block;
import sheng.zhong.project2.CFG.BlockUtils;

import java.lang.reflect.Array;
import java.util.*;

public class CompileCalleeSave {
    public static List<String> compileCalleeSave(Map<String, Integer> map, String s0, String sp, Integer size) {
        //allocate stack space;

        List<String> result = new ArrayList<>();
        result.add(AsseCodeFactory.alloStack(sp, size));

        for (Map.Entry<String, Integer> entry : map.entrySet()) {
            result.add(AsseCodeFactory.saveCalleeReg(entry.getKey(), sp, entry.getValue()));
        }
        //use s0 points to bottom of the stack
        result.add(AsseCodeFactory.addImme(s0, sp, size.toString()));
        return result;
    }

    public static List<String> compileCalleeRestore(Map<String, Integer> map, String s0, String sp, Integer size) {
        List<String> result = new ArrayList<>();
        result.add(AsseCodeFactory.nop());

        for (Map.Entry<String, Integer> entry : map.entrySet()) {
            result.add(AsseCodeFactory.RestoreCalleeReg(entry.getKey(), sp, entry.getValue()));
        }

        result.add(AsseCodeFactory.clearStack(sp, size));
        result.add(AsseCodeFactory.finshAndReturn());
        return result;
    }

    public static List<String> initReg(Map<Integer, List<String>> regVarMap, Map<String, Integer> varsMap, Map<Integer, Block> blockMap) {
        //init the values in the register.
        List<String> result = new ArrayList<>();
        for (Map.Entry<Integer, List<String>> entry : regVarMap.entrySet()) {
            if (entry.getValue().size() == 1) {
                //case: this register only assigned to one variable
                result.add(AsseCodeFactory.loadFromMem("s" + entry.getKey(), varsMap.get(entry.getValue().get(0)).toString(), Register.s0));
            } else if (entry.getValue().size() > 1) {
                //case: this register is assigned to multiple variables.

                //find which var appear first in the program.
                String var = entry.getValue().get(0);
                Integer firstAppear = findFirstAppearOnRHS(blockMap, var);

                for (int i = 1; i < entry.getValue().size(); i++) {
                    String tmp = entry.getValue().get(i);
                    Integer rhsAppear = findFirstAppearOnRHS(blockMap, tmp);
                    if (rhsAppear != null && rhsAppear < firstAppear) {
                        var = tmp;
                        firstAppear = rhsAppear;
                    }
                }

                for (int i = 0; i < entry.getValue().size(); i++) {
                    String tmp = entry.getValue().get(i);
                    Integer lhsAppear = findFirstAppearOnLHS(blockMap, tmp);
                    if (lhsAppear != null && lhsAppear < firstAppear) {
                        var = tmp;
                        firstAppear = lhsAppear;
                    }
                }
                result.add(AsseCodeFactory.loadFromMem("s" + entry.getKey(), varsMap.get(var).toString(), Register.s0));
            }
        }
        return result;
    }

    private static Integer findFirstAppearOnRHS(Map<Integer, Block> blockMap, String var) {
        int size = blockMap.size() - 2;
        Integer result = null;
        for (int i = 0; i < size; i++) {
            Block curBlock = blockMap.get(i);
            if (BlockUtils.isCondition(curBlock)) {
                List<Node> curNodeList = curBlock.varsNodeMap.get(var);
                if (curNodeList != null && curNodeList.size() > 0) {
                    result = i;
                    break;
                }
            } else if (BlockUtils.isAssign(curBlock)) {
                List<Node> curNodeList = curBlock.varsNodeMap.get(var);
                if (curNodeList != null && curNodeList.size() > 0) {
                    result = i;
                    break;
                }
            }
        }
        if (result == null) {
            result = Integer.MAX_VALUE;
        }
        return result;
    }
    private static Integer findFirstAppearOnLHS(Map<Integer, Block> blockMap, String var) {
        int size = blockMap.size() - 2;
        Integer result = null;
        for (int i = 0; i < size; i++) {
            Block curBlock = blockMap.get(i);
            if (BlockUtils.isCondition(curBlock)) {
                List<Node> curNodeList = curBlock.varsNodeMap.get(var);
                if (curNodeList != null && curNodeList.size() > 0) {
                    result = i;
                    break;
                }
            } else if (BlockUtils.isAssign(curBlock)) {
                if (var.equals(curBlock.lhsVar)) {
                    result = i;
                    break;
                }
            }
        }
        if (result == null) {
            result = Integer.MAX_VALUE;
        }
        return result;
    }
    public static List<String> saveBackReg(Set<String> output, Map<String, Integer> varsMap, Map<String, Integer> varsRegMap, Map<Integer, List<String>> regVarMap) {
        //only save back the output or register that assigned to only 1 var
        List<String> result = new ArrayList<>();
        for (String out : output) {
            Integer regNum = varsRegMap.get(out);
            if (regNum != null) {
                result.add(AsseCodeFactory.storeToMem("s"+regNum, varsMap.get(out).toString(), Register.s0));
            }
        }
        for (Map.Entry<Integer, List<String>> entry : regVarMap.entrySet())  {
            if (entry.getValue().size() == 1) {
                result.add(AsseCodeFactory.storeToMem("s"+entry.getKey(), varsMap.get(entry.getValue().get(0)).toString(), Register.s0));
            }
        }
        return result;
    }
}
