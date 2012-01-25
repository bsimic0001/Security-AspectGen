package com.thesis.aop.xss.logic.beans;

public class AspectBean {

	public String pointcutName;
	public String pointcutParam;
	public String pointcutVars;
	public String functionName;
	public String functionParams;
	public String fileName;
	public String adviceLogic;
	
	public AspectBean(){}
	
	public AspectBean(String pointcutName, String pointcutParam,
			String pointcutVars, String functionName, String functionParams,
			String fileName, String adviceLogic) {
		super();
		this.pointcutName = pointcutName;
		this.pointcutParam = pointcutParam;
		this.pointcutVars = pointcutVars;
		this.functionName = functionName;
		this.functionParams = functionParams;
		this.fileName = fileName;
		this.adviceLogic = adviceLogic;
	}
	public String getPointcutName() {
		return pointcutName;
	}
	public void setPointcutName(String pointcutName) {
		this.pointcutName = pointcutName;
	}
	public String getPointcutParam() {
		return pointcutParam;
	}
	public void setPointcutParam(String pointcutParam) {
		this.pointcutParam = pointcutParam;
	}
	public String getPointcutVars() {
		return pointcutVars;
	}
	public void setPointcutVars(String pointcutVars) {
		this.pointcutVars = pointcutVars;
	}
	public String getFunctionName() {
		return functionName;
	}
	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}
	public String getFunctionParams() {
		return functionParams;
	}
	public void setFunctionParams(String functionParams) {
		this.functionParams = functionParams;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getAdviceLogic() {
		return adviceLogic;
	}
	public void setAdviceLogic(String adviceLogic) {
		this.adviceLogic = adviceLogic;
	}
	
	
}
