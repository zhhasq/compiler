package sheng.zhong.project2.codegenerator;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class AsseCodeFactory {

    public static String generateHeader(String file) {
        StringBuilder sb = new StringBuilder();
        sb.append("    .file   " + "\"" +file + ".c" +"\"");
        sb.append(System.lineSeparator());
        sb.append("    .option nopic");
        sb.append(System.lineSeparator());
        sb.append("    .text");
        sb.append(System.lineSeparator());
        sb.append("    .align 1");
        sb.append(System.lineSeparator());
        sb.append("    .global " + file);
        sb.append(System.lineSeparator());
        sb.append("    .type " + file + ", @function");
        sb.append(System.lineSeparator());
        sb.append(file + ":");
        sb.append(System.lineSeparator());
        return sb.toString();
    }

    public static String generateFooter(String file) {
        StringBuilder sb = new StringBuilder();
        sb.append("    .size   " +file + ", " + ".-" + file);
        sb.append(System.lineSeparator());
        sb.append("    .ident " + "\"" + "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)" + "\"");
        sb.append(System.lineSeparator());
        sb.append("    .section        .note.GNU-stack,\"\",@progbits");
        sb.append(System.lineSeparator());
        return sb.toString();
    }

    public static String alloStack(String sp, Integer size) {
        return addImme(sp, sp, "-" + size.toString());
    }
    public static String setStackBottom(String s0, String sp, Integer size) {
        return addImme(s0, sp, size.toString());
    }
    public static String clearStack(String sp, Integer size) {
        return addImme(sp, sp, size.toString());
    }

    public static String nop() {
        return "nop";
    }

    public static String finshAndReturn() {
        return "jr  ra";
    }

    public static String saveCalleeReg(String reg, String sp, Integer offset) {
        StringBuilder sb = new StringBuilder();
        sb.append("  sd    ");
        sb.append(reg);
        sb.append(",");
        sb.append(offset);
        sb.append("(");
        sb.append(sp);
        sb.append(")");
        return sb.toString();
    }

    public static String RestoreCalleeReg(String reg, String sp, Integer offset) {
        StringBuilder sb = new StringBuilder();
        sb.append("  ld    ");
        sb.append(reg);
        sb.append(",");
        sb.append(offset);
        sb.append("(");
        sb.append(sp);
        sb.append(")");
        return sb.toString();
    }

    public static String storeToMem(String sourceReg, String offset, String destReg) {
        StringBuilder sb = new StringBuilder();
        sb.append("  sd    ");
        sb.append(sourceReg);
        sb.append(",");
        sb.append(offset);
        sb.append("(");
        sb.append(destReg);
        sb.append(")");
        return sb.toString();
    }

    public static String addImme(String destReg, String sourceReg, String value){

        StringBuilder sb = new StringBuilder();
        sb.append("  addi  ");
        sb.append(destReg);
        sb.append(",");
        sb.append(sourceReg);
        sb.append(",");
        sb.append(value);
        return sb.toString();
    }

    public static String loadFromMem(String destReg,  String offset, String sourceReg) {
        StringBuilder sb = new StringBuilder();
        sb.append("  ld    ");
        sb.append(destReg);
        sb.append(",");
        sb.append(offset);
        sb.append("(");
        sb.append(sourceReg);
        sb.append(")");
        return sb.toString();
    }

    public static String loadImme(String destReg,  String imme) {
        StringBuilder sb = new StringBuilder();
        sb.append("  li    ");
        sb.append(destReg);
        sb.append(",");
        sb.append(imme);
        return sb.toString();
    }

    public static String mul(String destReg,  String reg1, String reg2) {
        StringBuilder sb = new StringBuilder();
        sb.append("  mul   ");
        sb.append(destReg);
        sb.append(",");
        sb.append(reg1);
        sb.append(",");
        sb.append(reg2);
        return sb.toString();
    }

    public static String add(String destReg,  String reg1, String reg2) {
        StringBuilder sb = new StringBuilder();
        sb.append("  add   ");
        sb.append(destReg);
        sb.append(",");
        sb.append(reg1);
        sb.append(",");
        sb.append(reg2);
        return sb.toString();
    }

    public static String sub(String destReg,  String reg1, String reg2) {
        StringBuilder sb = new StringBuilder();
        sb.append("  sub   ");
        sb.append(destReg);
        sb.append(",");
        sb.append(reg1);
        sb.append(",");
        sb.append(reg2);
        return sb.toString();
    }

    public static String less(String destReg,  String reg1, String reg2) {
        //less   right - less
        //reg1 is left, reg2 is right
        //reg1 = reg2 - reg1;
        //then
        //sgtz destReg reg1
        StringBuilder sb = new StringBuilder();
        sb.append("  sub   ");
        sb.append(reg1);
        sb.append(",");
        sb.append(reg2);
        sb.append(",");
        sb.append(reg1);
        sb.append(System.lineSeparator());
        sb.append("  sgtz  ");
        sb.append(destReg);
        sb.append(",");
        sb.append(reg1);
        return sb.toString();
    }
    public static String greater(String destReg,  String reg1, String reg2) {
        //greater   left - right
        //reg1 is left, reg2 is right
        //reg1 = reg1 - reg2;
        //then
        //sgtz destReg reg1
        StringBuilder sb = new StringBuilder();
        sb.append("  sub   ");
        sb.append(reg1);
        sb.append(",");
        sb.append(reg1);
        sb.append(",");
        sb.append(reg2);
        sb.append(System.lineSeparator());
        sb.append("  sgtz  ");
        sb.append(destReg);
        sb.append(",");
        sb.append(reg1);
        return sb.toString();
    }
    public static String equal(String destReg,  String reg1, String reg2) {
        //equal   left - right
        //reg1 is left, reg2 is right
        //reg1 = reg1 - reg2;
        //then
        //seqz destReg reg1
        StringBuilder sb = new StringBuilder();
        sb.append("  sub   ");
        sb.append(reg1);
        sb.append(",");
        sb.append(reg1);
        sb.append(",");
        sb.append(reg2);
        sb.append(System.lineSeparator());
        sb.append("  seqz  ");
        sb.append(destReg);
        sb.append(",");
        sb.append(reg1);
        return sb.toString();
    }
    public static String not(String destReg,  String reg1) {
        //greater   left - right
        //reg1 is left, reg2 is right
        //reg1 = reg1 - reg2;
        //then
        //sgtz destReg reg1
        StringBuilder sb = new StringBuilder();
        sb.append("  xori  ");
        sb.append(destReg);
        sb.append(",");
        sb.append(reg1);
        sb.append(",");
        sb.append("1");
        return sb.toString();
    }
    public static String addLable(Integer label) {
        return ".L" + label + ":";
    }
    public static String jumpLable(Integer label) {
        return "  j     " + ".L" + label;
    }

    public static String branchNotEqualZero (String reg1, String offseLabel) {

        StringBuilder sb = new StringBuilder();
        sb.append("  bnez  ");
        sb.append(reg1);
        sb.append(",");
        sb.append(offseLabel);
        return sb.toString();
    }
    public static String branchEqualZero (String reg1, String offseLabel) {

        StringBuilder sb = new StringBuilder();
        sb.append("  beqz  ");
        sb.append(reg1);
        sb.append(",");
        sb.append(offseLabel);
        return sb.toString();
    }

    public static String or(String destReg,  String reg1, String reg2) {
        StringBuilder sb = new StringBuilder();
        sb.append(add(destReg, reg1, reg2));
        sb.append(System.lineSeparator());
        sb.append("  snez  ");
        sb.append(destReg);
        sb.append(",");
        sb.append(reg1);
        return sb.toString();
    }
}
