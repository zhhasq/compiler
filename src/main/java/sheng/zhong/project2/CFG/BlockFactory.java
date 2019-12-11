package sheng.zhong.project2.CFG;

import sheng.zhong.project2.AST.Node;
import sheng.zhong.project2.AST.NodeIDMap;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class BlockFactory {

    public static List<Block> generateCommands(List<Block> preBlockList, Block end, Node commands) {
        //return the List blocks related to this commands node from AST
        //all the newly generated curBlock has to connect with all the blocks in preBlockList
        //If this commands node from Start, then a end block will be provided. else the end block is null.

        int numChild = commands.jjtGetNumChildren();
        List<Block> result = new ArrayList<>();
        Block curBlock = null;
        for (int i = 0; i < numChild; i++) {
            Node curNode = commands.jjtGetChild(i);
            if (NodeIDMap.isAssign(curNode)) {
                curBlock = generateAssiBlock(curNode);

                connectBlock(preBlockList, curBlock);
                //preBlock = curBlock;
                preBlockList = Arrays.asList(new Block[]{curBlock});
                if (i == numChild - 1) {
                    result.add(curBlock);
                }
            } else if (NodeIDMap.isSkip(curNode)) {
                //same as assign
                curBlock = generateSkipBlock(curNode);

//                connectBlock(preBlock, curBlock);
//                preBlock = curBlock;
                connectBlock(preBlockList, curBlock);
                preBlockList = Arrays.asList(new Block[]{curBlock});
                if (i == numChild - 1) {
                    result.add(curBlock);
                }
            } else if (NodeIDMap.isWhile(curNode)) {
                curBlock = generateWhileBlock(curNode);
//                connectBlock(preBlock, curBlock);
//                preBlock = curBlock;
                connectBlock(preBlockList, curBlock);
                preBlockList = Arrays.asList(new Block[]{curBlock});
                if (i == numChild - 1) {
                    result.add(curBlock);
                }
            } else if (NodeIDMap.isIf(curNode)) {
               List<Block> ifBlockList = generateIfBlock(curNode);
                connectBlock(preBlockList, ifBlockList.get(0));
                //curBlock = ifBlock[1];
                //preBlock = curBlock;
                preBlockList = ifBlockList.subList(1, ifBlockList.size());
                if (i == numChild - 1) {
                    result.addAll(preBlockList);
                }
            }
        }
        if (end != null) {
            connectBlock(preBlockList, end);
        }
        return result;
    }

    public static void connectBlock(List<Block> preBlockList, Block curBlock) {
        for (Block preBlock : preBlockList) {
            if (preBlock.getNext().size() > 0) {
                //while block already have yes branch, now need to go to no branch
                preBlock.assignAfter(curBlock);
            } else {
                //this is recursive call, while block need to go to yes branch,
                preBlock.assignNext(curBlock);
            }
            curBlock.assignPre(preBlock);
        }
    }

    public static Block generateAssiBlock(Node assign) {
        Block block = new GeneralBlock(assign);
        return block;
    }

    public static Block generateSkipBlock(Node skip) {
        Block block = new GeneralBlock(skip);
        return block;
    }

    public static Block generateWhileBlock(Node whileNode) {
        //use recursive way to generate
        //the last block of while commands node will point back to condition block
        //next block (no condition) will added by caller.
        //return the while block
        Block whileBlock = new ConditionBlock(whileNode.jjtGetChild(0));
        List<Block> preBlockList = new ArrayList<>(Arrays.asList(new Block[]{whileBlock}));

        List<Block> endBlockList = generateCommands(preBlockList, null, whileNode.jjtGetChild(1));
        for (Block endBlock : endBlockList) {
            endBlock.assignAfter(whileBlock);
            whileBlock.assignPre(endBlock);
        }


        return whileBlock;
    }

    public static List<Block> generateIfBlock(Node ifNode) {
        //return a Block array, 0 is condition block, rest are end blocks
        List<Block> result = new ArrayList<>();
        Block ifBlock = new ConditionBlock(ifNode.jjtGetChild(0));
        List<Block> preBlockList = new ArrayList<>(Arrays.asList(new Block[]{ifBlock}));

        List<Block> leftEndBlockList = generateCommands(preBlockList, null, ifNode.jjtGetChild(1));
        List<Block> rightEndBlockList = generateCommands(preBlockList, null, ifNode.jjtGetChild(2));

        result.add(ifBlock);
        result.addAll(leftEndBlockList);
        result.addAll(rightEndBlockList);

        return result;
    }
}
