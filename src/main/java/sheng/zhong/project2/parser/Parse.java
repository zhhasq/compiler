package sheng.zhong.project2.parser;

import sheng.zhong.project2.AST.*;
import sheng.zhong.project2.statckmachine.StackMachine;

import java.io.*;
import java.util.*;

public class Parse {

    public static Node toAst(String file) {
        file = removeComment(file);

        BufferedReader reader = null;
        try {
            reader = new BufferedReader(new FileReader(file));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        Sheng parser = new Sheng(reader);

        SimpleNode root = null;
        SimpleNode root2 = null;

        try {
            root = parser.Start();
            //root2 = parser.Start();

            root = (SimpleNode) toLeftAsso(root);
         //   BoolLeftAsso boolLeftAsso = new BoolLeftAsso();
         //   root2 = (SimpleNode)BoolLeftAsso.removeBFactor(root2);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        //root.dump("");
        DrawTree.draw(root, file );
        //DrawTree.draw(root2, file + "origin");

        return root;
    }

    public static Node toLeftAsso(Node root) {
        Node tmpRoot = ArithLeftAsso.arithLeftAsso(root);
        //for boolean
        BoolLeftAsso boolToLeft = new BoolLeftAsso();
        tmpRoot = boolToLeft.boolLeftAsso(tmpRoot);
        return tmpRoot;
    }

    public static void findID(Node root, Set<String> idSet) {
        Deque<Node> stack = new ArrayDeque<>();
        stack.offerLast(root);

        while (!stack.isEmpty()) {
            Node cur = stack.pollLast();
            if (NodeIDMap.isID(cur)) {
                idSet.add(cur.toString());
            }
            int childNum = cur.jjtGetNumChildren();
            for (int i = 0; i < childNum; i++) {
                stack.offerLast(cur.jjtGetChild(i));
            }
        }
    }

    public static int findStackHeight(Map<Node, StackMachine> map) {
        int result = 0;
        for (Map.Entry<Node, StackMachine> entry : map.entrySet()) {
            result = Math.max(result, entry.getValue().getMaxHeight());
        }
        return result;
     }

     public static String removeComment(String file) {
         boolean commentFlag = false;
         BufferedReader reader = null;
         List<String> inputList = new ArrayList<>();

         try {
             reader = new BufferedReader(new FileReader(file));
         } catch (FileNotFoundException e) {
             e.printStackTrace();
         }

         String currentLine = null;
         try {
             StringBuilder sb = new StringBuilder();

             currentLine = reader.readLine();
         } catch (IOException e) {
             e.printStackTrace();
         }

         while (currentLine != null) {
             StringBuilder sb = new StringBuilder();
             String[] tmp = currentLine.split(" ");

             for (int i = 0; i < tmp.length; i++) {
                 String s = tmp[i];
                 if (commentFlag) {
                     if (s.equals("-}")) {
                         commentFlag = false;
                     }
                 } else {
                     if (!s.equals("{-") && !s.equals("--")) {
                         sb.append(s + " ");
                     } else if (s.equals("{-")) {
                         commentFlag = true;
                     } else {
                         break;
                     }
                 }
             }
             if (sb.length() > 0) {
                 inputList.add(sb.toString());
             }
             try {
                 currentLine = reader.readLine();
             } catch (IOException e) {
                 e.printStackTrace();
             }
         }
         try {
             reader.close();
         } catch (IOException e) {
             e.printStackTrace();
         }

         String outFile = file.substring(0, file.length() - 4) + "NoComment.txt";

         try{
             File outputFile =new File(outFile);

             //if file doesnt exists, then create it
             if(!outputFile.exists()){
                 outputFile.createNewFile();
             }

             //true = append file
             FileWriter fileWritter = new FileWriter(outFile);
             BufferedWriter bufferWritter = new BufferedWriter(fileWritter);

             for (String s : inputList) {
                 bufferWritter.write(s + "\n");
             }


             bufferWritter.close();

             System.out.println("remove all comments");

         } catch (IOException e) {
             e.printStackTrace();
         }
         return outFile;
     }

}
