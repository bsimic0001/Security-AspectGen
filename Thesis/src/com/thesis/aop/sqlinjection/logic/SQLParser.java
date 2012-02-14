package com.thesis.aop.sqlinjection.logic;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.thesis.aop.sqlinjection.parser.InsertQueryWalker;
import com.thesis.aop.sqlinjection.parser.SimpleExpression;
import com.thesis.aop.sqlinjection.parser.WhereItemsFinder;

import net.sf.jsqlparser.JSQLParserException;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.parser.CCJSqlParserManager;
import net.sf.jsqlparser.statement.Statement;
import net.sf.jsqlparser.statement.delete.Delete;
import net.sf.jsqlparser.statement.insert.Insert;
import net.sf.jsqlparser.statement.select.Select;
import net.sf.jsqlparser.statement.update.Update;

public class SQLParser {

	private String query;

	public SQLParser(String query) {
		this.query = query;
	}

	public List<SimpleExpression> getQueryValues() throws JSQLParserException {

		CCJSqlParserManager pm = new CCJSqlParserManager();
		Statement stmt = pm.parse(new StringReader(query));

		ArrayList<Expression> insertList = new ArrayList<Expression>();
		WhereItemsFinder wh = null;
		List<SimpleExpression> whereList = null;
		
		if (stmt instanceof Select) {
			System.out.println("its a select statement");

			Select s = (Select) stmt;
			wh = new WhereItemsFinder(s);
			// List<SimpleExpression> whereList = wh.getSelectionList();
		}
		if (stmt instanceof Insert) {
			Insert i = (Insert) stmt;
			InsertQueryWalker qw = new InsertQueryWalker(i);
			insertList = qw.getInsertItems();

			wh = new WhereItemsFinder();

			for (Iterator iterator = insertList.iterator(); iterator.hasNext();) {
				Expression expression = (Expression) iterator.next();
				wh.parseExpression(expression);
			}
		}

		if (stmt instanceof Delete) {
			Delete d = (Delete) stmt;
			wh = new WhereItemsFinder(d);
		}

		if (stmt instanceof Update) {
			Update u = (Update) stmt;
			List<Expression> updateList = u.getExpressions();

			wh = new WhereItemsFinder(u);

			for (Iterator iterator = updateList.iterator(); iterator.hasNext();) {
				Expression expression = (Expression) iterator.next();
				// System.out.println(expression.toString());
				wh.parseExpression(expression);
			}
		}

		if (wh != null) {
			whereList = wh.getSelectionList();

			for (Iterator iterator = whereList.iterator(); iterator.hasNext();) {
				SimpleExpression simpleExpression = (SimpleExpression) iterator
						.next();
				System.out.println(simpleExpression.value);

			}
		}
		
		return whereList;
	}
}
