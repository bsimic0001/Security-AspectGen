package com.thesis.aop.main;

import com.thesis.aop.data.DataFileParser;
import com.thesis.aop.data.FunctionsParser;

public class Main {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("Hello");
		DataFileParser parser = new DataFileParser();
		parser.ParseFile("jada_report.xml");
		FunctionsParser functionsParser = new FunctionsParser();
		functionsParser.ParseFile("xssfunctions.xml");
	}

}
