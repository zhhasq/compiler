package sheng.zhong.project2.parser;

import sheng.zhong.project2.AST.Node;
import sheng.zhong.project2.AST.NodeIDMap;
import sheng.zhong.project2.AST.NodeUtils;
import sheng.zhong.project2.AST.SimpleNode;
import sheng.zhong.project2.statckmachine.CodeTuple;
import sheng.zhong.project2.statckmachine.StackMachine;
import sheng.zhong.project2.statckmachine.StackMachineCode;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ParseExp {
    public static Map<Node, StackMachine> toStackMachine(Node root) {
        List<Node> expNodeList = findExpNode(root);
        Map<Node, StackMachine> map = new HashMap<>();
        for (Node node : expNodeList) {
            map.put(node, toStackMachineHelper(node));
        }
        return map;
    }

    public static StackMachine toStackMachineHelper(Node arithNode) {
        StackMachine stackMachine = new StackMachine(arithNode);
        stackMachine.toStackMachineCode();
        return stackMachine;
    }

    public static List<Node> findExpNode(Node root) {
        List<Node> expNodeList = new ArrayList<>();
        preOrder(root, expNodeList);
        return expNodeList;
    }

    private static void preOrder(Node root, List<Node> result) {
        if (root.jjtGetNumChildren() == 0) {
            if (NodeIDMap.isExp(root)) {
                result.add(root);
                if (NodeIDMap.isBoolExp(root)) {
                    SimpleNode tmp = (SimpleNode) root;
                    SimpleNode parent = (SimpleNode) root.jjtGetParent();
                    tmp.setLabel(parent.getLabel());
                    parent.setLabel(-1);
                }
            }
            return;
        }

        if (NodeIDMap.isExp(root)) {
            //swap label
            if (NodeIDMap.isBoolExp(root)) {
                SimpleNode tmp = (SimpleNode) root;
                SimpleNode parent = (SimpleNode) root.jjtGetParent();
                tmp.setLabel(parent.getLabel());
                parent.setLabel(-1);
            }
            result.add(root);
            return;
        }

        int childNum = root.jjtGetNumChildren();
        if (NodeIDMap.isAssign(root)) {
            for (int i = 1; i < childNum; i++) {
                preOrder(root.jjtGetChild(i), result);
            }
        } else {
            for (int i = 0; i < childNum; i++) {
                preOrder(root.jjtGetChild(i), result);
            }
        }
    }



}
