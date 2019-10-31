package sheng.zhong.project2.statckmachine;


public class StackMachineCode {
    public static final String PUSHACC = "push accumulator";
    public static final String POP = "pop";
    public static final String ASSI = "acc := ";
    public static final String MUL = "mul";
    public static final String ADD = "add";
    public static final String SUB = "sub";
    public static final String AND = "and";
    public static final String OR = "or";
    public static final String LESS = "less";
    public static final String GREATER = "greater";
    public static final String LESSEQ = "lessEq";
    public static final String GREATEREQ = "greaterEq";
    public static final String NOT = "not";
    public static final String EQUAL = "equal";


    public static CodeTuple push() {
        return new CodeTuple(PUSHACC);
    }
    public static CodeTuple pop() {
        return new CodeTuple(POP);
    }
    public static CodeTuple assign(String var, String type) {
        //type has id int bliter(true false)
        return new CodeTuple(ASSI, var, type);
    }
    public static CodeTuple mul() {
        return new CodeTuple(MUL);
    }
    public static CodeTuple add() {
        return new CodeTuple(ADD);
    }
    public static CodeTuple sub() {
        return new CodeTuple(SUB);
    }

    public static CodeTuple and() {
        return new CodeTuple(AND);
    }
    public static CodeTuple or() {
        return new CodeTuple(OR);
    }
    public static CodeTuple less() {
        return new CodeTuple(LESS);
    }
    public static CodeTuple lessEq() {
        return new CodeTuple(LESSEQ);
    }
    public static CodeTuple greater() {
        return new CodeTuple(GREATER);
    }
    public static CodeTuple greaterEq() {
        return new CodeTuple(GREATEREQ);
    }
    public static CodeTuple not() {
        return new CodeTuple(NOT);
    }


    public static CodeTuple equal() {
        return new CodeTuple(EQUAL);
    }
}
