package sheng.zhong.project2;

import sheng.zhong.project2.codegenerator.Generator;

import java.util.Arrays;

public class Test5 {
    public static void main(String[] args) {
        if (true) {
            Generator generator = new Generator("src/file/test5", "test5",  "inputArr");

            generator.generateCode();
            generator.showInfo();

            generator.showStackMachine();

            generator.showAsseCode();
            generator.toFile();
        }
        long count1 = 0;
        long count2 = 0;
        long count3 = 0;
        long count4 = 0;

        long a = 22;
        long b = 33;
        long c = 13;

        while (0 <= a) {
            b = b + (2 + (a + (a * 2 - c)) * a);
            count1++;
            long d = b;
            while (false || (!(true) || (b > a && c <= a) ||  a * 100 >= c)) {
                c = c + 1;
                count2++;
                d = d + 1;
                while (d > 0) {
                    c = c * 2;
                    d = d - 500;
                    count3++;
                    if (a > b) {
                        if (c < a) {
                            if (b >= a) {
                                c = c + 2 * a;
                            } else {
                                c = c + 2 * b;
                            }
                        } else {
                            d = 30;
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
                    int count = 2;
                    while (count >= 0 ) {
                        count4++;
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
        System.out.println(count1);
        System.out.println(count2);
        System.out.println(count3);
        System.out.println(count4);


    }
}
