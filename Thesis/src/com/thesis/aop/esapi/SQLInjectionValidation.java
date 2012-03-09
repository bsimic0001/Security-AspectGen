package com.thesis.aop.esapi;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import net.sf.jsqlparser.JSQLParserException;

import org.owasp.esapi.ESAPI;
import org.owasp.esapi.codecs.MySQLCodec;
import org.owasp.esapi.codecs.OracleCodec;

import com.thesis.aop.sqlinjection.logic.SQLParser;
import com.thesis.aop.sqlinjection.parser.CONSTANT;
import com.thesis.aop.sqlinjection.parser.SimpleExpression;

public abstract class SQLInjectionValidation {

	
	public static String escapeMySQL(String s) throws JSQLParserException {
		MySQLCodec mysql = new MySQLCodec(MySQLCodec.MYSQL_MODE);
		String encodedResult = s;

		List<SimpleExpression> items = SQLParser.getQueryValues(s);
		for (Iterator iterator = items.iterator(); iterator.hasNext();) {
			SimpleExpression simpleExpression = (SimpleExpression) iterator
					.next();
			if (simpleExpression.valueType == CONSTANT.VALUE_STRING) {
				encodedResult.replace("\"" + simpleExpression.value + "\"", "\"" + ESAPI.encoder().encodeForSQL(mysql,
						simpleExpression.value) + "\"");
				encodedResult.replace("'" + simpleExpression.value + "'", "'" + ESAPI.encoder().encodeForSQL(mysql,
						simpleExpression.value) + "'");		
			}
		}

		return encodedResult;

	}

	public static String escapeOracle(String s) throws JSQLParserException {
		OracleCodec oracle = new OracleCodec();
		String encodedResult = s;
		
		List<SimpleExpression> items = SQLParser.getQueryValues(s);
		for (Iterator iterator = items.iterator(); iterator.hasNext();) {
			SimpleExpression simpleExpression = (SimpleExpression) iterator
					.next();
			if (simpleExpression.valueType == CONSTANT.VALUE_STRING) {
				encodedResult.replace("\"" + simpleExpression.value + "\"", "\"" + ESAPI.encoder().encodeForSQL(oracle,
						simpleExpression.value) + "\"");
				encodedResult.replace("'" + simpleExpression.value + "'", "'" + ESAPI.encoder().encodeForSQL(oracle,
						simpleExpression.value) + "'");		
			}
		}
		
		return encodedResult;
	}
	
}
