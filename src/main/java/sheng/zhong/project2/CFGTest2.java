package sheng.zhong.project2;

import sheng.zhong.project2.CFG.DrawCFG;
import sheng.zhong.project2.CFG.FlowGraph;
import sheng.zhong.project2.codegenerator.Generator;




public class CFGTest2 {
    public static void main(String[] args) {
        Integer i = 0;
        for (int j = 0; j < 4; j++) {
            System.out.println(i++);
        }
        Generator generator = new Generator("src/file/cfgTest2", "cfgTest2",  "inputArr");

        generator.generateCode();
        generator.showInfo();

        generator.showStackMachine();

        generator.showAsseCode();
        generator.toFile();

        generator.generateFlowGraph();
        generator.showDataFlowEquations();
        generator.calculateDataFlowEquations();
        generator.showReachingDef();

    }
}


