package com.thesis.aop.main;

import java.io.IOException;

import com.thesis.aop.data.DataFileParser;
import com.thesis.aop.data.FunctionsParser;
import com.thesis.aop.xss.logic.XSSAspectGenerator;

import net.barenca.jastyle.JAStyleMain;
public class Main {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		DataFileParser parser = new DataFileParser();
		parser.ParseFile("jada_java2.xml");
		System.out.println(parser.getXssIssues().size());
		System.out.println(parser.getSqlInjectionIssues().size());
		FunctionsParser functionsParser = new FunctionsParser();
		functionsParser.ParseFile("xssfunctions.xml");
		
		XSSAspectGenerator xssGenerator = new XSSAspectGenerator(functionsParser.getFunctions(), parser.getXssIssues());
		xssGenerator.generateAspect();
		
		String[] files = new String[1];
		files[0] = System.getProperty("user.dir") + "/aspects/test.java";
		try {
			JAStyleMain.ParseFiles(files);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
