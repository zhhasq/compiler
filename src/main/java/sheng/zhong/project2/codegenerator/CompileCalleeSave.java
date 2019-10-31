package sheng.zhong.project2.codegenerator;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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


}
