package sheng.zhong.project2.optimize;

import org.omg.CORBA.CharSeqHelper;
import sheng.zhong.project2.CFG.Block;
import sheng.zhong.project2.CFG.BlockUtils;
import sheng.zhong.project2.CFG.FlowGraph;
import sheng.zhong.project2.CFG.LiveSet;

import java.util.*;

public class LivenessUtils {

    public static void reSet(FlowGraph flowGraph) {
        Map<Integer, Block> blockMap = flowGraph.blockMap;
        for (Map.Entry<Integer, Block> entry : blockMap.entrySet()) {
            if (entry.getValue().label != -2) {
                entry.getValue().liveSetIn = new LiveSet(entry.getValue().label, true);
                entry.getValue().liveSetExit = new LiveSet(entry.getValue().label, false);
            }
        }
    }

    public static void showLivenessEquations(FlowGraph flowGraph) {
        System.out.println();
        System.out.println();
        System.out.println();

        System.out.println("******* Equations for liveness analysis *********");
        Map<Integer, Block> blockMap = flowGraph.blockMap;
        int size = blockMap.size() - 2;
        for (int i = 0; i < size; i++) {
            System.out.println(blockMap.get(i).ToStringLiveIn());
            System.out.println(blockMap.get(i).ToStringLiveOut());
        }
    }

    public static void analyzeLiveness(FlowGraph flowGraph, Set<String> vars, Set<String> output) {

        showLivenessEquations(flowGraph);
        //vars are all the variables appeared in the program
        //output are variables need to be kept in output

        Map<Integer, Block> blockMap = flowGraph.blockMap;
        int size = blockMap.size() - 2; //start and end block doesn't count
        //init -- all vars are alive
        Block exitBlock = blockMap.get(-2);

        if (output.size() == 0) {
            //if not specify output variables then all the variables need to be kept at output
            for (String var : vars) {
                exitBlock.liveSetIn.add(var);
            }
        } else {
            for (String var : output) {
                exitBlock.liveSetIn.add(var);
            }
        }


        boolean stop = false;
        while(!stop) {
            stop = true;
            for (int i = 0; i < size; i++) {
                if (calculateIn(blockMap.get(i))) {
                    stop = false; //continue
                }
                if (calculateExit(blockMap.get(i))) {
                    stop = false; //continue
                }
            }
        }

    }

    private static boolean calculateIn(Block curBlock) {
        //gen() + (exit \ kill)
        //return true if InSet has any change
        boolean result = false;
        Set<String> killSet = kill(curBlock);
        Set<String> genSet = gen(curBlock);
        Set<String> tmp = new HashSet<>(curBlock.liveSetExit.set);

        //kill first, since var on lhs may be used on rhs
        tmp.removeAll(killSet);
        tmp.addAll(genSet);

        for (String var : tmp) {
            if (curBlock.liveSetIn.add(var)) {
                result = true;
            }
        }
        return result;
    }

    private static boolean calculateExit(Block curBlock) {
        //add all successive inSet
        boolean result = false;
        List<Block> preBlocks= curBlock.getNext();
        for (Block preBlock : preBlocks) {
            for (String var : preBlock.liveSetIn.set) {
                if (curBlock.liveSetExit.add(var)) {
                    result = true;
                }
            }
        }
        return result;
    }

    private static Set<String> gen(Block curBlock) {
        /*
            for assignment block
              generate variables on R.H.S
         */
        /*
            For condition block
              generate variables appeared in boolean expression
         */
        Set<String> result = new HashSet<>();
        result.addAll(curBlock.varsNodeMap.keySet());
        return result;
    }
    private static Set<String> kill(Block curBlock) {
          /*
            for assignment block
              kill variables that been assigned.
         */
        /*
            For condition block
             do nothing
         */
        Set<String> result = new HashSet<>();
        if (BlockUtils.isAssign(curBlock)) {
            result.add(curBlock.lhsVar);
        }
        return result;
    }
}
