package sheng.zhong.project2;

import sheng.zhong.project2.codegenerator.Generator;

public class Main {
    public static void main(String[] args) {
        Generator generator = new Generator(args[0], args[1], "inputArr");

        generator.generateCode();
        generator.showInfo();

        generator.showStackMachine();

        generator.showAsseCode();
        generator.toFile();
    }

}
