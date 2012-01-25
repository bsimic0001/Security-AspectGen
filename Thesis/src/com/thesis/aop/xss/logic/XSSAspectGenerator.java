package com.thesis.aop.xss.logic;

import java.io.File;
import java.util.ArrayList;

import com.thesis.aop.data.Issue;

public class XSSAspectGenerator {

	public String templateFileName;
	public String outputFileName;
	public String pointcutTemplateFileName;
	public File templateFile;
	public File outputFile; 
	public File pointcutTemplateFile;
	public ArrayList<Issue> xssIssues = new ArrayList<Issue>();
	
	public XSSAspectGenerator(){}
	
}
