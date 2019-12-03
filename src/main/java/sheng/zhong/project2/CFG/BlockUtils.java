package sheng.zhong.project2.CFG;

import sheng.zhong.project2.AST.NodeIDMap;

public class BlockUtils {
    public static boolean isAssign(Block block) {
        return NodeIDMap.isAssign(block.node);
    }
    public static boolean isCondition(Block block) {
        return NodeIDMap.isBoolExp(block.node);
    }
}
