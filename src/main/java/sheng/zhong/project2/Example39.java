package sheng.zhong.project2;

import sheng.zhong.project2.codegenerator.Generator;

public class Example39 {
    public static void main(String[] args) {
        if (true) {
            Generator generator = new Generator("src/file/example39", "example39", "inputArr");

            generator.generateCode();
            generator.showInfo();

            generator.showStackMachine();

            generator.showAsseCode();
            generator.toFile();
            generator.generateFlowGraph();
        }
    }
}
