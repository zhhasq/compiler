package sheng.zhong.project2;

import sheng.zhong.project2.AST.*;
import sheng.zhong.project2.codegenerator.Generator;
import sheng.zhong.project2.parser.Parse;
import sheng.zhong.project2.parser.ParseAriExp;
import sheng.zhong.project2.statckmachine.StackMachine;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class Test {

    public static void main( String[] args )
    {

        Generator generator = new Generator("src/file/test","test", "inputArr");

        generator.generateCode();
        generator.showInfo();

        generator.showStackMachine();

        generator.showAsseCode();
        generator.toFile();
    }

}
