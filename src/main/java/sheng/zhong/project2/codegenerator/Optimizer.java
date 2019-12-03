package sheng.zhong.project2.codegenerator;

import sheng.zhong.project2.AST.*;
import sheng.zhong.project2.CFG.*;

import java.util.*;

public class Optimizer {
    Generator slowGenerator;
    //fields for project3
    public FlowGraph flowGraph;
    public Map<ReachingDef, List<ReachingDef>> dataFlowEquations;


    public Optimizer(Generator slowGenerator) {
        this.slowGenerator = slowGenerator;
    }

    public void generateFlowGraph() {
        this.flowGraph = new FlowGraph(this.slowGenerator.root);
        flowGraph.generateFlowGraph();
        DrawCFG.draw(flowGraph.blockMap, flowGraph.start, slowGenerator.path + "/" + slowGenerator.file);
    }

//    public void generateDataFlowEquations() {
//        this.dataFlowEquations = new HashMap<>();
//        Map<Integer, Block> blockMap = flowGraph.blockMap;
//        int numBlocks = blockMap.size() - 2; //start and end doesn't count
//        for (int i = 0; i < numBlocks; i++) {
//            Block cur = blockMap.get(i);
//            List<ReachingDef> tmp = new ArrayList<>();
//            for (Block preBlock : cur.getPre()) {
//                tmp.add(preBlock.reachingDefExit);
//            }
//            dataFlowEquations.put(cur.reachingDefIn, tmp);
//        }
//    }

    public void showDataFlowEquations() {
        System.out.println("-------- Data flow equations:");

        this.dataFlowEquations = new HashMap<>();
        Map<Integer, Block> blockMap = flowGraph.blockMap;
        int numBlocks = blockMap.size() - 2; //start and end doesn't count
        for (int i = 0; i < numBlocks; i++) {
            Block cur = blockMap.get(i);
            List<ReachingDef> tmp = new ArrayList<>();
            for (Block preBlock : cur.getPre()) {
                tmp.add(preBlock.reachingDefExit);
            }
            dataFlowEquations.put(cur.reachingDefIn, tmp);
            //print out
            System.out.print(cur.reachingDefIn + " = ");
            for (int j = 0; j < tmp.size(); j++) {
                if (j != 0) {
                    System.out.print(" U " + tmp.get(j));
                } else {
                    System.out.print(tmp.get(j));
                }
            }
            System.out.println();
            System.out.println(cur.ToStringRDOut());
        }
    }

    public void calculateDataFlowEquations() {
        Map<Integer, Block> blockMap = flowGraph.blockMap;
        //first init the start block which will initialize all the variables
        Block startBlock = blockMap.get(-1);
        for (String var : slowGenerator.vars) {
            startBlock.reachingDefIn.add(var, -1);
        }
        startBlock.calculateExitRD();

        int numBlocks = blockMap.size() - 2; //start and end doesn't count
        boolean isChanged = true;
        while (isChanged) {
            isChanged = false;
            for (int i = 0; i < numBlocks; i++) {
                Block cur = blockMap.get(i);
                //first calculate in
                List<ReachingDef> tmp = dataFlowEquations.get(cur.reachingDefIn);
                if (mergeReachingDef(cur.reachingDefIn, tmp)) {
                    isChanged = true;
                }
                //calculate out
                cur.calculateExitRD();
            }
        }
    }

    public void showReachingDef() {
        System.out.println("******** Reaching Definition result:");
        Map<Integer, Block> blockMap = this.flowGraph.blockMap;
        int numBlocks = blockMap.size() - 2; //start and end doesn't count

        for (int i = 0; i < numBlocks; i++) {
            System.out.println(blockMap.get(i).reachingDefIn.toStringWithSet());
            System.out.println(blockMap.get(i).reachingDefExit.toStringWithSet());
        }
    }

    public boolean mergeReachingDef(ReachingDef dst, List<ReachingDef> source) {
        boolean result = false;
        if (source != null) {
            for (ReachingDef rd : source) {
                if (dst.add(rd)) {
                    result = true;
                }
            }
        }

        return result;
    }

    public void constantFolding() {
        //note: this method can only be called after solve the RD equations.
        //will modify the AST from slowGenerator;
        //need the solution of RD


        Map<Integer, Integer> isLabelCons = new HashMap<>();
        findConsLabel(this.flowGraph, isLabelCons);
        //1. first find vars for all blocks
        extractVar(this.flowGraph);

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
                        }
                        stop = false;
                    }
                }
                for (String replacedVar : replaced) {
                    curBlock.varsNodeMap.remove(replacedVar);
                }
                //3. merge some sub-expression in arith exp
                if (BlockUtils.isAssign(curBlock)) {
                    Node tmp = mergeArithExp(curBlock.node.jjtGetChild(1), false, curBlock);
                    if (tmp != null) {
                        stop = false;
                        if (NodeIDMap.isInt(curBlock.node.jjtGetChild(1))) {
                            if (isLabelCons.get(curBlock.label) == null) {
                                isLabelCons.put(curBlock.label, Integer.valueOf(curBlock.node.jjtGetChild(1).toString()));
                            }
                        }
                    }
                } else if (BlockUtils.isCondition(curBlock)) {
                    for (Node curArithNode : curBlock.arithNodes) {
                        Node tmp = mergeArithExp(curArithNode,true, curBlock);
                        if (tmp != null) {
                            stop = false;
                        }
                    }
                }

                    //3.1 if assign, no vars on r h s and this label is not in isLabelCons
//                    if (BlockUtils.isAssign(curBlock) && curBlock.varsNodeMap.size() == 0 && isLabelCons.get(curBlock.label) == null) {
//
//                    }
                    //3.2 boolean exp has arith exp and no vars.

            }
        }
    }

    public static Node mergeArithExp(Node arithNode, boolean isConditionBlock, Block curBlock) {
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
                break;
            }
        }
    }


    public static Integer canReplaced(String var, ReachingDef rdIn, Map<Integer, Integer> consLabel) {
        Set<Integer> labels = rdIn.set.get(var);
        if (labels == null || labels.isEmpty()) {
            //error
            System.out.println("$$$$%%%%$$$$%%%%$$$$%%%% error  $$$$%%%%$$$$%%%%$$$$%%%%$$$$%%%%");
            System.out.println("at label " + rdIn.label + var + "is not defined");
            return null;
        } else if (labels.size() > 1){
            return null;
        } else {
            for (Integer label : labels) {
                Integer constant = consLabel.get(label);
                if (constant != null && constant != -1) {
                    return constant;
                }
            }
            return null;
        }
    }

    public static void extractVar(FlowGraph flowGraph) {
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

    public static void findArith(Block block) {
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

    public static void preOreder(Map<String, List<Node>> varsNodeMap, Node curNode) {
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

    public static void findConsLabel(FlowGraph flowGraph, Map<Integer, Integer> isLabelCons) {
        Map<Integer, Block> blockMap = flowGraph.blockMap;
        for (Map.Entry<Integer, Block> entry : blockMap.entrySet()) {
            Block curBlock = entry.getValue();
            if (curBlock.label == -1 || curBlock.label == -2) {
                continue;
            } else {
                Node curNode = curBlock.node;
                if (NodeIDMap.isAssign(curNode)) {
                    if (isArithExpCons(curNode.jjtGetChild(1))) {
                        isLabelCons.put(curBlock.label, Integer.valueOf(curNode.jjtGetChild(1).toString()));
                    } else {
                        continue;
                    }
                }
            }
        }
    }

    public static boolean isArithExpCons(Node arithExpNode) {
        return NodeIDMap.isInt(arithExpNode);
    }

    public void checkBlockVars() {
        Map<Integer, Block> blockMap = flowGraph.blockMap;
        int size = blockMap.size() - 2;
        for (int i = 0; i < size; i++) {
            System.out.println("label: " + i + "--" + blockMap.get(i).checkVars());
        }
    }
    public void drawNewAst() {
        DrawTree.draw(this.slowGenerator.root, this.slowGenerator.path + "/" + "newAST" + slowGenerator.file);
    }
}