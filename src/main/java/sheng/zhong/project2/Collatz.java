package sheng.zhong.project2;

import sheng.zhong.project2.codegenerator.Generator;

import java.util.Arrays;

public class Collatz {
    public static void main(String[] args)  {
        if (true) {
            Generator generator = new Generator("collatz", "inputArr");

            generator.generateCode();
            generator.showInfo();

            generator.showStackMachine();

            generator.showAsseCode();
            generator.toFile();
        }
        System.out.println(collatz(9999));
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
