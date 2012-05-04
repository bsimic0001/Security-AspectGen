package com.thesis.aop.xss.logic;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import com.thesis.aop.data.Function;
import com.thesis.aop.data.Issue;
import com.thesis.aop.logic.AspectGenerator;
import com.thesis.aop.logic.beans.AspectBean;
import com.thesis.aop.util.ThesisUtil;

public class XSSAspectGenerator extends AspectGenerator{

	public String templateFileName;
	public String outputFileName;
	public String pointcutTemplateFileName;
	public File templateFile;
	public File outputFile;
	public File pointcutTemplateFile;
	public ArrayList<Issue> xssIssues = new ArrayList<Issue>();
	public ArrayList<AspectBean> aspectBeans = new ArrayList<AspectBean>();
	public ArrayList<Function> functions;
	public HashMap<String, String> adviceMap = new HashMap<String, String>();
	public HashMap<String, String> customRegexMap = new HashMap<String, String>();
	 
	public String[] templateVariables = { "<pointcut_name>",
			"<pointcut_param>", "<function_name>", "<function_params>",
			"<within_string>", "<args_string>", "<pointcut_vars>",
			"<advice_logic>", "<advice_proceed>", "<advice_type>", 
			"<result_string>", "<result_var_name>", "<result_var_type>" };
	
	public String[] xssFixOptions = ThesisUtil.xssFixOptions;

	public XSSAspectGenerator() {
	}

	public XSSAspectGenerator(ArrayList<Function> functions,
			ArrayList<Issue> xssIssues) {
		this.functions = functions;
		this.xssIssues = xssIssues;
	}

	public void generateAspect() throws IOException {
		String withinString = createWithinString(xssIssues);
		String lineNumberString = createLineNumberStringArray(xssIssues);

		adviceMap = createAdviceMap(xssIssues, xssFixOptions);
		for (Iterator iterator = functions.iterator(); iterator.hasNext();) {
			Function f = (Function) iterator.next();
			AspectBean ab = generateAspectBean(f, withinString, lineNumberString);
			
			
			if(f.encodeReturnValue)
				ab.setPointcutTemplateFileName("xssreturnValue.template");
			else
				ab.setPointcutTemplateFileName("xss.template");
			aspectBeans.add(ab);
		}
		System.out.println(aspectBeans.size());
		writeAspect("XSSAspect.java.template", 
				"XSSAspect.aj", 
				"xss.template", 
				templateVariables, 
				adviceMap,
				aspectBeans);
	}
}
