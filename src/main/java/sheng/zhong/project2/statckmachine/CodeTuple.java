package sheng.zhong.project2.statckmachine;

public class CodeTuple {
    public final String  code;
    public final String var;
    public final String varType;

    public CodeTuple(String code) {
        this.code = code;
        this.var= "";
        this.varType= "";

    }
    public CodeTuple(String code, String var, String type) {
        this.code = code;
        this.var = var;
        this.varType = type;
    }

    @Override
    public String toString() {
        if (var.isEmpty()) {
            return code;
        } else {
            return code + var;
        }
    }
    public String getCode() {
        return this.code;
    }

    public String getVar() {
        return this.var;
    }
}
