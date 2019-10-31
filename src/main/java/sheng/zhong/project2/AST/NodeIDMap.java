package sheng.zhong.project2.AST;

import java.util.HashMap;

public class NodeIDMap {
    public static HashMap<String, Integer> nodeIdMap = new HashMap<>();

    public static HashMap<String, Integer> getNodeIDMap() {
        if (nodeIdMap.isEmpty()) {
            String[] nodeNames = ShengTreeConstants.jjtNodeName;
            for (int i = 0; i < nodeNames.length; i++) {
                nodeIdMap.put(nodeNames[i], i);
            }
        }
        return nodeIdMap;
    }
    public static boolean isExp(Node node) {
        return isBoolExp(node) || isAriExp(node);
    }
    public static boolean isBoolExp(Node node) {
        return isBoolOper(node) || isBoolBase(node);
    }
    public static boolean isAriExp(Node node) {
        return isArithOper(node) || isArithBase(node);
    }

    public static boolean isBoolOper(Node node) {
        return (isAnd(node) || isOr(node) || isNot(node) || isRelation(node));
    }

    public static boolean isBoolBase(Node node) {
        return isBLiter(node);
    }

    public static boolean isArithOper(Node node) {
        if (nodeIdMap.isEmpty()) {
            getNodeIDMap();
        }
        return isAdd(node) || isMul(node);
    }

    public static boolean isArithBase(Node node) {
        if (nodeIdMap.isEmpty()) {
            getNodeIDMap();
        }
        return isID(node) || isInt(node);
    }

    public static boolean isAdd(Node node) {
        //include + and -
        if (nodeIdMap.isEmpty()) {
            getNodeIDMap();
        }
        return (node.getId() == nodeIdMap.get(NodeUtils.ADD));
    }

    public static boolean isMul(Node node) {
        if (nodeIdMap.isEmpty()) {
            getNodeIDMap();
        }
        return (node.getId() == nodeIdMap.get(NodeUtils.MULT));
    }

    public static boolean isID(Node node) {
        //include + and -
        if (nodeIdMap.isEmpty()) {
            getNodeIDMap();
        }
        return (node.getId() == nodeIdMap.get(NodeUtils.ID));
    }

    public static boolean isInt(Node node) {
        if (nodeIdMap.isEmpty()) {
            getNodeIDMap();
        }
        return (node.getId() == nodeIdMap.get(NodeUtils.INT));
    }

    public static boolean isAnd(Node node) {
        if (nodeIdMap.isEmpty()) {
            getNodeIDMap();
        }
        return (node.getId() == nodeIdMap.get(NodeUtils.AND));
    }
    public static boolean isOr(Node node) {
        if (nodeIdMap.isEmpty()) {
            getNodeIDMap();
        }
        return (node.getId() == nodeIdMap.get(NodeUtils.OR));
    }
    public static boolean isRelation(Node node) {
        if (nodeIdMap.isEmpty()) {
            getNodeIDMap();
        }
        return (node.getId() == nodeIdMap.get(NodeUtils.RELATION));
    }
    public static boolean isNot(Node node) {
        if (nodeIdMap.isEmpty()) {
            getNodeIDMap();
        }
        return (node.getId() == nodeIdMap.get(NodeUtils.BNOT));
    }
    public static boolean isBLiter(Node node) {
        if (nodeIdMap.isEmpty()) {
            getNodeIDMap();
        }
        return (node.getId() == nodeIdMap.get(NodeUtils.BLITER));
    }
    public static boolean isAssign(Node node) {
        if (nodeIdMap.isEmpty()) {
            getNodeIDMap();
        }
        return (node.getId() == nodeIdMap.get(NodeUtils.ASSIGN));
    }
    public static boolean isCommands(Node node) {
        if (nodeIdMap.isEmpty()) {
            getNodeIDMap();
        }
        return (node.getId() == nodeIdMap.get(NodeUtils.COMMANDS));
    }
    public static boolean isWhile(Node node) {
        if (nodeIdMap.isEmpty()) {
            getNodeIDMap();
        }
        return (node.getId() == nodeIdMap.get(NodeUtils.WHILE));
    }
    public static boolean isIf(Node node) {
        if (nodeIdMap.isEmpty()) {
            getNodeIDMap();
        }
        return (node.getId() == nodeIdMap.get(NodeUtils.IF));
    }
    public static boolean isSkip(Node node) {
        if (nodeIdMap.isEmpty()) {
            getNodeIDMap();
        }
        return (node.getId() == nodeIdMap.get(NodeUtils.SKIP));
    }
}
