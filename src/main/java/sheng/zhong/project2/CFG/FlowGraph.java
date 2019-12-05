package sheng.zhong.project2.CFG;

import sheng.zhong.project2.AST.Node;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import static sheng.zhong.project2.CFG.BlockFactory.generateCommands;

public class FlowGraph {
    public Block start = null;
    Node astRoot;
    public Map<Integer, Block> blockMap; //will be updated when draw the CFG

    public FlowGraph(Node astRoot) {
        this.astRoot = astRoot;
        blockMap = new HashMap<>();
    }

    public void generateFlowGraph() {
        //the 0th child of asRoot is commands node
        this.start = new GeneralBlock(-1);
        Block end = new GeneralBlock(-2);
        generateCommands(Arrays.asList(new Block[]{this.start}), end, astRoot.jjtGetChild(0));
    }
    public void drawCFG(String path, boolean drawLiveSet) {
        DrawCFG.draw(this.blockMap, this.start, path, drawLiveSet);
    }

}
