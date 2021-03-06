/*******************************************************************************
 * Copyright (c) 2012 Bojan Simic.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the GNU Lesser Public License v2.1
 * which accompanies this distribution, and is available at
 * http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
 * 
 * Contributors:
 *     Bojan Simic - initial API and implementation
 ******************************************************************************/
package com.thesis.aop.main;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

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
		
		System.out.println("ARGS LENGTH: " + args.length);
		
		InputStream logStream = Main.class.getResourceAsStream("/properties/log4j.properties");
		Properties logProperties = new Properties();
		logProperties.load(logStream);
		
		PropertyConfigurator.configure(logProperties);
		//PropertyConfigurator.configure("log4j.properties");
		Logger logger = Logger.getRootLogger();

		DataFileParser parser = new DataFileParser();
		
		if(args.length == 0){
			parser.ParseFile("jada_java2.xml");
		}
		else{
			parser.ParseFile(args[0]);
		}
		
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
		
		logger.info("finished");
	}

}
