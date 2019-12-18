package sheng.zhong.project2;

import sheng.zhong.project2.codegenerator.Generator;
import sheng.zhong.project2.optimize.Optimizer;

import java.util.Arrays;

public class Sort {
    public static void main(String[] args) {
        if (true) {
            Generator generator = new Generator("src/file/sort", "sort", "inputArr", Arrays.asList(new String[]{"input1", "input2", "input3"}), 11);

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
            optimizer.showRegVarMap();
            System.out.println("");
            System.out.println("");
            System.out.println("");
            optimizer.generateCode();

            optimizer.showInfo();
        }

    }
}
