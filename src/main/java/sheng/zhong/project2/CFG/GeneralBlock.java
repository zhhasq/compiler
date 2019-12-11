package sheng.zhong.project2.CFG;

import sheng.zhong.project2.AST.Node;
import sheng.zhong.project2.AST.NodeIDMap;
import sun.rmi.runtime.NewThreadAction;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class GeneralBlock extends Block {
    public Block next;
    public GeneralBlock(Node node) {
        super(node);
    }

    public GeneralBlock(int label) {
        super(label);
    }

    @Override
    public void assignNext(Block nextBlock) {
        this.next = nextBlock;
    }

    @Override
    public void assignAfter(Block afterBlock) {
        assignNext(afterBlock);
    }

    @Override
    public List<Block> getNext() {
        List<Block> nextList = new ArrayList<>();

        if (next != null) {
            nextList.add(next);
        }
        return nextList;
    }

    @Override
    public int isConditionBlock() {
        return 0;
    }

    @Override
    public void calculateExitRD() {
        if (label == -1) {
            //RDOut = RDin
            this.reachingDefExit.add(this.reachingDefIn);
        } else if (NodeIDMap.isSkip(this.node)) {
            //RDOut = RDin
            this.reachingDefExit.add(this.reachingDefIn);
        } else {
            //assign
            this.reachingDefExit.add(this.reachingDefIn);
            //remove (var, l')
            this.reachingDefExit.remove(this.node.jjtGetChild(0).toString());
            //add (var, this.label)
            this.reachingDefExit.add(this.node.jjtGetChild(0).toString(), this.label);
        }
    }

    @Override
    public String ToStringRDOut() {
        //if assign, need to remove variable on the LHS with all other labels and add variable with current label
        if (NodeIDMap.isSkip(this.node)) {
            //RDOut = RDin
            StringBuilder sb = new StringBuilder();
            sb.append(this.reachingDefExit);
            sb.append(" = ");
            sb.append(this.reachingDefIn);
            return sb.toString();
        } else {
            //assign
            StringBuilder sb = new StringBuilder();
            sb.append(this.reachingDefExit + " = ");
            sb.append(this.reachingDefIn + " \\ ");
            //{(Var, l') | l' is labels}
            sb.append("{(");
            sb.append(this.node.jjtGetChild(0));
            sb.append(", l')} | l' is labels}");
            //U {(var, thislabel)}
            sb.append(" U {(");
            sb.append(this.node.jjtGetChild(0));
            sb.append(",");
            sb.append(this.label);
            sb.append(")}");
            return sb.toString();
        }
    }

    @Override
    public String ToStringLiveIn() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.liveSetIn.toString2());
        sb.append(" = {");
        for (Map.Entry<String, List<Node>> entry : this.varsNodeMap.entrySet()) {
            sb.append(entry.getKey());
            sb.append(", ");
        }

        if (sb.length() > 4 + this.liveSetIn.toString2().length()) {
            sb.deleteCharAt(sb.length() - 1);
            sb.deleteCharAt(sb.length() - 1);
        }
        sb.append("}");
        sb.append(" U ");
        sb.append("(");
        sb.append(this.liveSetExit.toString2());
        sb.append(" \\ ");
        sb.append("{");
        if (this.lhsVar != null) {
            sb.append(this.lhsVar);
        }
        sb.append("})");

        return sb.toString();
    }

    @Override
    public String ToStringLiveOut() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.liveSetExit.toString2());
        sb.append(" = ");
        for (Block nextBlock : this.getNext()) {
            sb.append(nextBlock.liveSetIn.toString2());
            sb.append(" U ");
        }
        sb.deleteCharAt(sb.length() - 1);
        sb.deleteCharAt(sb.length() - 1);
        sb.deleteCharAt(sb.length() - 1);
        return sb.toString();
    }
}
