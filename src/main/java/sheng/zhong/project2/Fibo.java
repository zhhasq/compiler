package sheng.zhong.project2;

import sheng.zhong.project2.codegenerator.Generator;

import java.util.Arrays;

public class Fibo {

    public static void main(String[] args) {
        if (true) {
            Generator generator = new Generator("src/file/fibo", "fibo", "inputArr");

            generator.generateCode();
            generator.showInfo();

            generator.showStackMachine();

            generator.showAsseCode();
            generator.toFile();
            generator.generateFlowGraph();
        }
        System.out.println("0 th fibonacci number is " + fibonacci(0));
        System.out.println("1 th fibonacci number is " + fibonacci(1));
        System.out.println("2 th fibonacci number is " + fibonacci(2));
        System.out.println("14 th fibonacci number is " + fibonacci(14));
        System.out.println("43 th fibonacci number is " + fibonacci(43));
        System.out.println("66 th fibonacci number is " + fibonacci(66));

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
