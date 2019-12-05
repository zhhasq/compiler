package sheng.zhong.project2.optimize;

import guru.nidi.graphviz.attribute.Color;
import guru.nidi.graphviz.attribute.Label;
import guru.nidi.graphviz.engine.Format;
import guru.nidi.graphviz.engine.Graphviz;
import guru.nidi.graphviz.model.Link;
import guru.nidi.graphviz.model.MutableGraph;
import guru.nidi.graphviz.model.MutableNode;
import org.omg.CORBA.CharSeqHelper;

import java.io.File;
import java.io.IOException;
import java.util.*;

import static guru.nidi.graphviz.model.Factory.mutGraph;
import static guru.nidi.graphviz.model.Factory.mutNode;

public class DrawRig {
    public static void draw(RIG rig, String file, Map<RIG.RigNode, Integer> nodeColorMap) {
        HashMap<RIG.RigNode, MutableNode> map = new HashMap<>();
        Map<Integer, Color> colorTable = buildColorMap();

        BST(rig, map, nodeColorMap, colorTable);

        MutableGraph g = mutGraph("file").setDirected(false);
        Set<RIG.RigNode> visited = new HashSet<>();

        for (RIG.RigNode node : rig.nodeList) {
            MutableNode source = map.get(node);
            if (source == null) {
                System.out.println("error source is null, node is " + node.toString());
            }

            for (RIG.RigNode neighbor : node.neighbors) {
                if (!visited.contains(neighbor)) {
                    MutableNode target = map.get(neighbor);
                    if (target == null) {
                        System.out.println("error target is null, node is " + neighbor.toString());
                    }
                    Link link = source.linkTo(target).with(Label.of(""));
                    source.links().add(link);
                }
            }
            g.add(source);
            visited.add(node);
        }

        try {
            Graphviz.fromGraph(g).totalMemory(24000000).width(4000).height(3000).render(Format.PNG).toFile(new File(file + "_RIG.png"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private static void BST(RIG rig, HashMap<RIG.RigNode, MutableNode> map, Map<RIG.RigNode, Integer> nodeColorMap, Map<Integer, Color> colorTable) {
        Integer nodeID = 1;
        for (RIG.RigNode node : rig.nodeList) {
            if (nodeColorMap == null || nodeColorMap.isEmpty()) {
                map.put(node, mutNode(nodeID.toString()).add(Label.html(node.toString())).add(Color.BLACK));
            } else {
                if (nodeColorMap.get(node) == null) {
                    //this node is spilled
                    map.put(node, mutNode(nodeID.toString()).add(Label.html(node.toString())).add(Color.BLACK));
                } else {
                    map.put(node, mutNode(nodeID.toString()).add(Label.html(node.toString())).add(colorTable.get(nodeColorMap.get(node))));
                }
            }
            nodeID++;
        }
    }

    public static Map<Integer, Color>  buildColorMap() {
        Map<Integer, Color> colorMap = new HashMap<>();
        colorMap.put(1, Color.GREEN);
        colorMap.put(2, Color.RED);
        colorMap.put(3, Color.BLUE);
        colorMap.put(4, Color.BEIGE);
        colorMap.put(5, Color.ORANGE);
        colorMap.put(6, Color.AZURE);
        colorMap.put(7, Color.ALICEBLUE);
        colorMap.put(8, Color.AQUAMARINE);
        colorMap.put(9, Color.BISQUE);
        colorMap.put(10, Color.BROWN);
        colorMap.put(11, Color.CYAN);
        return colorMap;
    }
}
