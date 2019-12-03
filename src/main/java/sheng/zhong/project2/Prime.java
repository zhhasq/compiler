package sheng.zhong.project2;

import sheng.zhong.project2.codegenerator.Generator;
import sheng.zhong.project2.codegenerator.Optimizer;

import java.util.Arrays;

public class Prime {
    public static void main(String[] args) {
        if (true) {
            Generator generator = new Generator("src/file/prime" ,"prime", "inputArr");

            generator.generateCode();
            generator.showInfo();

            generator.showStackMachine();

            generator.showAsseCode();
            generator.toFile();

            Optimizer optimizer = new Optimizer(generator);
            optimizer.generateFlowGraph();
            optimizer.showDataFlowEquations();
            optimizer.calculateDataFlowEquations();
            optimizer.showReachingDef();
            optimizer.constantFolding();
            optimizer.checkBlockVars();
            optimizer.drawNewAst();
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
