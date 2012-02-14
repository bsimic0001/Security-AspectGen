package com.thesis.aop.sqlinjection.parser;
public class SimpleExpression{
	public String tableName;
	public String columnName;
	public String op;
	public String value; 
	public int valueType;
	
	public SimpleExpression(){
		
	}
	
	public SimpleExpression(String tableName,String columnName,String op,String value,int valueType){
		this.tableName = tableName;
		this.columnName = columnName;
		this.op = op;
		this.value = value;
		this.valueType = valueType;	
	}
	
	public SimpleExpression(SimpleExpression express){
		if(express.tableName != null)
			this.tableName = express.tableName;
		else
			this.tableName = "NULL";
		
		if(express.columnName != null)
			this.columnName = express.columnName;
		else
			this.columnName = "NULL";
		this.op = express.op;
		this.value = express.value;
		this.valueType = express.valueType;
	}
}