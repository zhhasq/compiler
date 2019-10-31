package sheng.zhong.project2;

import sheng.zhong.project2.codegenerator.Generator;

import java.util.Arrays;

public class Prime {
    public static void main(String[] args) {
        if (true) {
            Generator generator = new Generator("prime", "inputArr");

            generator.generateCode();
            generator.showInfo();

            generator.showStackMachine();

            generator.showAsseCode();
            generator.toFile();
        }
        System.out.println(isPrime(5000));
    }

    public static int isPrime(int range) {
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
