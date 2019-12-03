package sheng.zhong.project2;

import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import sheng.zhong.project2.codegenerator.Generator;
import sheng.zhong.project2.codegenerator.Optimizer;

public class ConsFoldingTest {
    public static void main(String[] args) {
        System.out.println(Integer.valueOf("-2"));
        Generator generator = new Generator("src/file/consFoldingTest" ,"consFoldingTest", "inputArr");

        generator.generateCode();
        generator.showInfo();

        generator.showStackMachine();

        generator.showAsseCode();
        generator.toFile();

        Optimizer optimizer = new Optimizer(generator);
        optimizer.generateFlowGraph();
        optimizer.showDataFlowEquations();
        optimizer.calculateDataFlowEquations();
        optimizer.showReachingDef();
        optimizer.constantFolding();
        optimizer.checkBlockVars();
        optimizer.drawNewAst();
    }

}
