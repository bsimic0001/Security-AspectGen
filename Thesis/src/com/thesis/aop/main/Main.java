package com.thesis.aop.main;

import java.io.IOException;

import net.barenca.jastyle.JAStyleMain;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import com.thesis.aop.data.DataFileParser;
import com.thesis.aop.data.FunctionsParser;
import com.thesis.aop.sqlinjection.logic.SQLInjectionAspectGenerator;
import com.thesis.aop.xss.logic.XSSAspectGenerator;
public class Main {

	/**
	 * @param args
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {
		PropertyConfigurator.configure("log4j.properties");
		Logger logger = Logger.getRootLogger();

		DataFileParser parser = new DataFileParser();
		parser.ParseFile("ofbiz_report.xml");
		logger.info(parser.getXssIssues().size());
		logger.info(parser.getSqlInjectionIssues().size());
		FunctionsParser functionsParser = new FunctionsParser();
		functionsParser.ParseFile("xssfunctions.xml");
		
		XSSAspectGenerator xssGenerator = new XSSAspectGenerator(functionsParser.getFunctions(), parser.getXssIssues());
		xssGenerator.generateAspect();
		
		functionsParser.resetParser();
		functionsParser.ParseFile("sqlInjectionFunctions.xml");
		SQLInjectionAspectGenerator sqlGenerator = new SQLInjectionAspectGenerator(functionsParser.getFunctions(), parser.getSqlInjectionIssues());
		sqlGenerator.generateAspect();
		
		String[] files = new String[1];
		files[0] = System.getProperty("user.dir") + "/data/templates/aspects/XSSAspect.aj";
		logger.info("finished");
		try {
			JAStyleMain.ParseFiles(files);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
