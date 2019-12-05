package sheng.zhong.project2.CFG;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class LiveSet {
    public Set<String> set;
    private final int label;
    private final boolean isIn;

    public LiveSet(int label, boolean isIn ) {
        this.set = new HashSet<>();
        this.label = label;
        this.isIn = isIn;
    }

    public boolean add(String var) {
        return this.set.add(var);
    }

    public boolean remove(String var) {
        return set.remove(var);
    }

    public boolean isIn() {
        return isIn;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("{");
        for (String var : set) {
            sb.append(var);
            sb.append(", ");
        }
        if (set.size() >= 1) {
            sb.deleteCharAt(sb.length() - 1);
            sb.deleteCharAt(sb.length() - 1);
        }

        sb.append("}");
        return sb.toString();
    }
}
