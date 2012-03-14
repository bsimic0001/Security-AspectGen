package com.thesis.aop.esapi;

import java.util.Iterator;
import java.util.List;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

import net.sf.jsqlparser.JSQLParserException;

import org.apache.log4j.Logger;
import org.owasp.esapi.ESAPI;
import org.owasp.esapi.codecs.MySQLCodec;
import org.owasp.esapi.codecs.OracleCodec;

import com.thesis.aop.sqlinjection.logic.SQLParser;
import com.thesis.aop.sqlinjection.parser.CONSTANT;
import com.thesis.aop.sqlinjection.parser.SimpleExpression;

public abstract class SQLInjectionValidation {

	public static String escapeMySQL(String s, Logger logger)
			throws JSQLParserException {
		MySQLCodec mysql = new MySQLCodec(MySQLCodec.MYSQL_MODE);
		String encodedResult = s;

		try {
			List<SimpleExpression> items = SQLParser.getQueryValues(s);
			for (Iterator iterator = items.iterator(); iterator.hasNext();) {
				SimpleExpression simpleExpression = (SimpleExpression) iterator
						.next();
				boolean tautology = testTautology(simpleExpression, logger);
				if (tautology) {
					logger.info("Obvious Tautology Detected with Left Side: "
							+ simpleExpression.getColumnName()
							+ " and Right Side: " + simpleExpression.value);
					logger.info("Replacing Obvious Tautology With 'x=y' in order to prevent execution of attack");
					String regex = "(.{0,1}" + simpleExpression.columnName
							+ ".{0,1}\\s{0,1000}" + simpleExpression.op + "\\s{0,1000}.{0,1}"
							+ simpleExpression.value + ".{0,1})";
					encodedResult = encodedResult.replaceAll(regex, " x=y");
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
			logger.info("ERROR - INVALID QUERY ", e);
			encodedResult = "VALIDATION_FAILURE - CHECK LOGS";
		}

		return encodedResult;

	}

	public static String escapeOracle(String s, Logger logger)
			throws JSQLParserException {
		OracleCodec oracle = new OracleCodec();
		String encodedResult = s;

		try {
			List<SimpleExpression> items = SQLParser.getQueryValues(s);
			for (Iterator iterator = items.iterator(); iterator.hasNext();) {
				SimpleExpression simpleExpression = (SimpleExpression) iterator
						.next();
				boolean tautology = testTautology(simpleExpression, logger);
				if (tautology) {
					logger.info("Obvious Tautology Detected with Left Side: "
							+ simpleExpression.getColumnName()
							+ " and Right Side: " + simpleExpression.value);
					logger.info("Replacing Obvious Tautology With 'x=y' in order to prevent execution of attack");
					String regex = "(.{0,1}" + simpleExpression.columnName
							+ ".{0,1}\\s{0,1000}" + simpleExpression.op + "\\s{0,1000}.{0,1}"
							+ simpleExpression.value + ".{0,1})";
					encodedResult = encodedResult.replaceAll(regex, " x=y");
				} else if (simpleExpression.valueType == CONSTANT.VALUE_STRING) {
					encodedResult = encodedResult.replace(
							"\"" + simpleExpression.value + "\"",
							"\""
									+ ESAPI.encoder().encodeForSQL(oracle,
											simpleExpression.value) + "\"");
					encodedResult = encodedResult.replace(
							"'" + simpleExpression.value + "'",
							"'"
									+ ESAPI.encoder().encodeForSQL(oracle,
											simpleExpression.value) + "'");
				}
			}
		} catch (JSQLParserException e) {
			logger.info("ERROR - INVALID QUERY ", e);
			encodedResult = "INVALID QUERY - CHECK LOGS";
		}

		return encodedResult;
	}

	public static boolean testTautology(SimpleExpression exp, Logger logger) {
		ScriptEngineManager manager = new ScriptEngineManager();
		ScriptEngine engine = manager.getEngineByName("js");
		boolean resultBool = false;

		try {
			Object result;

			if (exp.getOp().equals("=")) {
				result = engine.eval("'" + exp.getColumnName() + "'" + "=="
						+ "'" + exp.getValue() + "'");
			} else if (exp.getOp().equals("<>")) {
				result = engine.eval(exp.getColumnName() + "!="
						+ exp.getValue());
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

}
