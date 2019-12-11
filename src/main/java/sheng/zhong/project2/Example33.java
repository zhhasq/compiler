package sheng.zhong.project2;

import sheng.zhong.project2.codegenerator.Generator;
import sheng.zhong.project2.optimize.Optimizer;

import java.util.Arrays;

public class Example33 {
    public static void main(String[] args) {
        if (true) {
            Generator generator = new Generator("src/file/example33", "example33", "inputArr", Arrays.asList(new String[]{"output"}));

            generator.generateCode();
            generator.showInfo();

            generator.showStackMachine();

            generator.showAsseCode();
            generator.toFile();

            Optimizer optimizer = new Optimizer(generator);
            optimizer.generateFlowGraph();
            optimizer.showDataFlowEquations();
            optimizer.showReachingDefSet();

           optimizer.runConsFolding();
           optimizer.checkBlockVars();
           optimizer.drawNewAst();

            optimizer.runLivenessAnalysis();

            optimizer.removeDeadCode();
            optimizer.showRemovedDeadCode();

            optimizer.showLiveResult();

            optimizer.generateNewFlowGraph();

            optimizer.generateRIG();
            optimizer.solveColor();
            optimizer.showVarRegMap();
            optimizer.generateCode();
            optimizer.showRegVarMap();
            optimizer.showInfo();

        }
    }
}
