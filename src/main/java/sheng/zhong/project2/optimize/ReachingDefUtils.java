package sheng.zhong.project2.optimize;

import sheng.zhong.project2.CFG.Block;
import sheng.zhong.project2.CFG.FlowGraph;
import sheng.zhong.project2.CFG.ReachingDef;

import java.util.*;

public class ReachingDefUtils {

    static void showDataFlowEquations(FlowGraph flowGraph, Map<ReachingDef, List<ReachingDef>> dataFlowEquations) {
        System.out.println("-------- Data flow equations:");

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

    static void calculateDataFlowEquations(FlowGraph flowGraph, Set<String> vars, Map<ReachingDef, List<ReachingDef>> dataFlowEquations) {
        Map<Integer, Block> blockMap = flowGraph.blockMap;
        //first init the start block which will initialize all the variables
        Block startBlock = blockMap.get(-1);
        for (String var : vars) {
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

    private static boolean mergeReachingDef(ReachingDef dst, List<ReachingDef> source) {
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
}
