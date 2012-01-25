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
	
	public XSSAspectGenerator(ArrayList<Function> functions){
		this.functions = functions;
	}

	
	public void generateAspect(){
		for (Iterator iterator = xssIssues.iterator(); iterator.hasNext();) {
			Issue i = (Issue) iterator.next();
			generateAspectBean(i);
		}
		writeAspect();
	}
	
	public void generateAspectBean(Issue i){
		//Code for generating individual beans
		AspectBean newBean = new AspectBean();
		newBean.setFileName(i.getFilePath().replaceAll("/", "."));
		newBean.setFunctionName();

		newBean.setAdviceLogic(generateLogicForAdvice(i));
	}
	
	
	public void writeAspect(){
		//Write aspect code to template file
	}
	
	public String generateLogicForAdvice(Issue i){
		return "Advice Logic " + i.getFileName() + " " + i.getLineStart();
	}
}
