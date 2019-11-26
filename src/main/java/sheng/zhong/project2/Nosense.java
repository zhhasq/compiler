package sheng.zhong.project2;

import sheng.zhong.project2.codegenerator.Generator;

public class Nosense {
    public static void main(String[] args) {
        if (true) {
            Generator generator = new Generator("src/file/nosense", "nosense", "inputArr");

            generator.generateCode();
            generator.showInfo();

            generator.showStackMachine();

            generator.showAsseCode();
            generator.toFile();
            generator.generateFlowGraph();
        }
        noSense(1, 1, 1, 1);
        noSense(0, 1, 0, 1);
        noSense(0, 0, 0, 1);
        noSense(0, 1, 0,  0);
        noSense(100, 1, 6, 4 );
        noSense(0, 1, 33, 0);
        noSense(22, 1, 0, 7);

    }
    public static void noSense(long a, long b, long c, long d) {
        long count1 = 0;
        long count2 = 0;
        long count3 = 0;
        long count4 = 0;
        System.out.println("");
        System.out.println("for a = " + a + "; b = " + b + "; c = " + c + "; d = " + d + ": ");
        while (a > 0 || b > 0 || c > 0 || d > 0) {
            count1++;
            while (!(1 * c + 2 * a < 1 * d + 2 * b) && true && (1 * d + 2 * a >= 1 * c + 2 * b) && count2 <= 1000) {
                count2 +=  1 * c + 2 * a + 1 * d + 2 * b;
                if (6 + a + b * (d - (b + c * a - d)) - d > 0) {
                    count4++;
                }
            }
            if (count2 % 2 == 0) {
                long tmp = 1 * d + 2 * c + 4 * b + 8 * d;
                while (tmp > 0 && count2 % 2 != 1) {
                    tmp--;
                    count3 += tmp;
                    if (!(count3 <= count4 || count1 <= count3  && true || !true)){
                        count3 += count4;
                    } else {
                        count3 -= count4;
                    }
                }
            }  else {
                long tmp = 1 * d + 2 * c + 4 * b + 8 * d;
                while (tmp > 0 && count2 % 2 != 0) {
                    tmp--;
                    count3 += 2 * tmp;
                }
            }
            count2 = count2 - count3 - count4;
            if (-count2 >= 2 * count3) {
                count1 += -count2;
            } else {
                count1 += count3 + count4 * count2;
            }
            d = c;
            c = b;
            b = a;
            a = 0;
        }
        System.out.println("count1 = " + count1 + "; count2 = " + count2 + "; count3 =  " + count3 + " ; count4 = " + count4);
    }
}
