import javax.swing.tree.TreeNode;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.*;

public class Test {

    public static void main( String[] args )
    {
        String file ="src/file/test" + ".txt";
        BufferedReader reader = null;
        try {
            reader = new BufferedReader(new FileReader(file));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        Sheng parser = new Sheng(reader);
        SimpleNode root = null;
        try {
            root = parser.Start();
            root = (SimpleNode) toLeftAsso(root);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        root.dump("");
        DrawTree.draw(root);
    }
    public static Node toLeftAsso(Node root) {
        Node tmpRoot = ArithLeftAsso.arithLeftAsso(root);
        //for boolean
        BoolLeftAsso boolToLeft = new BoolLeftAsso();
        tmpRoot = BoolLeftAsso.boolLeftAsso(tmpRoot);
        return tmpRoot;
    }

}
