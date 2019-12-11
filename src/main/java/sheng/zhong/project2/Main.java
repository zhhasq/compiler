package sheng.zhong.project2;

import sheng.zhong.project2.codegenerator.Generator;
import sheng.zhong.project2.optimize.Optimizer;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        int size = Integer.valueOf(args[3]);
        List<String> output = new ArrayList<>();
        for (int i = 0; i < size; i++) {
            output.add(args[4 + i]);
        }
        int numColor = Integer.valueOf(args[2]);
        System.out.println(args[0]);
        System.out.println(args[1]);
        System.out.println(args[2]);
        System.out.println(args[3]);


        Generator generator = new Generator(args[0], args[1], "inputArr", output, numColor);

        generator.generateCode();
        generator.showInfo();

       // generator.showStackMachine();

       // generator.showAsseCode();
        generator.toFile();


        Optimizer optimizer = new Optimizer(generator);
        optimizer.generateFlowGraph();
        optimizer.showDataFlowEquations();
        optimizer.showReachingDefSet();

        optimizer.runConsFolding();
        //optimizer.checkBlockVars();
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

        optimizer.generateCode();
        optimizer.showInfo();
    }

}
