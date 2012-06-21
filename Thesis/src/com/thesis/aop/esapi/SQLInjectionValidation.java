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
package com.thesis.aop.esapi;

import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import net.sf.jsqlparser.JSQLParserException;
import org.apache.log4j.Logger;
import org.owasp.esapi.ESAPI;
import org.owasp.esapi.codecs.MySQLCodec;
import org.owasp.esapi.codecs.OracleCodec;
import com.thesis.aop.main.Main;
import com.thesis.aop.sqlinjection.logic.SQLParser;
import com.thesis.aop.sqlinjection.parser.CONSTANT;
import com.thesis.aop.sqlinjection.parser.SimpleExpression;

public abstract class SQLInjectionValidation {
	
	private static Properties regexProperties;
	
	public static void loadRegexProperties() throws IOException{
		InputStream logStream = Main.class.
			getResourceAsStream("/properties/regex.properties");
		regexProperties = new Properties();
		regexProperties.load(logStream);
	}
	
	public static String escapeMySQL(String s, Logger logger)
			throws JSQLParserException {
		MySQLCodec mysql = new MySQLCodec(MySQLCodec.MYSQL_MODE);
		String encodedResult = s;
		try {
			loadRegexProperties();
			encodedResult = removeCommentsFromString(
				regexProperties.getProperty("ALL_COMMENTS"), 
				encodedResult, logger);
			encodedResult = removeCommentsFromString(
				regexProperties.getProperty("START_COMMENTS"), 
				encodedResult, logger);

			List<SimpleExpression> items = SQLParser.getQueryValues(encodedResult);
			for (Iterator iterator = items.iterator(); iterator.hasNext();) {
				SimpleExpression simpleExpression = (SimpleExpression) iterator
						.next();
				boolean tautology = testTautology(simpleExpression, logger);
				if (tautology) {
					logger.info("Obvious Tautology Detected with Left Side: "
						+ simpleExpression.getColumnName()
						+ " and Right Side: " + simpleExpression.value);
					logger.info("Replacing Obvious Tautology With '1=2' in " +
							"order to prevent execution of attack");
					String regex = "(.{0,1}" + simpleExpression.columnName
							+ ".{0,1}\\s{0,1000}" + simpleExpression.op + 
							"\\s{0,1000}.{0,1}"
							+ simpleExpression.value + ".{0,1})";
					encodedResult = encodedResult.replaceAll(regex, " 1=2");
				} else if (simpleExpression.valueType == CONSTANT.VALUE_STRING) {
					encodedResult = encodedResult.replace(
							"\"" + simpleExpression.value + "\"",
							"\""
									+ ESAPI.encoder().encodeForSQL(mysql,
											simpleExpression.value) + "\"");
					encodedResult = encodedResult.replace(
							"'" + simpleExpression.value + "'",
							"'"
							+ ESAPI.encoder().encodeForSQL(mysql,
							simpleExpression.value) + "'");
				}
			}
		} catch (JSQLParserException e) {
			logger.info("ERROR - INVALID QUERY: " + e.getCause());
			encodedResult = "PARSE_ERROR -" + encodedResult;
		} catch (IOException e) {
			logger.info("ERROR - IO Exception: " + e.getCause());
		}

		return encodedResult;

	}

	public static String escapeOracle(String s, Logger logger)
			throws JSQLParserException {
		OracleCodec oracle = new OracleCodec();
		String encodedResult = s;

		try {
			loadRegexProperties();
			encodedResult = removeCommentsFromString(
				regexProperties.getProperty("ALL_COMMENTS"), 
				encodedResult, logger);
			encodedResult = removeCommentsFromString(
				regexProperties.getProperty("START_COMMENTS"), 
				encodedResult, logger);

			List<SimpleExpression> items = SQLParser.getQueryValues(encodedResult);
			for (Iterator iterator = items.iterator(); iterator.hasNext();) {
				SimpleExpression simpleExpression = (SimpleExpression) iterator
						.next();
				boolean tautology = testTautology(simpleExpression, logger);
				if (tautology) {
					logger.info("Obvious Tautology Detected with Left Side: "
						+ simpleExpression.getColumnName()
						+ " and Right Side: " + simpleExpression.value);
					logger.info("Replacing Obvious Tautology With '1=2' in " +
						"order to prevent execution of attack");
					String regex = "(.{0,1}" + simpleExpression.columnName
							+ ".{0,1}\\s{0,1000}" + simpleExpression.op + 
							"\\s{0,1000}.{0,1}"
							+ simpleExpression.value + ".{0,1})";
					encodedResult = encodedResult.replaceAll(regex, " 1=2");
				} else if (simpleExpression.valueType == CONSTANT.VALUE_STRING) {
					encodedResult = encodedResult.replace(
							"\"" + simpleExpression.value + "\"",
							"\""
							+ ESAPI.encoder().encodeForSQL(oracle,
								simpleExpression.value) + "\"");
					encodedResult = encodedResult.replace(
							"'" + simpleExpression.value + "'",
							"'" + ESAPI.encoder().encodeForSQL(oracle,
							simpleExpression.value) + "'");
				}
			}
		} catch (JSQLParserException e) {
			logger.info("ERROR - INVALID QUERY: " + e.getCause());
			encodedResult = "PARSE_ERROR -" + encodedResult;
		} catch (IOException e) {
			logger.info("ERROR - IO Exception :" + e.getCause());
		}

		return encodedResult;
	}

	public static boolean testTautology(SimpleExpression exp, 
		Logger logger) {
		ScriptEngineManager manager = new ScriptEngineManager();
		ScriptEngine engine = manager.getEngineByName("js");
		boolean resultBool = false;

		try {
			Object result;

			if (exp.getOp().equals("=")) {
				result = engine.eval("'" + exp.getColumnName() + "'" + "=="
						+ "'" + exp.getValue() + "'");
			} else if (exp.getOp().equals("<>")) {
				result = engine.eval("'" + exp.getColumnName() + "'" + "!="
						+ "'" + exp.getValue() + "'");
			} else {
				result = engine.eval(exp.getColumnName() + exp.getOp()
						+ exp.getValue());
			}

			result = (Boolean) result;

			Boolean boolResult = new Boolean(result.toString());

			System.out.println(result);
			resultBool = boolResult.booleanValue();

		} catch (ScriptException e) {
			logger.info("ERROR in Tautology Detection", e);
		} finally {
			return resultBool;
		}

	}
	
	public static String removeCommentsFromString(String regex, 
		String input, Logger logger){
		
		Pattern regexp = Pattern.compile(regex, 
				Pattern.DOTALL | Pattern.MULTILINE);
	    Matcher regexMatcher = regexp.matcher(input);
	    while (regexMatcher.find()) {
	    	logger.info("Removing comment from query: \"" + 
	    		regexMatcher.group() + "\" from \"" + input + "\"");
	    	input = input.replace(regexMatcher.group(), " ");
	    } 
	    
	    int semicolonIndex = input.indexOf(";");
	    
	    if(semicolonIndex > -1){
	    	String originalInput = input;
	    	input = input.substring(0, semicolonIndex + 1);
	    	logger.info("IMPORTANT: Found multiple queries.");
	    	logger.info("     Keeping - " + input);
	    	logger.info("     From - " + originalInput);
	    }
	    
	    return input;
	}

}
