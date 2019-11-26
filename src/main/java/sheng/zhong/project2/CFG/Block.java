package sheng.zhong.project2.CFG;

import sheng.zhong.project2.AST.Node;
import sheng.zhong.project2.AST.NodeIDMap;
import sheng.zhong.project2.AST.NodeUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public abstract class Block {
    public List<Block> in;
    public Node node;
    int label;
    public ReachingDef reachingDefIn;
    public ReachingDef reachingDefExit;

    public Block(Node node) {
        in = new ArrayList<>();
        this.label = node.getLabel();
        this.node = node;
        reachingDefIn = new ReachingDef(this.label, true);
        reachingDefExit = new ReachingDef(this.label, false);
    }
    public Block(int label) {
        in = new ArrayList<>();
        this.label = label;
        this.node = null;
        reachingDefIn = new ReachingDef(this.label, true);
        reachingDefExit = new ReachingDef(this.label, false);
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
}
