package sheng.zhong.project2;

import sheng.zhong.project2.codegenerator.Generator;

import java.util.Arrays;

public class Collatz {
    public static void main(String[] args)  {
        if (true) {
            Generator generator = new Generator("src/file/collatz", "collatz", "inputArr");

            generator.generateCode();
            generator.showInfo();

            generator.showStackMachine();

            generator.showAsseCode();
            generator.toFile();
            generator.generateFlowGraph();
        }
        System.out.println("for input 0: " + collatz(0));
        System.out.println("for input 1: " + collatz(1));
        System.out.println("for input 4: " + collatz(4));
        System.out.println("for input 9: " + collatz(9));
        System.out.println("for input 50: " + collatz(50));
        System.out.println("for input 899: " + collatz(899));
        System.out.println("for input 9999: " + collatz(9999));

    }
    public static long collatz(long input) {
        long n = input;
        long steps = 0;
        long rem = 0;
        while (n > 1) {
            rem = n;
            long quot = 0;
            while (rem > 1) {
                rem = rem - 2;
                quot = quot + 1;
            }
            if (rem == 0) {
                n = quot;
            } else {
                n = 3*n+1;
            }
            steps = steps + 1;
        }

        return steps;
    }
}
