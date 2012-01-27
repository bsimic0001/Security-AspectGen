package com.thesis.aop.xss.logic;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
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
	public ArrayList<Function> functions;
	public String[] templateVariables = { "<pointcut_name>",
			"<pointcut_param>", "<function_name>", "<function_params>",
			"<within_string>", "<args_string>", "<pointcut_vars>",
			"<advice_logic>" };

	public XSSAspectGenerator() {
	}

	public XSSAspectGenerator(ArrayList<Function> functions,
			ArrayList<Issue> xssIssues) {
		this.functions = functions;
		this.xssIssues = xssIssues;
	}

	public void generateAspect() {
		String withinString = createWithinString();
		String lineNumberString = createLineNumberStringArray();

		for (Iterator iterator = functions.iterator(); iterator.hasNext();) {
			Function f = (Function) iterator.next();
			generateAspectBean(f, withinString, lineNumberString);
		}
		System.out.println(aspectBeans.size());
		writeAspect();
	}

	public String createWithinString() {
		String withinString = "";
		for (int i = 0; i < xssIssues.size(); i++) {
			Issue tempIssue = xssIssues.get(i);
			withinString += "within("
					+ tempIssue.getFilePath().replaceAll("/", ".") + ")";
			if (i != xssIssues.size() - 1)
				withinString += " || ";
		}

		return withinString;
	}

	public String createLineNumberStringArray() {
		String lineNumberString = "{";
		for (int i = 0; i < xssIssues.size(); i++) {
			Issue tempIssue = xssIssues.get(i);
			lineNumberString += tempIssue.getLineStart();
			if (i != 0 || i != xssIssues.size() - 1)
				lineNumberString += ", ";
		}
		lineNumberString += "}";
		return lineNumberString;
	}

	public void generateAspectBean(Function f, String withinString,
			String lineNumberString) {
		// Code for generating individual beans
		AspectBean newBean = new AspectBean();
		newBean.setPointcutName(f.getName());
		newBean.setPointcutParam(createPointcutParam(f));
		newBean.setFunctionName(f.getMethodName());
		newBean.setFunctionParams(createFunctionParams(f));
		newBean.setWithinString(withinString);
		newBean.setArgsString(createArgsString(f));
		newBean.setPointcutVars(createPointcutVarsString(f));
		newBean.setLineNumberString(lineNumberString);
		newBean.setAdviceLogic(generateLogicForAdvice(f));
		aspectBeans.add(newBean);
	}

	public String createPointcutParam(Function f) {
		String pointcutParam = "";
		pointcutParam += f.getInterceptParamType() + " param"
				+ f.getInterceptParam();
		return pointcutParam;
	}

	public String createFunctionParams(Function f) {
		String functionParams = "";
		for (int i = 0; i < f.getInterceptParam(); i++) {
			if (i == f.getInterceptParam() - 1)
				functionParams += f.getInterceptParamType();
			else
				functionParams += ".., ";
		}
		return functionParams;
	}

	public String createArgsString(Function f) {
		String args = "";
		args += "param";
		args += f.getInterceptParam();
		return args;
	}

	public String createPointcutVarsString(Function f){
		String vars = "";
		vars += "param";
		vars += f.getInterceptParam();
		return vars;
	}
	
	public String generateLogicForAdvice(Function f) {
		return "Advice Logic " + f.getMethodName();
	}

	public void writeAspect() {
		try {
			// Write aspect code to template file
			FileInputStream aspectInputStream = new FileInputStream(
					System.getProperty("user.dir")
							+ "/data/templates/aspects/XSSAspect.java.template");
			DataInputStream aspectDataStream = new DataInputStream(
					aspectInputStream);
			FileOutputStream aspectOutputStream = new FileOutputStream(
					System.getProperty("user.dir")
							+ "/data/templates/aspects/XSSAspect.aj");
			DataOutputStream aspectDataOutputStream = new DataOutputStream(
					aspectOutputStream);

			String str;

			while (null != ((str = aspectDataStream.readLine()))) {

				String stringToReplace = "<insert_code_here>";
				if (str.indexOf(stringToReplace) > -1) {

					str = str + "\n";
					System.out.println("Writing aspect");
					for (Iterator iterator = aspectBeans.iterator(); iterator
							.hasNext();) {
						AspectBean aspectBean = (AspectBean) iterator.next();
						writePointcutAdvice(aspectDataOutputStream, aspectBean);
						aspectDataOutputStream.writeBytes("\n");

					}
					// aspectDataOutputStream.writeBytes(str);
				}
			}
		} catch (IOException ioe) {
			System.err.println("I/O Error - " + ioe);
		}
	}

	public void writePointcutAdvice(DataOutputStream aspectDataOutputStream,
			AspectBean aspectBean) {
		FileInputStream templateInputStream;
		try {
			aspectDataOutputStream.writeBytes("//writing pointcut \n");
			templateInputStream = new FileInputStream(
					System.getProperty("user.dir")
							+ "/data/templates/xss.template");
			DataInputStream templateDataStream = new DataInputStream(
					templateInputStream);

			String str;
			while (null != ((str = templateDataStream.readLine()))) {

				for (int i = 0; i < templateVariables.length; i++) {
					String toReplace = templateVariables[i];
					String replaceValue = getValueForTemplateVariable(
							templateVariables[i], aspectBean);

					int x = 0;
					int y = 0;
					String result = "";
					while ((x = str.indexOf(toReplace, y)) > -1) {
						result += str.substring(y, x);
						result += replaceValue;
						y = x + toReplace.length();
					}
					result += str.substring(y);
					str = result;

					if (str.indexOf("'',") != -1) {
						continue;
					}			
				}
				aspectDataOutputStream.writeBytes("\n");
				aspectDataOutputStream.writeBytes(str);
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String getValueForTemplateVariable(String templateVariable,
			AspectBean aspectBean) {
		String returnString = "";

		if (templateVariable.equals(templateVariables[0])) {
			returnString = aspectBean.getPointcutName();
		} else if (templateVariable.equals(templateVariables[1])) {
			returnString = aspectBean.getPointcutParam();
		} else if (templateVariable.equals(templateVariables[2])) {
			returnString = aspectBean.getFunctionName();
		} else if (templateVariable.equals(templateVariables[3])) {
			returnString = aspectBean.getFunctionParams();
		} else if (templateVariable.equals(templateVariables[4])) {
			returnString = aspectBean.getWithinString();
		} else if (templateVariable.equals(templateVariables[5])) {
			returnString = aspectBean.getArgsString();
		} else if (templateVariable.equals(templateVariables[6])) {
			returnString = aspectBean.getPointcutVars();
		} else if (templateVariable.equals(templateVariables[7])) {
			returnString = "advice logic";
		}
		return returnString;
	}
}
