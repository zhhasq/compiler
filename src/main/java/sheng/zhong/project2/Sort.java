package sheng.zhong.project2;

import sheng.zhong.project2.codegenerator.Generator;

import java.util.Arrays;

public class Sort {
    public static void main(String[] args) {
        if (true) {
            Generator generator = new Generator("src/file/sort", "sort", "inputArr");

            generator.generateCode();
            generator.showInfo();

            generator.showStackMachine();

            generator.showAsseCode();
            generator.toFile();
        }

    }
}
