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
package com.thesis.aop.sqlinjection.parser;
import java.util.ArrayList;

import net.sf.jsqlparser.expression.AllComparisonExpression;
import net.sf.jsqlparser.expression.AnyComparisonExpression;
import net.sf.jsqlparser.expression.CaseExpression;
import net.sf.jsqlparser.expression.DateValue;
import net.sf.jsqlparser.expression.DoubleValue;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.ExpressionVisitor;
import net.sf.jsqlparser.expression.Function;
import net.sf.jsqlparser.expression.InverseExpression;
import net.sf.jsqlparser.expression.JdbcParameter;
import net.sf.jsqlparser.expression.LongValue;
import net.sf.jsqlparser.expression.NullValue;
import net.sf.jsqlparser.expression.Parenthesis;
import net.sf.jsqlparser.expression.StringValue;
import net.sf.jsqlparser.expression.TimeValue;
import net.sf.jsqlparser.expression.TimestampValue;
import net.sf.jsqlparser.expression.WhenClause;
import net.sf.jsqlparser.expression.operators.arithmetic.Addition;
import net.sf.jsqlparser.expression.operators.arithmetic.BitwiseAnd;
import net.sf.jsqlparser.expression.operators.arithmetic.BitwiseOr;
import net.sf.jsqlparser.expression.operators.arithmetic.BitwiseXor;
import net.sf.jsqlparser.expression.operators.arithmetic.Concat;
import net.sf.jsqlparser.expression.operators.arithmetic.Division;
import net.sf.jsqlparser.expression.operators.arithmetic.Multiplication;
import net.sf.jsqlparser.expression.operators.arithmetic.Subtraction;
import net.sf.jsqlparser.expression.operators.conditional.AndExpression;
import net.sf.jsqlparser.expression.operators.conditional.OrExpression;
import net.sf.jsqlparser.expression.operators.relational.Between;
import net.sf.jsqlparser.expression.operators.relational.EqualsTo;
import net.sf.jsqlparser.expression.operators.relational.ExistsExpression;
import net.sf.jsqlparser.expression.operators.relational.ExpressionList;
import net.sf.jsqlparser.expression.operators.relational.GreaterThan;
import net.sf.jsqlparser.expression.operators.relational.GreaterThanEquals;
import net.sf.jsqlparser.expression.operators.relational.InExpression;
import net.sf.jsqlparser.expression.operators.relational.IsNullExpression;
import net.sf.jsqlparser.expression.operators.relational.ItemsListVisitor;
import net.sf.jsqlparser.expression.operators.relational.LikeExpression;
import net.sf.jsqlparser.expression.operators.relational.Matches;
import net.sf.jsqlparser.expression.operators.relational.MinorThan;
import net.sf.jsqlparser.expression.operators.relational.MinorThanEquals;
import net.sf.jsqlparser.expression.operators.relational.NotEqualsTo;
import net.sf.jsqlparser.schema.Column;
import net.sf.jsqlparser.statement.delete.Delete;
import net.sf.jsqlparser.statement.select.PlainSelect;
import net.sf.jsqlparser.statement.select.Select;
import net.sf.jsqlparser.statement.select.SelectVisitor;
import net.sf.jsqlparser.statement.select.SubSelect;
import net.sf.jsqlparser.statement.select.Union;
import net.sf.jsqlparser.statement.update.Update;


class ExpressionItem{
	int expressionType;//0 as column; 1 as operator; 2 as value
	String tableName;
	String columnName;
	String op;
	String valueType;
	String value;
}

public class WhereItemsFinder implements SelectVisitor, ExpressionVisitor{
	private ArrayList<JoinExpression> joinList;
	private ArrayList<SimpleExpression> selectionList;
	private ArrayList<ExpressionItem> itemList;
	private boolean leftExpression = false;

	public WhereItemsFinder(Select select){
		joinList = new ArrayList<JoinExpression>();
		selectionList = new ArrayList<SimpleExpression>();
		itemList = new ArrayList<ExpressionItem>();
		select.getSelectBody().accept(this);
		seperateList();
	}
	public WhereItemsFinder(Delete delete){
		joinList = new ArrayList<JoinExpression>();
		selectionList = new ArrayList<SimpleExpression>();
		itemList = new ArrayList<ExpressionItem>();
		delete.getWhere().accept(this);
		seperateList();
	}
	
	public WhereItemsFinder(Update u){
		joinList = new ArrayList<JoinExpression>();
		selectionList = new ArrayList<SimpleExpression>();
		itemList = new ArrayList<ExpressionItem>();
		u.getWhere().accept(this);
		seperateList();
	}
	
	public WhereItemsFinder(){
		joinList = new ArrayList<JoinExpression>();
		selectionList = new ArrayList<SimpleExpression>();
		itemList = new ArrayList<ExpressionItem>();
	}
	
	public void parseExpression(Expression e){
		//joinList = new ArrayList<JoinExpression>();
		//selectionList = new ArrayList<SimpleExpression>();
		itemList = new ArrayList<ExpressionItem>();
		e.accept(this);
		seperateList();
	}
	
	
	public ArrayList<JoinExpression> getJionList(){
		return joinList;
	}
	public ArrayList<SimpleExpression> getSelectionList(){
		return selectionList;
	}
	public ArrayList<ExpressionItem> getSelectionItemList(){
		return itemList;
	}
	private void seperateList(){
		if(itemList.size() > 1)
			for(int i=0;i<itemList.size();i+=3){
				ExpressionItem leftItem = itemList.get(i);
				ExpressionItem operator = itemList.get(i+1);
				ExpressionItem rightItem = itemList.get(i+2);
				if(leftItem.expressionType == 0 && rightItem.expressionType == 0){
					JoinExpression joinItem = new JoinExpression();
					joinItem.leftTableName = leftItem.tableName;
					joinItem.leftColumn = leftItem.columnName;
					joinItem.op = operator.op;
					joinItem.rightTableName = rightItem.tableName;
					joinItem.rigthColumn = rightItem.columnName;
					joinList.add(joinItem);
				}
				else{
					SimpleExpression selectionItem = new SimpleExpression();
					selectionItem.tableName = leftItem.tableName;
					selectionItem.columnName = leftItem.columnName;
					selectionItem.op = operator.op;
					if(rightItem.valueType.equalsIgnoreCase("int")||rightItem.valueType.equalsIgnoreCase("long"))
						selectionItem.valueType = CONSTANT.VALUE_INT;
					else if(rightItem.valueType.equalsIgnoreCase("double"))
						selectionItem.valueType = CONSTANT.VALUE_DOUBLE;
					else if(rightItem.valueType.equalsIgnoreCase("string"))
						selectionItem.valueType = CONSTANT.VALUE_STRING;
					selectionItem.value = rightItem.value;
					selectionList.add(selectionItem);
				}
			}
		else{
			ExpressionItem firstItem = itemList.get(0);
			SimpleExpression selectionItem = new SimpleExpression();
			selectionItem.tableName = firstItem.tableName;
			selectionItem.columnName = firstItem.columnName;
			
			if(firstItem.valueType.equalsIgnoreCase("int")||firstItem.valueType.equalsIgnoreCase("long"))
				selectionItem.valueType = CONSTANT.VALUE_INT;
			else if(firstItem.valueType.equalsIgnoreCase("double"))
				selectionItem.valueType = CONSTANT.VALUE_DOUBLE;
			else if(firstItem.valueType.equalsIgnoreCase("string"))
				selectionItem.valueType = CONSTANT.VALUE_STRING;
			
			selectionItem.value = firstItem.value;
			selectionList.add(selectionItem);
			
		}
	}
	
	@Override
	public void visit(PlainSelect plainSelect) {
		if(plainSelect.getWhere()!=null)
			plainSelect.getWhere().accept(this);
	}

	@Override
	public void visit(Union union) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void visit(NullValue nullValue) {
		ExpressionItem item = new ExpressionItem();
		setExpressionType(item, nullValue.toString());
		//item.expressionType = 2;
		item.valueType = "NULL";
		item.value = nullValue.toString();
		itemList.add(item);
	}

	@Override
	public void visit(Function function) {
		ExpressionItem item = new ExpressionItem();
		item.expressionType = 0;
		item.columnName = function.toString();
		itemList.add(item);
		leftExpression = false;
		// TODO Auto-generated method stub
		
	}

	@Override
	public void visit(InverseExpression inverseExpression) {
		// TODO Auto-generated method stub
	}

	@Override
	public void visit(JdbcParameter jdbcParameter) {
		// TODO Auto-generated method stub
	}

	@Override
	public void visit(DoubleValue doubleValue) {
		ExpressionItem item = new ExpressionItem();
		setExpressionType(item, doubleValue.toString());
		//item.expressionType = 2;
		item.valueType = "double";
		item.value = doubleValue.toString();
		itemList.add(item);
	}

	@Override
	public void visit(LongValue longValue) {
		//System.out.println(longValue.getValue());
		ExpressionItem item = new ExpressionItem();
		setExpressionType(item, longValue.toString());
		//item.expressionType = 2;
		item.valueType = "long";
		item.value = longValue.getStringValue();
		itemList.add(item);
	}

	@Override
	public void visit(DateValue dateValue) {
		ExpressionItem item = new ExpressionItem();
		setExpressionType(item, dateValue.toString());
		//item.expressionType = 2;
		item.valueType = "date";
		item.value = dateValue.toString();
		itemList.add(item);
	}

	@Override
	public void visit(TimeValue timeValue) {
		ExpressionItem item = new ExpressionItem();
		setExpressionType(item, timeValue.toString());
		//item.expressionType = 2;
		item.valueType = "time";
		item.value = timeValue.toString();
		itemList.add(item);
	}

	@Override
	public void visit(TimestampValue timestampValue) {
		ExpressionItem item = new ExpressionItem();
		setExpressionType(item, timestampValue.toString());
		//item.expressionType = 2;
		item.valueType = "timestamp";
		item.value = timestampValue.toString();
		itemList.add(item);
	}

	@Override
	public void visit(Parenthesis parenthesis) {
		parenthesis.getExpression().accept(this);
	}

	@Override
	public void visit(StringValue stringValue) {
		ExpressionItem item = new ExpressionItem();
		setExpressionType(item, stringValue.getValue());
		//item.expressionType = 2;
		item.valueType = "string";
		item.value = stringValue.getValue();
		itemList.add(item);
	}

	@Override
	public void visit(Addition addition) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void visit(Division division) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void visit(Multiplication multiplication) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void visit(Subtraction subtraction) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void visit(AndExpression andExpression) {
		//System.out.println("TPYE:AND");
		//System.out.println(andExpression.getLeftExpression().toString());
		//System.out.println(andExpression.getRightExpression().toString());
		andExpression.getLeftExpression().accept(this);
		andExpression.getRightExpression().accept(this);
	}

	@Override
	public void visit(OrExpression orExpression) {
		//System.out.println("TYPE:OR");
		orExpression.getLeftExpression().accept(this);
		orExpression.getRightExpression().accept(this);
	}

	@Override
	public void visit(Between between) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void visit(EqualsTo equalsTo) {
		//System.out.println("TPYE:=");
		leftExpression = true;
		equalsTo.getLeftExpression().accept(this);
		ExpressionItem item = new ExpressionItem();
		item.expressionType = 1;
		item.op = "=";
		itemList.add(item);
		leftExpression = false;
		equalsTo.getRightExpression().accept(this);
	}

	@Override
	public void visit(GreaterThan greaterThan) {
		leftExpression = true;
		greaterThan.getLeftExpression().accept(this);
		ExpressionItem item = new ExpressionItem();
		item.expressionType = 1;
		item.op = ">";
		itemList.add(item);
		leftExpression = false;
		greaterThan.getRightExpression().accept(this);
	}

	@Override
	public void visit(GreaterThanEquals greaterThanEquals) {
		leftExpression = true;
		greaterThanEquals.getLeftExpression().accept(this);
		ExpressionItem item = new ExpressionItem();
		item.expressionType = 1;
		item.op = ">=";
		itemList.add(item);
		leftExpression = false;
		greaterThanEquals.getRightExpression().accept(this);
	}

	@Override
	public void visit(InExpression inExpression) {
		
	}

	@Override
	public void visit(IsNullExpression isNullExpression) {
		leftExpression = true;
		isNullExpression.getLeftExpression().accept(this);
		ExpressionItem item = new ExpressionItem();
		item.expressionType = 1;
		item.op = (isNullExpression.isNot()?"!=":"=");
		itemList.add(item);
		leftExpression = false;
		ExpressionItem item2 = new ExpressionItem();
		item2.expressionType = 2;
		item2.valueType = "NULL";
		item2.value = "NULL";
		itemList.add(item2);
		
	}

	@Override
	public void visit(LikeExpression likeExpression) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void visit(MinorThan minorThan) {
		//System.out.println("<");
		leftExpression = true;
		minorThan.getLeftExpression().accept(this);
		ExpressionItem item = new ExpressionItem();
		item.expressionType = 1;
		item.op = "<";
		itemList.add(item);
		leftExpression = false;
		minorThan.getRightExpression().accept(this);
	}

	@Override
	public void visit(MinorThanEquals minorThanEquals) {
		leftExpression = true;
		minorThanEquals.getLeftExpression().accept(this);
		ExpressionItem item = new ExpressionItem();
		item.expressionType = 1;
		item.op = "<=";
		itemList.add(item);
		leftExpression = false;
		minorThanEquals.getRightExpression().accept(this);
	}

	@Override
	public void visit(NotEqualsTo notEqualsTo) {
		leftExpression = true;
		notEqualsTo.getLeftExpression().accept(this);
		ExpressionItem item = new ExpressionItem();
		item.expressionType = 1;
		item.op = "<>";
		itemList.add(item);
		leftExpression = false;
		notEqualsTo.getRightExpression().accept(this);
	}

	@Override
	public void visit(Column tableColumn) {
		//System.out.println("TYPE:table column");
		//System.out.println(tableColumn.getColumnName());
		//System.out.println(tableColumn.getTable().toString());
		ExpressionItem item = new ExpressionItem();
		item.expressionType = 0;
		item.tableName = tableColumn.getTable().toString();
		item.columnName = tableColumn.getColumnName();
		itemList.add(item);
		leftExpression = false;

	}

	@Override
	public void visit(SubSelect subSelect) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void visit(CaseExpression caseExpression) {
		// TODO Auto-generated method stub
	}

	@Override
	public void visit(WhenClause whenClause) {
		// TODO Auto-generated method stub
	
	}

	@Override
	public void visit(ExistsExpression existsExpression) {
		// TODO Auto-generated method stub
	}

	@Override
	public void visit(AllComparisonExpression allComparisonExpression) {
		// TODO Auto-generated method stub
	}

	@Override
	public void visit(AnyComparisonExpression anyComparisonExpression) {
		// TODO Auto-generated method stub		
	}
	@Override
	public void visit(Concat arg0) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void visit(Matches arg0) {
		// TODO Auto-generated method stub
	}
	@Override
	public void visit(BitwiseAnd arg0) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void visit(BitwiseOr arg0) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void visit(BitwiseXor arg0) {
		// TODO Auto-generated method stub
		
	}
	
	public void setExpressionType(ExpressionItem i, String value){
		if(leftExpression){
			i.expressionType = 0;
			i.columnName = value;
		}
		else
			i.expressionType = 2;
		leftExpression = false;
	}


}
