package com.thesis.aop.esapi;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

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
				if (simpleExpression.valueType == CONSTANT.VALUE_STRING) {
					encodedResult.replace(
							"\"" + simpleExpression.value + "\"",
							"\""
									+ ESAPI.encoder().encodeForSQL(mysql,
											simpleExpression.value) + "\"");
					encodedResult.replace(
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
				if (simpleExpression.valueType == CONSTANT.VALUE_STRING) {
					encodedResult.replace(
							"\"" + simpleExpression.value + "\"",
							"\""
									+ ESAPI.encoder().encodeForSQL(oracle,
											simpleExpression.value) + "\"");
					encodedResult.replace(
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

}
