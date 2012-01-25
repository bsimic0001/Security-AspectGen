package com.thesis.aop.xss.logic;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;

import com.thesis.aop.data.Function;
import com.thesis.aop.data.Issue;
import com.thesis.aop.xss.logic.beans.AspectBean;

public class XSSAspectGenerator {

	public String templateFileName;
	public String outputFileName;
	public String pointcutTemplateFileName;
	public File templateFile;
	public File outputFile; 
	public File pointcutTemplateFile;
	public ArrayList<Issue> xssIssues = new ArrayList<Issue>();
	public ArrayList<AspectBean> aspectBeans = new ArrayList<AspectBean>();
	ArrayList<Function> functions;
	
	public XSSAspectGenerator(){}
	
	public XSSAspectGenerator(ArrayList<Function> functions, ArrayList<Issue> xssIssues){
		this.functions = functions;
		this.xssIssues = xssIssues;
	}

	
	public void generateAspect(){
		String withinString = createWithinString();
		String lineNumberString = createLineNumberStringArray();
		
		for (Iterator iterator = functions.iterator(); iterator.hasNext();) {
			Function f = (Function) iterator.next();
			generateAspectBean(f, withinString, lineNumberString);
		}
		writeAspect();
	}
	
	public String createWithinString(){
		String withinString = "";
		for (int i = 0; i < xssIssues.size(); i++) {
			Issue tempIssue = xssIssues.get(i);
			withinString += "within(" + tempIssue.getFilePath().replaceAll("/", ".") + ")";
			if(i != 0 || i != xssIssues.size() -1)
				withinString += " || ";
		}
		
		return withinString;
	}
	
	public String createLineNumberStringArray(){
		String lineNumberString = "{";
		for (int i = 0; i < xssIssues.size(); i++) {
			Issue tempIssue = xssIssues.get(i);
			lineNumberString += tempIssue.getLineStart();
			if(i != 0 || i != xssIssues.size() -1)
				lineNumberString += ", ";
		}
		lineNumberString += "}";
		return lineNumberString;		
	}
	
	public void generateAspectBean(Function f, String withinString, String lineNumberString){
		//Code for generating individual beans
		AspectBean newBean = new AspectBean();
		newBean.setPointcutName(f.getName());
		newBean.setPointcutParam(createPointcutParam(f));
		newBean.setFunctionName(f.getMethodName());
		newBean.setFunctionParams(createFunctionParams(f));
		newBean.setWithinString(withinString);
		newBean.setLineNumberString(lineNumberString);

		newBean.setAdviceLogic(generateLogicForAdvice(f));
	}
	
	public String createPointcutParam(Function f){
		String pointcutParam = "";
		pointcutParam += f.getInterceptParamType() + " param" + f.getInterceptParam();
		return pointcutParam;
	}
	
	public String createFunctionParams(Function f){
		String functionParams = "";
		for(int i = 0; i < f.getInterceptParam(); i++){
			if(i == f.getInterceptParam() - 1)
				functionParams += f.getInterceptParamType();
			else
				functionParams += ".., ";
		}
		return functionParams;
	}
	
	
	public void writeAspect(){
		//Write aspect code to template file
	}
	
	public String generateLogicForAdvice(Function f){
		return "Advice Logic " + f.getMethodName();
	}
}
