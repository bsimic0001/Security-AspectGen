package com.thesis.aop.data;

public class Function {
	public String name;
	public String methodName;
	public int interceptParam;
	public String interceptParamType;
	
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
	
}
