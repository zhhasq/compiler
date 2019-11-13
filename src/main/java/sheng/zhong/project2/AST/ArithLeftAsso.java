package sheng.zhong.project2.AST;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.HashMap;

public class ArithLeftAsso {

    public static HashMap<String, Integer> nodeIdMap = new HashMap<>();

    public static Node arithLeftAsso(Node root) {
        HashMap<String, Integer> indexMap = getIdToStringMap();
        int add = indexMap.get(NodeUtils.ADD);
        int id = indexMap.get(NodeUtils.ID);
        int intIndex = indexMap.get(NodeUtils.INT);
        int addPar = indexMap.get(NodeUtils.ADDPAR);
        int mul = indexMap.get(NodeUtils.MULT);
        int or = indexMap.get(NodeUtils.OR);
        int boolPar = indexMap.get(NodeUtils.BOOLPAR);
        //For arithmatic
        Node tmproot =  arithPreOrder(root, add, mul, id, intIndex, addPar);
        int parNum = countPar(tmproot, addPar);
        for (int i = 0; i < parNum; i ++) {
            tmproot = arithPreOrderForPar(tmproot,add, mul, id, intIndex, addPar );
        }
        return tmproot;
    }

    public static HashMap<String, Integer> getIdToStringMap() {
        HashMap<String, Integer> result = new HashMap<>();
        String[] nodeNames = ShengTreeConstants.jjtNodeName;
        for (int i = 0; i < nodeNames.length; i++) {
            result.put(nodeNames[i], i);
            nodeIdMap.put(nodeNames[i], i);
        }
        return result;
    }


    private static int countPar(Node root, int addPar) {
        if (root.jjtGetNumChildren() == 0) {
            return 0;
        }
        int num = 0;

        if (root.getId() == addPar) {
            num = 1;
        }
        int numChild = root.jjtGetNumChildren();
        int result = num;
        for (int i = 0; i < numChild; i++) {
            result = Math.max(result, result + countPar(root.jjtGetChild(i), addPar));
        }
        return result;

    }

    private static Node arithPreOrder(Node root, int add, int mul, int id, int intIndex, int addPar) {
        Node result = root;
        Deque<Node> stack = new ArrayDeque<Node>();
        if (root.getId() == add) {
            return addToLeftAsso(root, add, mul, id, intIndex, addPar);
        } else {
            stack.offerFirst(root);
        }

        while (!stack.isEmpty()) {
            Node cur = stack.pollFirst();
            int childrenNum = cur.jjtGetNumChildren();
            if (childrenNum > 0) {
                for (; childrenNum > 0; childrenNum--) {
                    Node child = cur.jjtGetChild(childrenNum - 1);
                    if (child.getId() == add) {
                        Node tmp = addToLeftAsso(child, add, mul, id, intIndex, addPar);
                        cur.setChildren(childrenNum - 1, tmp);
                        tmp.jjtSetParent(cur);
                    } else if (child.getId() != addPar){
                        stack.offerFirst(child);
                    }
                }
            }
        }
        return result;
    }


    private static Node arithPreOrderForPar(Node root, int add, int mul, int id, int intIndex, int addPar) {
        Node result = root;
        Deque<Node> stack = new ArrayDeque<Node>();
        if (root.getId() == addPar) {
            return addToLeftAsso(root.jjtGetChild(0), add, mul, id, intIndex, addPar);
        } else {
            stack.offerFirst(root);
        }

        while (!stack.isEmpty()) {
            Node cur = stack.pollFirst();
            int childrenNum = cur.jjtGetNumChildren();
            if (childrenNum > 0) {
                for (; childrenNum > 0; childrenNum--) {
                    Node child = cur.jjtGetChild(childrenNum - 1);
                    if (child.getId() == addPar) {
                        //par
                        //deal seperatly
                        Node tmp = addToLeftAsso(child.jjtGetChild(0), add, mul, id, intIndex, addPar);
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

    private static Node addToLeftAsso(Node root, int add, int mul, int id, int intIndex, int addPar) {
        Deque<Node> nodeQueue = new ArrayDeque<>();
        Deque<Node> operQueue = new ArrayDeque<>();
        inOrder(nodeQueue, operQueue, root, add, mul, id, intIndex, addPar);
        if (operQueue.isEmpty()) {
            return root;
        }
        Node tmpRoot = null;
        while (!operQueue.isEmpty()) {
            Node tmp1 = nodeQueue.pollLast();
            Node tmp2 = nodeQueue.pollLast();
            if (tmpRoot == null && tmp1.getId() != addPar && tmp1.getId() != mul) {
                tmp1.clear();
            }
            if (tmp2.getId() != addPar && tmp2.getId() != mul) {
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

    private static void inOrder(Deque<Node> nodeQueue, Deque<Node> operQueue, Node root, int add, int mul, int id, int intIndex, int addPar) {
        if (root.jjtGetNumChildren() == 0) {
            if (isArithOper(root)) {
                operQueue.offerFirst(root);
            } else {
                nodeQueue.offerFirst(root);
            }
            return;
        } else if (root.getId() == addPar || root.getId() == mul) {
            nodeQueue.offerFirst(root);
            return;
        }
        inOrder(nodeQueue, operQueue, root.jjtGetChild(0), add, mul, id, intIndex, addPar);
        if (isArithOper(root)) {
            operQueue.offerFirst(root);
        } else {
            nodeQueue.offerFirst(root);
        }
        inOrder(nodeQueue, operQueue, root.jjtGetChild(1), add, mul, id, intIndex, addPar);
    }
    private static boolean isArithOper(Node node) {
        int id = node.getId();
        return (id == nodeIdMap.get(NodeUtils.ADD) || id == nodeIdMap.get(NodeUtils.MULT));
    }
}
