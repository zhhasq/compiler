package sheng.zhong.project2.codegenerator;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

public class CompileArguments {

    public static List<String> compileArgumentInit(String inputArr, List<String> argumentList, Map<String, Integer> varsMap, Map<String, Integer> argumentMapArray, Map<String, Integer> inputMap) {

        List<String> result = new ArrayList<>();
        if (varsMap.isEmpty()) {
            return result;
        }
        //first load inputArr address to a0
        //then load from input array to tmp register t0,
        //then save t0 to stack
        result.add(AsseCodeFactory.loadFromMem(Register.a0, inputMap.get(inputArr).toString(), Register.s0));
        for (String argument : argumentList) {
            result.add(AsseCodeFactory.loadFromMem(Register.t0, argumentMapArray.get(argument).toString(), Register.a0));
            result.add(AsseCodeFactory.storeToMem(Register.t0, varsMap.get(argument).toString(), Register.s0));
        }
        return result;
    }

    public static List<String> compileArgumentSave(String inputArr, List<String> argumentList, Map<String, Integer> varsMap, Map<String, Integer> argumentMapArray, Map<String, Integer> inputMap) {
        List<String> result = new ArrayList<>();
        if (varsMap.isEmpty()) {
            return result;
        }
        //first load inputArr address to a0
        //then load from stack to register t0,
        //then save t0 to array
        result.add(AsseCodeFactory.loadFromMem(Register.a0, inputMap.get(inputArr).toString(), Register.s0));
        for (String argument : argumentList) {
            result.add(AsseCodeFactory.loadFromMem(Register.t0, varsMap.get(argument).toString(), Register.s0));
            result.add(AsseCodeFactory.storeToMem(Register.t0, argumentMapArray.get(argument).toString(), Register.a0));
        }
        return result;
    }

}
