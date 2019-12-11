package sheng.zhong.project2;

import sheng.zhong.project2.codegenerator.Generator;
import sheng.zhong.project2.optimize.Optimizer;

public class ConsFoldingTest {
    public static void main(String[] args) {
        Generator generator = new Generator("src/file/consFoldingTest" ,"consFoldingTest", "inputArr");

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
