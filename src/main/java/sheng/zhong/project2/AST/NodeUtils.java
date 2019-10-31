package sheng.zhong.project2.AST;

public class NodeUtils {
    public static final String ADD = "Add";
    public static final String INT = "Int";
    public static final String ID = "Id";

    public static final String ADDPAR = "AddPar";
    public static final String OR = "Or";

    public static final String MULT = "Mult";
    public static final String BOOLPAR = "BoolPar";
    public static final String AND = "And";
    public static final String BFACTOR = "BFactor";
    public static final String BNOT = "BNot";
    public static final String RELATION = "Relation";
    public static final String BLITER = "BLiteral";

    public static final String ASSIGN = "Assign";
    public static final String COMMANDS = "Commands";
    public static final String WHILE = "While";
    public static final String SKIP = "Skip";
    public static final String IF = "If";

    public static String expToString(Node node) {
        if (NodeIDMap.isExp(node)) {
            StringBuilder sb = new StringBuilder();
            inOrder(node, sb);
            return sb.toString();
        } else {
            return "current node is not expression";
        }
    }
    private static void inOrder(Node root, StringBuilder sb) {
        if (root.jjtGetNumChildren() == 0) {
            sb.append(root.toString() + " ");
            return;
        }
        sb.append("(");
        if (NodeIDMap.isNot(root)) {
            sb.append(root.toString());
            sb.append("(");
            sb.append(expToString(root.jjtGetChild(0)));
            sb.append(") ");

        } else {
            inOrder(root.jjtGetChild(0), sb);
            sb.append(root.toString() + " ");
            inOrder(root.jjtGetChild(1), sb);
        }
        sb.append(") ");
    }
//    "START",
//            "Commands",
//            "void",
//            "If",
//            "While",
//            "Skip",
//            "Assign",
//            "Add",
//            "Mult",
//            "Int",
//            "AddPar",
//            "Or",
//            "And",
//            "BFactor",
//            "BLiteral",
//            "BNot",
//            "Relation",
//            "BoolPar",
//            "Id",
}
