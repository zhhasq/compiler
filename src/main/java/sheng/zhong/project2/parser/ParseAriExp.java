package sheng.zhong.project2.parser;

import sheng.zhong.project2.AST.Node;
import sheng.zhong.project2.AST.NodeIDMap;
import sheng.zhong.project2.statckmachine.StackMachine;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ParseAriExp {

    public static Map<Node, StackMachine> parseAllArith(Node root) {
        List<Node> arithNodeList = findTopArith(root);
        Map<Node, StackMachine> map = new HashMap<>();
        for (Node node : arithNodeList) {
            map.put(node, parseArith(node));
        }
        return map;
    }

    public static StackMachine parseArith(Node arithNode) {
        StackMachine stackMachine = new StackMachine(arithNode);
        stackMachine.toStackMachineCode();
        return stackMachine;
    }

    public static List<Node> findTopArith(Node root) {
        List<Node> arithNodeList = new ArrayList<>();
        preOrder(root, arithNodeList);
        return arithNodeList;
    }

    private static void preOrder(Node root, List<Node> result) {
        if (root.jjtGetNumChildren() == 0) {
            return;
        }
        if (NodeIDMap.isArithOper(root)) {
            result.add(root);
            return;
        }
        int childNum = root.jjtGetNumChildren();
        for (int i = 0; i < childNum; i++) {
            preOrder(root.jjtGetChild(i), result);
        }
    }


}
