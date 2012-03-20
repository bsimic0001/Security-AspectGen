package com.thesis.aop.data;

import java.util.ArrayList;
import java.util.Iterator;

public class Function {
	public String name;
	public String methodName;
	public int interceptParam;
	public String interceptParamType;
	public int totalParamNumber;
	public ArrayList<Param> paramList = new ArrayList<Param>();
	
	public Function(){}
	
	public Function(String name, String methodName, int interceptorParam,
			String interceptorParamType) {
		super();
		this.name = name;
		this.methodName = methodName;
		this.interceptParam = interceptorParam;
		this.interceptParamType = interceptorParamType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMethodName() {
		return methodName;
	}

	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}

	public int getInterceptParam() {
		return interceptParam;
	}

	public void setInterceptParam(int interceptorParam) {
		this.interceptParam = interceptorParam;
	}

	public String getInterceptParamType() {
		return interceptParamType;
	}

	public void setInterceptParamType(String interceptorParamType) {
		this.interceptParamType = interceptorParamType;
	}

	public int getTotalParamNumber() {
		return totalParamNumber;
	}

	public void setTotalParamNumber(int totalParamNumber) {
		this.totalParamNumber = totalParamNumber;
	}
	
	public ArrayList<Param> getParamList() {
		return paramList;
	}

	public void setParamList(ArrayList<Param> paramList) {
		this.paramList = paramList;
	}

	public void addToParams(Param p){
		this.paramList.add(p);
	}
	
	public String getResultVarName(){
		for (Iterator iterator = paramList.iterator(); iterator.hasNext();) {
			Param param = (Param) iterator.next();
			if(param.isResult())
				return param.getName();
		}
		return null;
	}
	public String getResultVarType(){
		for (Iterator iterator = paramList.iterator(); iterator.hasNext();) {
			Param param = (Param) iterator.next();
			if(param.isResult())
				return param.getType();
		}
		return null;
	}
	
	
}
