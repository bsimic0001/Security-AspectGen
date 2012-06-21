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
package com.thesis.aop.logic.beans;

public class AspectBean {

	public String pointcutName;
	public String pointcutParam;
	public String pointcutVars;
	public String functionName;
	public String functionParams;
	public String withinString;
	public String adviceLogic;
	public String lineNumberString;
	public String argsString;
	public String functionType;
	public String resultString;
	public String resultVarName;
	public String resultVarType;
	public String pointcutTemplateFileName;
	
	public AspectBean(){}
	

	public AspectBean(String pointcutName, String pointcutParam,
			String pointcutVars, String functionName, String functionParams,
			String withinString, String adviceLogic, String lineNumberString,
			String argsString, String functionType, String resultString, 
			String resultVarName, String resultVarType) {
		super();
		this.pointcutName = pointcutName;
		this.pointcutParam = pointcutParam;
		this.pointcutVars = pointcutVars;
		this.functionName = functionName;
		this.functionParams = functionParams;
		this.withinString = withinString;
		this.adviceLogic = adviceLogic;
		this.lineNumberString = lineNumberString;
		this.argsString = argsString;
		this.functionType = functionType;
		this.resultString = resultString;
		this.resultVarName = resultVarName;
		this.resultVarType = resultVarType;
		
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
	public String getWithinString() {
		return withinString;
	}
	public void setWithinString(String fileName) {
		this.withinString = fileName;
	}
	public String getAdviceLogic() {
		return adviceLogic;
	}
	public void setAdviceLogic(String adviceLogic) {
		this.adviceLogic = adviceLogic;
	}

	public String getLineNumberString() {
		return lineNumberString;
	}

	public void setLineNumberString(String lineNumberString) {
		this.lineNumberString = lineNumberString;
	}

	public String getArgsString() {
		return argsString;
	}

	public void setArgsString(String argsString) {
		this.argsString = argsString;
	}


	public String getFunctionType() {
		return functionType;
	}


	public void setFunctionType(String functionType) {
		this.functionType = functionType;
	}


	public String getResultString() {
		return resultString;
	}


	public void setResultString(String resultString) {
		this.resultString = resultString;
	}


	public void setResultVarName(String resultVarName) {
		this.resultVarName = resultVarName;
	}


	public String getResultVarName() {
		// TODO Auto-generated method stub
		return resultVarName;
	}


	public String getResultVarType() {
		return resultVarType;
	}


	public void setResultVarType(String resultVarType) {
		this.resultVarType = resultVarType;
	}


	public String getPointcutTemplateFileName() {
		return pointcutTemplateFileName;
	}


	public void setPointcutTemplateFileName(String pointcutTemplateFileName) {
		this.pointcutTemplateFileName = pointcutTemplateFileName;
	}	
	
	
	
	
}
