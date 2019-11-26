package sheng.zhong.project2.CFG;

import java.util.*;

public class ReachingDef {
    Map<String, Set<Integer>> set;
    public int label;
    public boolean isIn;

    public ReachingDef(int label, boolean isIn) {
        this.set = new HashMap<>();
        this.label = label;
        this.isIn = isIn;
    }

    @Override
    public String toString() {
        if (label == -1) {
            return "RDStart";
        }
        return isIn == true ? "RDIn" + label : "RDExit" + label;
    }

    public String toStringWithSet() {
        if (label == -1) {
            return "RDStart";
        }
        StringBuilder sb = new StringBuilder();
        sb.append(isIn == true ? "RDIn" + label : "RDExit" + label);
        sb.append(": {");
        for (Map.Entry<String, Set<Integer>> entry : set.entrySet()) {
            for (Integer l : entry.getValue()) {
                sb.append("(" + entry.getKey() + ", " + l + ")");
            }
        }
        sb.append("}");
        return sb.toString();
    }

    public boolean add (ReachingDef rd) {
        //return true if there are changes else false;
        boolean result = false;
        for (Map.Entry<String, Set<Integer>> entry : rd.set.entrySet()) {
            Set<Integer> tmpList = this.set.get(entry.getKey());
            if (tmpList == null) {
                tmpList = new HashSet<>();
                tmpList.addAll(entry.getValue());
                this.set.put(entry.getKey(), tmpList);
                result = true;
            } else {
                if (tmpList.addAll(entry.getValue())) {
                    result = true;
                }
            }
        }
        return result;
    }
    public void remove(String var) {
        set.remove(var);
    }
    public boolean add(String var, int label) {
        Set<Integer> tmpList = this.set.get(var);
        boolean result = false;
        if (tmpList == null) {
            Set<Integer> tmpSet = new HashSet<>();
            tmpSet.add(label);
            this.set.put(var, tmpSet);
            result = true;
        } else {
            if(tmpList.add(label)) {
                result = true;
            }
        }
        return result;
    }
}
