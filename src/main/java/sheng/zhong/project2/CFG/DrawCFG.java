package sheng.zhong.project2.CFG;
import guru.nidi.graphviz.attribute.Color;
import guru.nidi.graphviz.attribute.Label;
import guru.nidi.graphviz.attribute.Style;
import guru.nidi.graphviz.engine.Format;
import guru.nidi.graphviz.engine.Graphviz;
import guru.nidi.graphviz.model.Link;
import guru.nidi.graphviz.model.MutableGraph;
import guru.nidi.graphviz.model.MutableNode;
import sheng.zhong.project2.AST.Node;
import sheng.zhong.project2.AST.NodeIDMap;

import java.io.File;
import java.io.IOException;
import java.util.*;

import static guru.nidi.graphviz.model.Factory.*;

public class DrawCFG {
    public static void draw(Map<Integer, Block> blockMap, Block root, String file) {
        HashMap<Block, MutableNode> map = new HashMap<>();
        List<Block> list = new ArrayList<>();

        BST(blockMap, root, map, list);
        MutableGraph g = mutGraph("file").setDirected(true);
        //for (Map.Entry<Node, MutableNode> entry : map.entrySet()) {
        for (Block cur : list) {
            //int numChild = entry.getKey().jjtGetNumChildren();
            int numChild = cur.getNext().size();
            MutableNode source = map.get(cur);

            if (numChild > 1) {
                //condition block
                Block curBlock = cur.getNext().get(0);
                MutableNode target = map.get(curBlock);
                Link link = source.linkTo(target).with(Label.of("No"), Color.RED);
                source.links().add(link);
                g.add(source);

                curBlock = cur.getNext().get(1);
                target = map.get(curBlock);
                link = source.linkTo(target).with(Label.of("Yes"), Color.GREEN);
                source.links().add(link);
                g.add(source);
            } else if (numChild == 0){
                g.add(source);
            } else {
                Block curBlock = cur.getNext().get(0);
                MutableNode target = map.get(curBlock);
                Link link = source.linkTo(target).with(Label.of(""));
                source.links().add(link);
                g.add(source);
            }

        }

        try {
            Graphviz.fromGraph(g).width(4000).height(3000).render(Format.PNG).toFile(new File(file + "cfg.png"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void BST(Map<Integer, Block> blockMap, Block root, HashMap<Block, MutableNode> map, List<Block> blockList) {
        Integer nodeID = 1;
        Set<Block> visited = new HashSet<>();
         Deque<Block> queue = new ArrayDeque<>();
         queue.offerLast(root);
         visited.add(root);
        blockMap.put(root.label, root);

         while(!queue.isEmpty()) {
             Block cur = queue.pollFirst();
             blockList.add(cur);
             blockMap.put(cur.label, cur);
             if (cur.isConditionBlock() == 1) {
                 //while
                 map.put(cur, mutNode(nodeID.toString()).add(Label.html(cur.toString())).add(Color.BLUE1));
             } else if (cur.isConditionBlock() == 2) {
                 //if
                 map.put(cur, mutNode(nodeID.toString()).add(Label.html(cur.toString())).add(Color.ORANGE));
             } else {
                 map.put(cur, mutNode(nodeID.toString()).add(Label.html(cur.toString())).add(Color.BLACK));
             }

             List<Block> nextList = cur.getNext();
             for (Block nextBlock : nextList) {
                 if (!visited.contains(nextBlock)) {
                     //in here will perform operations to remove ignore node for if
//                     if (nextBlock.label == -3) {
//                         nextBlock = removeIgnore(cur, nextBlock);
//                     }
                     queue.offerLast(nextBlock);
                     visited.add(nextBlock);
                 }
             }
             nodeID++;
         }
    }
//    private static Block removeIgnore(Block preBlock, Block ignoreBlock) {
//        //first find the non-ignore block
//        Block nonIgnore = ignoreBlock;
//        while (nonIgnore.label == -3) {
//            nonIgnore = nonIgnore.getNext().get(0);
//        }
//        preBlock.
//        return nonIgnore;
//    }

}
