package sheng.zhong.project2;

import sheng.zhong.project2.codegenerator.Generator;

public class Example33 {
    public static void main(String[] args) {
        if (true) {
            Generator generator = new Generator("src/file/example33", "example33", "inputArr");

            generator.generateCode();
            generator.showInfo();

            generator.showStackMachine();

            generator.showAsseCode();
            generator.toFile();
            generator.generateFlowGraph();
        }
    }
}
