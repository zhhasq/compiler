package sheng.zhong.project2.optimize;

import sheng.zhong.project2.CFG.Block;

import java.util.*;

public class RIG {
    //register interference graph
    //node for each var
    //an edge between t1 and t2 if they are live simultaneously at some point in the program
    //two vars can be allocated to the same register if there is no edge connecting them
    public List<RigNode> nodeList = new ArrayList<>();
    public Map<String, RigNode> rigNodeMap = new HashMap<>();
    public Map<RigNode, Integer> colorMap = new HashMap<>();

    Set<String> vars;
    Map<Integer, Block> blockMap;

    public RIG(Set<String> vars, Map<Integer, Block> blockMap) {
        this.vars = vars;
        this.blockMap = blockMap;
    }

    public void buildRIG() {
        for (String var : vars) {
            RigNode tmpNode = new RigNode(var);
            nodeList.add(tmpNode);
            rigNodeMap.put(var, tmpNode);
        }
        int size = blockMap.size() - 2;
        for (int i =0; i < size; i++) {
            buildOneSet(blockMap.get(i).liveSetIn.set);
            buildOneSet(blockMap.get(i).liveSetExit.set);
        }
        //for end node
        //buildOneSet(blockMap.get(-2).liveSetIn.set);
    }

    public void buildOneSet(Set<String> livenessSet) {
        List<String> tmp = new ArrayList<>(livenessSet);
        int size = tmp.size();
        for (int i = 0; i < size; i++) {
            for (int j = i + 1; j < size; j++) {
                connect(rigNodeMap.get(tmp.get(i)), rigNodeMap.get(tmp.get(j)));
            }
        }
    }

    public void connect(RigNode node1, RigNode node2) {
        node1.neighbors.add(node2);
        node2.neighbors.add(node1);
    }
    public void drawRIG(String file) {
        DrawRig.draw(this, file, colorMap);
    }

    static class RigNode {
        public String val;
        public Set<RigNode> neighbors;


        public RigNode(String val) {
            this.val = val;
            this.neighbors = new HashSet<>();
        }

        @Override
        public String toString() {
            return val;
        }
    }
    
    public RIG deepCopyRIG() {
        RIG newRig = new RIG(this.vars, this.blockMap);
        for (RigNode node : this.nodeList) {
            deepCopyRigNode(node, newRig.nodeList, newRig.rigNodeMap);
        }
        return newRig;
    }
    
    private RigNode deepCopyRigNode(RigNode node, List<RigNode> list, Map<String, RigNode> map) {

        RigNode newNode = map.get(node.val);

        if (newNode == null) {
            newNode = new RigNode(node.val);
            list.add(newNode);
            map.put(node.val, newNode);
        }

        for (RigNode neighbor : node.neighbors) {
            RigNode newNeighbor = map.get(neighbor.val);
            if (newNeighbor == null) {
                newNeighbor = new RigNode(neighbor.val);
                list.add(newNeighbor);
                map.put(neighbor.val, newNeighbor);
            }
            newNode.neighbors.add(newNeighbor);
        }
        return newNode;
    }

    public  Map<RigNode, Integer> assignColor(int numColor, RIG rig) {
        Deque<RigNode> stack = new ArrayDeque<>();
        Map<RigNode, Integer> result = new HashMap<>();
        HashSet<Integer> allColor = new HashSet<>();
        Set<Integer> unUnsedColor = new HashSet<>();

        for (int i = 1; i <= numColor; i++) {
            allColor.add(i);
        }

        while (rig.nodeList.size() > 0) {
            simplify(stack, rig, numColor);
        }

        while(!stack.isEmpty()) {
            select(stack.pollLast(), rig, result, (HashSet<Integer>)allColor.clone());
        }
        colorMap = result;
        return result;
    }

    private  void simplify(Deque<RigNode> statck, RIG rig, int numColor) {
        for (RigNode node : rig.nodeList) {
            if (node.neighbors.size() < numColor) {
                statck.offerLast(node);
                //remove node from the list and map
                rig.nodeList.remove(node);
                rig.rigNodeMap.remove(node.toString());
                //remove the edges that connect this node with other node
                for (RigNode neighbor : node.neighbors) {
                    neighbor.neighbors.remove(node);
                }
                return;
            }
        }

        //no node has number of edges less than numColor
        //random choose one to remove
        Random random = new Random();
        int randomIndex = random.nextInt(rig.nodeList.size());
        RigNode remove = rig.nodeList.get(randomIndex);
        //remove node from the list and map
        statck.offerLast(remove);
        rig.nodeList.remove(remove);
        rig.rigNodeMap.remove(remove);
        //remove the edges that connect this node with other node
        for (RigNode neighbor : remove.neighbors) {
            neighbor.neighbors.remove(remove);
        }
    }

    private  boolean select(RigNode node, RIG rig, Map<RigNode, Integer> map, Set<Integer> allColor) {
        //need to assign node a color that doesn't conflict with its neighbors
        //return true if the node is successfully assigned a color
        //return false if the node spilled

        //also need to reconstruct the rig graph
        rig.nodeList.add(node);
        rig.rigNodeMap.put(node.val, node);

        if (node.neighbors.size() == 0) {
            for (Integer color : allColor) {
                //choose one color
                map.put(node, color);
                return true;
            }
        } else {
            for (RigNode neighbor : node.neighbors) {
                //reconstruct the edge
                neighbor.neighbors.add(node);

                Integer neighborColor = map.get(neighbor);
                if (neighborColor != null) {
                    allColor.remove(neighborColor);
                }
            }
            if (allColor.size() > 0) {
                for (Integer color : allColor) {
                    //choose one color
                    map.put(node, color);
                    return true;
                }
            } else {
                //no left color, need  to spill
                map.put(node, null);
                return false;
            }
        }
        return false;
    }
}
