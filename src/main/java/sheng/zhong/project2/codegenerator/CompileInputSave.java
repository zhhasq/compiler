package sheng.zhong.project2.codegenerator;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CompileInputSave {
    public static List<String> compileInputSave(String inputArr, String regForInput, Map<String, Integer> inputMap) {
        List<String> result = new ArrayList<>();
        result.add(AsseCodeFactory.storeToMem(regForInput, inputMap.get(inputArr).toString(), Register.s0));
        return result;
    }
}
