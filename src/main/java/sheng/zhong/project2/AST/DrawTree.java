package sheng.zhong.project2.AST;

import guru.nidi.graphviz.attribute.Label;
import guru.nidi.graphviz.engine.Format;
import guru.nidi.graphviz.engine.Graphviz;
import guru.nidi.graphviz.model.MutableGraph;
import guru.nidi.graphviz.model.MutableNode;

import java.io.File;
import java.io.IOException;
import java.util.*;

import static guru.nidi.graphviz.model.Factory.*;

public class DrawTree {

    public static void draw(Node root, String file) {
        HashMap<Node, MutableNode> map = new HashMap<>();
        List<Node> list = new ArrayList<>();

        levelOrder(root, map, list);
        MutableGraph g = mutGraph("example1").setDirected(true);
        //for (Map.Entry<Node, MutableNode> entry : map.entrySet()) {
        for (Node cur : list) {
            //int numChild = entry.getKey().jjtGetNumChildren();
            int numChild = cur.jjtGetNumChildren();
            MutableNode source = map.get(cur);
            for (int i = 0; i < numChild; i++) {
                MutableNode target = map.get(cur.jjtGetChild(i));
                g.add(source.addLink(target));
            }
        }

        try {
            Graphviz.fromGraph(g).width(2000).height(1500).render(Format.PNG).toFile(new File(file + ".png"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private static void levelOrder(Node root, HashMap<Node, MutableNode> map, List<Node> nodeList) {
        Integer nodeID = 1;
        Deque<Node> queue = new ArrayDeque<>();
        queue.offerLast(root);
        while (!queue.isEmpty()) {
            Node cur = queue.pollFirst();
            nodeList.add(cur);
            map.put(cur, mutNode(nodeID.toString()).add(Label.html(cur.toString())));

            int numChild = cur.jjtGetNumChildren();
            for (int i = 0; i < numChild; i++) {
                queue.offerLast(cur.jjtGetChild(i));
            }
            nodeID++;
        }
    }
}
