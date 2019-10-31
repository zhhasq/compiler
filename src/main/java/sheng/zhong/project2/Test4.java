package sheng.zhong.project2;

import sheng.zhong.project2.codegenerator.Generator;

import java.util.Arrays;

public class Test4 {
    public static void main(String[] args) {
        if (false) {
            Generator generator = new Generator("test4",  "inputArr");

            generator.generateCode();
            generator.showInfo();

            generator.showStackMachine();

            generator.showAsseCode();
            generator.toFile();
        }


        long a = 12;
        long b = 11;
        long c = 13;

        if (a > b) {
            if (c < a) {
                if (b >= a) {
                    c = 2 * a;
                } else {
                    c = 2 * b;
                }
            } else {
                long d = 30;
                if (d > 10) {
                    a = a + b + c;
                } else {
                    a = a - b - c;
                }
            }
        } else {
            if (c == a) {
                c = a + b;
            } else {
                if (b >= a) {
                    c = a + 2 * b;
                } else {
                    c = a - 2 * b;
                }
            }
        }
        a = b - a;
        c = a + b;
        b = a + b + c;
        System.out.println(a);
        System.out.println(b);

        System.out.println(c);
    }

}
