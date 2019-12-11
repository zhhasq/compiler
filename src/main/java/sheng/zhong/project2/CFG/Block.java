package sheng.zhong.project2.CFG;

import sheng.zhong.project2.AST.Node;
import sheng.zhong.project2.AST.NodeIDMap;
import sheng.zhong.project2.AST.NodeUtils;

import java.util.*;

public abstract class Block {
    public List<Block> in;
    public Node node;
    public int label;
    public ReachingDef reachingDefIn;
    public ReachingDef reachingDefExit;
    public Map<String, List<Node>> varsNodeMap = new HashMap<>();
    public String lhsVar; //only assign block has this, null for other types blocks
    public Set<Node> arithNodes = new HashSet<>();
    public LiveSet liveSetIn;
    public LiveSet liveSetExit;

    public Block(Node node) {
        in = new ArrayList<>();
        this.label = node.getLabel();
        this.node = node;
        reachingDefIn = new ReachingDef(this.label, true);
        reachingDefExit = new ReachingDef(this.label, false);
        liveSetIn = new LiveSet(this.label, true);
        liveSetExit = new LiveSet(this.label, false);
    }
    public Block(int label) {
        in = new ArrayList<>();
        this.label = label;
        this.node = null;
        reachingDefIn = new ReachingDef(this.label, true);
        reachingDefExit = new ReachingDef(this.label, false);
        liveSetIn = new LiveSet(this.label, true);
        liveSetExit = new LiveSet(this.label, false);
    }

    @Override
    public String toString() {
        if (label == -1) {
            return "start";
        } else if (label == -2) {
            return "end";
        }  else {
            StringBuilder sb = new StringBuilder();
            //for (Node node : instructions) {
            sb.append("{" + node.getLabel() + "} ");
            if (NodeIDMap.isSkip(node)) {
                sb.append("skip");
            } else if (NodeIDMap.isAssign(node)) {
                sb.append(node.jjtGetChild(0).toString() + ":=" + NodeUtils.expToString(node.jjtGetChild(1)));
            } else {
                sb.append(NodeUtils.expToString(node));
            }
            // }
            return sb.toString();
        }
    }

    public String checkVars() {
        StringBuilder sb = new StringBuilder();
        sb.append("{");
        for (Map.Entry<String, List<Node>> entry : varsNodeMap.entrySet()) {
            for (Node node : entry.getValue()) {
                sb.append("(");
                sb.append(entry.getKey() + "," + node.toString());
                sb.append(")");
            }
        }
        sb.append("}");
        return sb.toString();
    }

    public String toStringGraph() {
        if (label == -1) {
            return "start";
        } else if (label == -2) {
            return "end";
        } else {
            StringBuilder sb = new StringBuilder();
            //for (Node node : instructions) {
            sb.append("{" + node.getLabel() + "} ");
            if (NodeIDMap.isSkip(node)) {
                sb.append("skip");
            } else {
                sb.append(NodeUtils.expToString(node));
            }
            sb.append("<br\\>");
            //}
            return sb.toString();
        }
    }

    public abstract void assignNext(Block nextBlock);
    public abstract void assignAfter(Block afterBlock);
    public void assignPre(Block preBlock) {
        this.in.add(preBlock);
    }
    public void assignPre(List<Block> preBlocks) {
        this.in.addAll(preBlocks);
    }
    public abstract List<Block> getNext();
    public List<Block> getPre() {
        return this.in;
    }

    public abstract String ToStringRDOut();
    public abstract int isConditionBlock(); //0 false, 1 while, 2 if
    public abstract void calculateExitRD();
    public abstract String ToStringLiveIn();
    public abstract String ToStringLiveOut();
}
