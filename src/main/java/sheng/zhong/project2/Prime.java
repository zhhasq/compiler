package sheng.zhong.project2;

import sheng.zhong.project2.codegenerator.Generator;
import sheng.zhong.project2.optimize.Optimizer;

import java.util.Arrays;

public class Prime {
    public static void main(String[] args) {
        if (true) {
            Generator generator = new Generator("src/file/prime" ,"prime", "inputArr",Arrays.asList(new String[]{"result"}),11);


            generator.generateCode();
            generator.showInfo();

            generator.showStackMachine();

            generator.showAsseCode();
            generator.toFile();

            Optimizer optimizer = new Optimizer(generator);
            optimizer.generateFlowGraph();
            optimizer.showDataFlowEquations();
            optimizer.showReachingDefSet();

            optimizer.runConsFolding();
            optimizer.checkBlockVars();
            optimizer.drawNewAst();

            optimizer.runLivenessAnalysis();

            optimizer.removeDeadCode();
            optimizer.showRemovedDeadCode();

            optimizer.showLiveResult();

            optimizer.generateNewFlowGraph();

            optimizer.generateRIG();
            optimizer.solveColor();
            optimizer.showVarRegMap();
            optimizer.showRegVarMap();

            System.out.println("");
            System.out.println("");
            System.out.println("");

            optimizer.generateCode();
            optimizer.showInfo();
        }
        System.out.println("range: [2 - 1]: " + countPrime(1));
        System.out.println("range: [2 - 2]: " + countPrime(2));
        System.out.println("range: [2 - 10]: " + countPrime(10));
        System.out.println("range: [2 - 175]: " + countPrime(175));
        System.out.println("range: [2 - 631]: " + countPrime(631));


    }

    public static int countPrime(int range) {
        int result = 0;
        while (range >= 2) {
            boolean flag = false;
            for (int i = 2; i * i <= range; i++) {
                if (range % i == 0) {
                    flag = true;
                    break;
                }
            }
            range--;
            if (!flag) {
                result++;
            }
        }

       return result;
    }
}
