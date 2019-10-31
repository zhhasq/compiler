package sheng.zhong.project2;

import sheng.zhong.project2.codegenerator.Generator;

public class Quadratic {
    public static void main(String[] args) {
        if (true) {
            Generator generator = new Generator("quadratic", "inputArr");

            generator.generateCode();

            generator.showInfo();
            generator.showStackMachine();

            generator.showAsseCode();
            generator.toFile();
        }
    }
}
