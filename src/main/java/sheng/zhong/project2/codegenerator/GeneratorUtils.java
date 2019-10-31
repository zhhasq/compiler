package sheng.zhong.project2.codegenerator;

import sheng.zhong.project2.AST.Node;
import sheng.zhong.project2.parser.Parse;
import sheng.zhong.project2.statckmachine.StackMachine;

import java.util.List;
import java.util.Map;
import java.util.Set;

public class GeneratorUtils {
    public static int calculateStackSize(Node root, Set<String> idSet, Set<String> calleeReg, Integer numInputs, Map<Node, StackMachine> map) {
        //first find how many variables;
        Parse.findID(root, idSet);
        int numVar = idSet.size();
        int numRegSave = calleeReg.size();
        //then find how many space we need on virtual stack
        int height = Parse.findStackHeight(map);
        return 64 + 8 * (numVar + height + numRegSave + numInputs);
    }

    public static int mapCalleeSaveReg(Set<String> calleeReg, Integer size, Map<String, Integer> map) {
        //return offset of the next availeable
        //this offset is respect to sp
        //so all of them should be > 0
        int offset = size - 8;
        for (String var : calleeReg) {
            map.put(var, offset);
            offset -= 8;
        }
        return offset;
    }

    public static Integer mapVars(Set<String> vars, Map<String, Integer> varsMap, Integer varsOffset) {
        for (String var : vars) {
            varsMap.put(var, varsOffset);
            varsOffset -= 8;
        }
        return varsOffset;
    }

    public static void mapInputs(String inputArray, Map<String, Integer> inputMap, Integer inputOffset) {
        inputMap.put(inputArray, inputOffset);
    }

    public static void mapArgumentArray(List<String> argumentList, Map<String, Integer> argumentMapArray) {
        Integer offset = 0;
        for (String s : argumentList) {
            argumentMapArray.put(s, offset);
            offset += 8;
        }
    }
}
