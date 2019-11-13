package sheng.zhong.project2;

import sheng.zhong.project2.codegenerator.Generator;

import java.util.Arrays;

public class Test3 {
    public static void main(String[] args) {
        Generator generator = new Generator("src/file/test3", "test3", "inputArr");

        generator.generateCode();
        generator.showInfo();

        generator.showStackMachine();

        generator.showAsseCode();
        generator.toFile();

        long a = 100;
        long b = 20;
        long c = 33;
        while (0 <= a) {
            b = b + (2 + (a + (a * 2 - c)) * a);
            long d = b;
            while (false || (!(true) || (b > a && c <= a) ||  a * 100 >= c)) {
                c = c + 1;
                d = d + 1;
                while (d > 0) {
                    c = c * 2;
                    d = d - 500;
                    int count = 2;
                    while (count >= 0 ) {
                        a = a + 2;
                        count = count - 1;
                    }
                }

            }
            a = a - 1;
        }
        System.out.println(a);
        System.out.println(b);

        System.out.println(c);
    }
}
