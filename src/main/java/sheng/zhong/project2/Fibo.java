package sheng.zhong.project2;

import sheng.zhong.project2.codegenerator.Generator;

import java.util.Arrays;

public class Fibo {

    public static void main(String[] args) {
        if (true) {
            Generator generator = new Generator("fibo", "inputArr");

            generator.generateCode();
            generator.showInfo();

            generator.showStackMachine();

            generator.showAsseCode();
            generator.toFile();
        }
        System.out.println(fibonacci(20));
    }

    public static long fibonacci(int k) {
        if (k <= 0) {
            return 0;
        }
        long a = 0;
        long b = 1;
        long i = 1;
        while (i < k) {
            long sum = a + b;
            a = b;
            b = sum;
            i++;
        }
        return b;
    }

}
