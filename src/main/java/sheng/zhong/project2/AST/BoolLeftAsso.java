package sheng.zhong.project2.AST;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.HashMap;

public class BoolLeftAsso {
    public static HashMap<String, Integer> nodeIdMap = new HashMap<>();

    public BoolLeftAsso() {
        String[] nodeNames = ShengTreeConstants.jjtNodeName;
        for (int i = 0; i < nodeNames.length; i++) {
            nodeIdMap.put(nodeNames[i], i);
        }
    }

    public static Node boolLeftAsso(Node root) {
        Node tmpRoot = boolPreOrder(root);
        int parNum = countPar(tmpRoot);
        for (int i = 0; i < parNum; i ++) {
            tmpRoot = boolPreOrderForPar(tmpRoot);
        }
        tmpRoot = removeBFactor(tmpRoot);

        return tmpRoot;
    }

    public static int countPar(Node root) {
        int boolPar = nodeIdMap.get(NodeUtils.BOOLPAR);
        if (root.jjtGetNumChildren() == 0) {
            return 0;
        }
        int num = 0;

        if (root.getId() == boolPar) {
            num = 1;
        }
        int numChild = root.jjtGetNumChildren();
        int result = num;
        for (int i = 0; i < numChild; i++) {
            result = Math.max(result, result + countPar(root.jjtGetChild(i)));
        }
        return result;
    }

    public static Node boolPreOrder(Node root) {
        Node result = root;
        Deque<Node> stack = new ArrayDeque<Node>();
        if (root.getId() == nodeIdMap.get(NodeUtils.OR)) {
            return toLeftAsso(root);
        } else {
            stack.offerFirst(root);
        }

        while (!stack.isEmpty()) {
            Node cur = stack.pollFirst();
            int childrenNum = cur.jjtGetNumChildren();
            if (childrenNum > 0) {
                for (; childrenNum > 0; childrenNum--) {
                    Node child = cur.jjtGetChild(childrenNum - 1);
                    if (child.getId() == nodeIdMap.get(NodeUtils.OR)) {
                        Node tmp = toLeftAsso(child);
                        cur.setChildren(childrenNum - 1, tmp);
                        tmp.jjtSetParent(cur);
                    } else if (child.getId() != nodeIdMap.get(NodeUtils.BOOLPAR)){
                        stack.offerFirst(child);
                    }
                }
            }
        }
        return result;
    }

    private static Node boolPreOrderForPar(Node root) {
        Node result = root;
        int boolPar = nodeIdMap.get(NodeUtils.BOOLPAR);
        Deque<Node> stack = new ArrayDeque<Node>();
        if (root.getId() == boolPar) {
            return toLeftAsso(root.jjtGetChild(0));
        } else {
            stack.offerFirst(root);
        }

        while (!stack.isEmpty()) {
            Node cur = stack.pollFirst();
            int childrenNum = cur.jjtGetNumChildren();
            if (childrenNum > 0) {
                for (; childrenNum > 0; childrenNum--) {
                    Node child = cur.jjtGetChild(childrenNum - 1);
                    if (child.getId() == boolPar) {
                        //par
                        //deal seperatly
                        Node tmp = toLeftAsso(child.jjtGetChild(0));
                        cur.setChildren(childrenNum - 1, tmp);
                        tmp.jjtSetParent(cur);
                    }else {
                        stack.offerFirst(child);
                    }
                }
            }
        }
        return result;
    }

    private static Node toLeftAsso(Node root) {
        Deque<Node> nodeQueue = new ArrayDeque<>();
        Deque<Node> operQueue = new ArrayDeque<>();
        inOrder(nodeQueue, operQueue, root);
        if (operQueue.isEmpty()) {
            return root;
        }
        int boolPar = nodeIdMap.get(NodeUtils.BOOLPAR);
        int and = nodeIdMap.get(NodeUtils.AND);
        int bFactor = nodeIdMap.get(NodeUtils.BFACTOR);
        Node tmpRoot = null;
        while (!operQueue.isEmpty()) {
            Node tmp1 = nodeQueue.pollLast();
            Node tmp2 = nodeQueue.pollLast();
            if (tmpRoot == null && tmp1.getId() != and && tmp1.getId() != boolPar && tmp1.getId() != bFactor) {
                tmp1.clear();
            }
            if (tmp2.getId() != and && tmp2.getId() != boolPar && tmp2.getId() != bFactor) {
                tmp2.clear();
            }

            tmpRoot = operQueue.pollLast();
            tmpRoot.clear();

            tmpRoot.jjtAddChild(tmp1, 0); //left child
            tmpRoot.jjtAddChild(tmp2, 1); //right child
            tmp1.jjtSetParent(tmpRoot);
            tmp2.jjtSetParent(tmpRoot);
            nodeQueue.offerLast(tmpRoot);
        }
        return tmpRoot;
    }

    private static void inOrder(Deque<Node> nodeQueue, Deque<Node> operQueue, Node root) {
        if (root.getId() == nodeIdMap.get(NodeUtils.BFACTOR)) {
            nodeQueue.offerFirst(root);
            return;
        } else if (root.getId() == nodeIdMap.get(NodeUtils.AND) || root.getId() == nodeIdMap.get(NodeUtils.BOOLPAR)) {
            nodeQueue.offerFirst(root);
            return;
        }
        inOrder(nodeQueue, operQueue, root.jjtGetChild(0));
        if (root.getId() == nodeIdMap.get(NodeUtils.OR)) {
            operQueue.offerFirst(root);
        } else {
            nodeQueue.offerFirst(root);
        }
        inOrder(nodeQueue, operQueue, root.jjtGetChild(1));
    }

    public static Node removeBFactor(Node root) {
        Node result = root;
        Deque<Node> stack = new ArrayDeque<Node>();
        if (root.getId() == nodeIdMap.get(NodeUtils.BFACTOR)) {
            Node child = root.jjtGetChild(0);
            child.jjtSetParent(null);
            return child;
        } else {
            stack.offerFirst(root);
        }

        while (!stack.isEmpty()) {
            Node cur = stack.pollFirst();
            int childrenNum = cur.jjtGetNumChildren();
            if (childrenNum > 0) {
                for (; childrenNum > 0; childrenNum--) {
                    Node child = cur.jjtGetChild(childrenNum - 1);
                    if (child.getId() == nodeIdMap.get(NodeUtils.BFACTOR)) {
                        Node tmp = child.jjtGetChild(0);
                        while (tmp.getId() == nodeIdMap.get(NodeUtils.BFACTOR)) {
                            tmp = tmp.jjtGetChild(0);
                        }
                        cur.setChildren(childrenNum - 1, tmp);
                        tmp.jjtSetParent(cur);
                        stack.offerFirst(tmp);
                    } else {
                        stack.offerFirst(child);
                    }
                }
            }
        }
        return result;
    }

}
