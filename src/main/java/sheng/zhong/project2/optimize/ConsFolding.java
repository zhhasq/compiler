package sheng.zhong.project2.optimize;

import sheng.zhong.project2.AST.*;
import sheng.zhong.project2.CFG.Block;
import sheng.zhong.project2.CFG.BlockUtils;
import sheng.zhong.project2.CFG.FlowGraph;
import sheng.zhong.project2.CFG.ReachingDef;

import java.util.*;

public class ConsFolding {

    public static void constantFolding(FlowGraph flowGraph) {
        System.out.println();
        System.out.println();
        System.out.println();

        System.out.println("******* start constant Folding *********");
        //note: this method can only be called after solve the RD equations.
        //will modify the AST from slowGenerator;
        //need the solution of RD
        Map<Integer, Integer> isLabelCons = new HashMap<>();
        findConsLabel(flowGraph, isLabelCons);
        //1. first find vars for all blocks
        extractVar(flowGraph);

        boolean stop = false;
        int numLabel = flowGraph.blockMap.size() - 2;
        Map<Integer, Block> blockMap = flowGraph.blockMap;
        while (!stop) {
            stop = true;
            for (int i = 0; i < numLabel; i++) {
                Block curBlock = blockMap.get(i);

                //1. take all the variables from right subTree
                //2. if any can be replaced
                Set<String> replaced = new HashSet<>();
                for (Map.Entry<String, List<Node>> entry : curBlock.varsNodeMap.entrySet()) {
                    Integer constant = canReplaced(entry.getKey(), curBlock.reachingDefIn, isLabelCons);
                    if (constant != null) {
                        replaced.add(entry.getKey());
                        for (Node tmpNode : entry.getValue()) {
                            //replace node
                            ASTInt newNode = new ASTInt(NodeIDMap.getNodeIDMap().get(NodeUtils.INT));
                            newNode.setName(constant.toString());
                            replaceNode(tmpNode, newNode);
                            System.out.println("On label " + curBlock.label + " variable " + tmpNode.toString() + " is replaced by " + newNode.toString());
                        }
                        stop = false;
                    }
                }
                //remove the vars that been replaced from the block varsNodeMap
                for (String replacedVar : replaced) {
                    curBlock.varsNodeMap.remove(replacedVar);
                }

                //3. merge some sub-expression in arith exp
                if (BlockUtils.isAssign(curBlock)) {
                    Node tmp = mergeArithExp(curBlock.node.jjtGetChild(1), false, curBlock);
                    if (tmp != null) {
                        stop = false;
                    }
                } else if (BlockUtils.isCondition(curBlock)) {
                    HashSet<Node> arithNodesCopy = (HashSet<Node>) ((HashSet) curBlock.arithNodes).clone();
                    for (Node curArithNode : arithNodesCopy) {
                        Node tmp = mergeArithExp(curArithNode, true, curBlock);
                        if (tmp != null) {
                            stop = false;
                        }
                    }
                }
                //update isConsLabel
                if (BlockUtils.isAssign(curBlock) && NodeIDMap.isInt(curBlock.node.jjtGetChild(1))) {
                    if (isLabelCons.get(curBlock.label) == null) {
                        isLabelCons.put(curBlock.label, Integer.valueOf(curBlock.node.jjtGetChild(1).toString()));
                    }
                }
            }
        }
        System.out.println("******* End constant Folding *********");
    }

    private static Node mergeArithExp(Node arithNode, boolean isConditionBlock, Block curBlock) {
        //iterate all the node, if it is operator and both child are int then merge.
        //else return null
        if (NodeIDMap.isInt(arithNode) || NodeIDMap.isID(arithNode)) {
            return null;
        }
        Node left = mergeArithExp(arithNode.jjtGetChild(0), isConditionBlock, curBlock);
        Node right = mergeArithExp(arithNode.jjtGetChild(1), isConditionBlock, curBlock);

        if (NodeIDMap.isInt(arithNode.jjtGetChild(1))) {
            if (NodeIDMap.isInt(arithNode.jjtGetChild(0))) {
                Integer result = null;
                if (arithNode.toString().equals("+")) {
                    result = Integer.valueOf(arithNode.jjtGetChild(0).toString()) + Integer.valueOf(arithNode.jjtGetChild(1).toString());
                } else if (arithNode.toString().equals("-")) {
                    result = Integer.valueOf(arithNode.jjtGetChild(0).toString()) - Integer.valueOf(arithNode.jjtGetChild(1).toString());
                } else if (arithNode.toString().equals("*")) {
                    result = Integer.valueOf(arithNode.jjtGetChild(0).toString()) * Integer.valueOf(arithNode.jjtGetChild(1).toString());
                }
                ASTInt newNode = new ASTInt(NodeIDMap.getNodeIDMap().get(NodeUtils.INT));
                newNode.setName(result.toString());
                replaceNode(arithNode, newNode);
                if (isConditionBlock) {
                    if(curBlock.arithNodes.remove(arithNode)) {
                        curBlock.arithNodes.add(newNode);
                    }
                }
                return newNode;
            } else {
                return null;
            }
        } else {
            return left == null ? right : left;
        }
    }

    public static void replaceNode(Node replaced, Node newNode) {
        SimpleNode par = (SimpleNode) replaced.jjtGetParent();
        newNode.jjtSetParent(par);
        for (int j = 0; j < par.jjtGetNumChildren(); j++) {
            if (replaced == par.jjtGetChild(j)) {
                par.setChildren(j, newNode);
                newNode.setLabel(replaced.getLabel());
                break;
            }
        }
    }


    private static Integer canReplaced(String var, ReachingDef rdIn, Map<Integer, Integer> consLabel) {
        Set<Integer> labels = rdIn.set.get(var);
        if (labels == null || labels.isEmpty()) {
            //error
            System.out.println("$$$$%%%%$$$$%%%%$$$$%%%% error  $$$$%%%%$$$$%%%%$$$$%%%%$$$$%%%%");
            System.out.println("at label " + rdIn.label + var + "is not defined");
            return null;
        } else if (labels.size() > 1){
            List<Integer> tmp = new ArrayList<>();
            Integer constant = null;
            for (Integer label : labels) {
                if (consLabel.get(label) == null || label == -1) {
                    return null;
                } else {
                    tmp.add(consLabel.get(label));
                }
            }
            if (tmp.size() == labels.size()) {
                boolean same = true;
                Integer pre = tmp.get(0);
                for (int i = 1; i < tmp.size(); i++) {
                    Integer cur = tmp.get(i);
                    if (cur != pre) {
                        same = false;
                        break;
                    }
                    pre = cur;
                }
                if (same) {
                    return tmp.get(0);
                }
            }
            return null;
        } else {
            //labels.size() == 1
            for (Integer label : labels) {
                Integer constant = consLabel.get(label);
                if (constant != null && constant != -1) {
                    return constant;
                }
            }
            return null;
        }
    }

    private static void extractVar(FlowGraph flowGraph) {
        Map<Integer, Block> blockMap = flowGraph.blockMap;
        int numLabel = flowGraph.blockMap.size() - 2;
        for (int i = 0; i < numLabel; i++) {
            Block curBlock = blockMap.get(i);

            if (BlockUtils.isAssign(curBlock)) {
                preOreder(curBlock.varsNodeMap, curBlock.node.jjtGetChild(1));
            } else if (BlockUtils.isCondition(curBlock)) {
                findArith(curBlock);
                preOreder(curBlock.varsNodeMap, curBlock.node);
            }
        }
    }

    private static void findArith(Block block) {
        findArithPreOrder(block.arithNodes, block.node);
    }

    private static void findArithPreOrder(Set<Node> result, Node curNode) {
        if (curNode.jjtGetNumChildren() == 0) {
            if (NodeIDMap.isAriExp(curNode)) {
                result.add(curNode);
            }
            return;
        }

        if (NodeIDMap.isAriExp(curNode)) {
            result.add(curNode);
        } else {
            for (int i = 0; i < curNode.jjtGetNumChildren(); i++) {
                findArithPreOrder(result, curNode.jjtGetChild(i));
            }
        }
    }

    private static void preOreder(Map<String, List<Node>> varsNodeMap, Node curNode) {
        if (curNode.jjtGetNumChildren() == 0) {
            if (NodeIDMap.isID(curNode)) {
                List<Node> tmpList = varsNodeMap.get(curNode.toString());
                if (tmpList == null) {
                    tmpList = new ArrayList<>();
                    tmpList.add(curNode);
                    varsNodeMap.put(curNode.toString(), tmpList);
                } else {
                    tmpList.add(curNode);
                }
            }
            return;
        }
        if (NodeIDMap.isID(curNode)) {
            List<Node> tmpList = varsNodeMap.get(curNode.toString());
            if (tmpList == null) {
                tmpList = new ArrayList<>();
                tmpList.add(curNode);
                varsNodeMap.put(curNode.toString(), tmpList);
            } else {
                tmpList.add(curNode);
            }
        }
        for (int i = 0; i < curNode.jjtGetNumChildren(); i++) {
            preOreder(varsNodeMap, curNode.jjtGetChild(i));
        }
    }

    private static void findConsLabel(FlowGraph flowGraph, Map<Integer, Integer> isLabelCons) {
        Map<Integer, Block> blockMap = flowGraph.blockMap;
        for (Map.Entry<Integer, Block> entry : blockMap.entrySet()) {
            Block curBlock = entry.getValue();
            if (curBlock.label == -1 || curBlock.label == -2) {
                continue;
            } else {
                Node curNode = curBlock.node;
                if (NodeIDMap.isAssign(curNode)) {
                    curBlock.lhsVar = curNode.jjtGetChild(0).toString();
                    if (isArithExpCons(curNode.jjtGetChild(1))) {
                        isLabelCons.put(curBlock.label, Integer.valueOf(curNode.jjtGetChild(1).toString()));
                    } else {
                        continue;
                    }
                }
            }
        }
    }

    private static boolean isArithExpCons(Node arithExpNode) {
        return NodeIDMap.isInt(arithExpNode);
    }




}
