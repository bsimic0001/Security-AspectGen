package com.thesis.aop.sqlinjection.logic;

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

public class SQLInjectionAspectGenerator extends AspectGenerator{

	public String templateFileName;
	public String outputFileName;
	public String pointcutTemplateFileName;
	public File templateFile;
	public File outputFile;
	public File pointcutTemplateFile;
	public ArrayList<Issue> sqlInjectionIssues = new ArrayList<Issue>();
	public ArrayList<AspectBean> aspectBeans = new ArrayList<AspectBean>();
	public ArrayList<Function> functions;
	public HashMap<String, String> adviceMap = new HashMap<String, String>();
	public String[] templateVariables = { "<pointcut_name>",
			"<pointcut_param>", "<function_name>", "<function_params>",
			"<within_string>", "<args_string>", "<pointcut_vars>",
			"<advice_logic>", "<advice_proceed>", "<advice_type>", 
			"<result_string>", "<result_var_name>", "<result_var_type>" };
	
	public String[] sqlInjectionFixOptions = ThesisUtil.sqlInjectionFixOptions;

	public SQLInjectionAspectGenerator() {
	}

	public SQLInjectionAspectGenerator(ArrayList<Function> functions,
			ArrayList<Issue> sqlInjectionIssues) {
		this.functions = functions;
		this.sqlInjectionIssues = sqlInjectionIssues;
	}

	public void generateAspect() throws IOException {
		String withinString = createWithinString(sqlInjectionIssues);
		String lineNumberString = createLineNumberStringArray(sqlInjectionIssues);

		adviceMap = createAdviceMap(sqlInjectionIssues, sqlInjectionFixOptions);
		for (Iterator iterator = functions.iterator(); iterator.hasNext();) {
			Function f = (Function) iterator.next();
			AspectBean ab = generateAspectBean(f, withinString, lineNumberString);
			
			ab.setPointcutTemplateFileName("sqlinjection.template");
			
			aspectBeans.add(ab);
		}
		System.out.println(aspectBeans.size());
		writeAspect("SQLInjectionAspect.java.template", 
				"SQLInjectionAspect.aj", 
				"sqlinjection.template", 
				templateVariables, 
				adviceMap,
				aspectBeans);
	}
}
