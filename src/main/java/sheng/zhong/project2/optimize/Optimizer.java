package sheng.zhong.project2.optimize;

import sheng.zhong.project2.AST.*;
import sheng.zhong.project2.CFG.*;
import sheng.zhong.project2.codegenerator.Generator;

import java.util.*;

public class Optimizer {
    Generator slowGenerator;
    //fields for project3
    public FlowGraph flowGraph;
    public Map<ReachingDef, List<ReachingDef>> dataFlowEquations = new HashMap<>();
    public FlowGraph newFlowGraph;
    public RIG rig;
    public RIG colorRig;

    public Optimizer(Generator slowGenerator) {
        this.slowGenerator = slowGenerator;
    }

    public void generateFlowGraph() {
        this.flowGraph = new FlowGraph(this.slowGenerator.root);
        flowGraph.generateFlowGraph();
        flowGraph.drawCFG(slowGenerator.path + "/" + slowGenerator.file, false);
    }

    public void showDataFlowEquations(){
        ReachingDefUtils.showDataFlowEquations(this.flowGraph, dataFlowEquations);
    }

    public void showReachingDefSet() {
        //first solve
        ReachingDefUtils.calculateDataFlowEquations(this.flowGraph, this.slowGenerator.vars, this.dataFlowEquations);
        //then printOut
        System.out.println("******** Reaching Definition result:");
        Map<Integer, Block> blockMap = this.flowGraph.blockMap;
        int numBlocks = blockMap.size() - 2; //start and end doesn't count

        for (int i = 0; i < numBlocks; i++) {
            System.out.println(blockMap.get(i).reachingDefIn.toStringWithSet());
            System.out.println(blockMap.get(i).reachingDefExit.toStringWithSet());
        }
    }

    public void drawNewAst() {
        DrawTree.draw(this.slowGenerator.root, this.slowGenerator.path + "/" +  slowGenerator.file + "_new");
    }

    public void runConsFolding() {
        ConsFolding.constantFolding(this.flowGraph);
    }

    public void checkBlockVars() {
        Map<Integer, Block> blockMap = this.flowGraph.blockMap;
        int size = blockMap.size() - 2;
        for (int i = 0; i < size; i++) {
            System.out.println("label: " + i + "--" + blockMap.get(i).checkVars());
        }
    }

    public void runLivenessAnalysis() {
        LivenessUtils.analyzeLiveness(this.flowGraph, this.slowGenerator.vars, this.slowGenerator.output);
    }

    public void showLiveResult() {
        Map<Integer, Block> blockMap = this.flowGraph.blockMap;
        int size = blockMap.size() - 2;
        System.out.println("**************** Liveness ******************");
        for (int i = 0; i < size; i++) {
            Block curBlock = blockMap.get(i);
            System.out.print("LV" + i + "_In:   ");
//            for (String var : curBlock.liveSetIn.set) {
//                System.out.print(" " + var);
//            }
//            System.out.println("}");
            System.out.println(curBlock.liveSetIn.toString());

            System.out.print("LV" + i + "_Exit: ");
//            for (String var : curBlock.liveSetExit.set) {
//                System.out.print(" " + var);
//            }
//            System.out.println("}");
            System.out.println(curBlock.liveSetExit.toString());
        }
    }

    public void generateNewFlowGraph() {
        //CFG after constant folding
//        this.newFlowGraph = new FlowGraph(this.slowGenerator.root);
//        newFlowGraph.generateFlowGraph();
        this.flowGraph.drawCFG(slowGenerator.path + "/" + slowGenerator.file + "_new", true);
    }

    public void generateRIG() {
        rig = new RIG(this.slowGenerator.vars, this.flowGraph.blockMap);
        rig.buildRIG();
        rig.drawRIG(slowGenerator.path + "/" + slowGenerator.file);
    }

    public void solveColor() {
        RIG tmp = rig.deepCopyRIG();
        tmp.assignColor(11, tmp);
        tmp.drawRIG(slowGenerator.path + "/" + slowGenerator.file + "_Color");
    }

}
