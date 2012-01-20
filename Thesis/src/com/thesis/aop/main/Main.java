package com.thesis.aop.main;

import java.io.IOException;

import com.thesis.aop.data.DataFileParser;
import com.thesis.aop.data.FunctionsParser;
import net.barenca.jastyle.JAStyleMain;
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
