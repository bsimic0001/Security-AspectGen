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
package com.thesis.aop.logic;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import sun.reflect.ReflectionFactory.GetReflectionFactoryAction;

import com.thesis.aop.data.Function;
import com.thesis.aop.data.Issue;
import com.thesis.aop.data.Param;
import com.thesis.aop.logic.beans.AspectBean;

public class AspectGenerator {
	
	public boolean autoPilot = false;
	
	public HashMap<String, String> createAdviceMap(ArrayList<Issue> issues, String[] fixOptions) throws IOException{
		HashMap<String, String> map = new HashMap<String, String>();
		
		for (Iterator iterator = issues.iterator(); iterator.hasNext();) {
			Issue i = (Issue) iterator.next();
			if(!map.containsKey(i.getFileName() + "_" + i.getLineStart())){
				String advice = getAdviceForIssue(i, fixOptions);
				//System.out.println(i.getIid() + " *********  -   " + i.getFileName() + "_" + i.getLineStart());
				map.put(i.getFileName() + "_" + i.getLineStart(), advice);
			}
		}
		return map;
		
	}
	
	public String getAdviceForIssue(Issue i, String[] fixOptions) throws IOException{
		String advice = "";
		System.out.println("");
		System.out.println("How would you like to fix this issue? ");
		System.out.println("--------------------------------------");
		System.out.println("Issue Category: " + i.getCategory());
		System.out.println("Issue ID: " + i.getIid());
		System.out.println("Issue File and Line Number: " + i.getFilePath() + ",  " + i.getLineStart());
		System.out.println("Issue Priority: " + i.getPriority());
		System.out.println("Issue Information: " + i.getAbstractDefn());
		 
	    BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		System.out.println("");
		for (int j = 0; j < fixOptions.length; j++) {
			System.out.println(j + " - " + fixOptions[j]);
		}
		System.out.print("Enter Option: ");
		Integer answerInteger = 0;
		
		if(!autoPilot){
			String answer = br.readLine();
			answerInteger = new Integer(answer);
		}
		else{
			answerInteger = 0 + (int)(Math.random() * (((fixOptions.length - 1) - 0) + 1));
		}
		
		if(!autoPilot && answerInteger.intValue() == 99){
			autoPilot = true;
			answerInteger = 0 + (int)(Math.random() * (((fixOptions.length) - 1 - 0) + 1));
		}
		
		advice = fixOptions[answerInteger.intValue()];
		
		if(advice.equals("CUSTOM")){
			
			System.out.println("");
			System.out.print("Enter Custom: ");
			String custom = "";
			if(!autoPilot)
				custom = br.readLine();
			else
				custom = "[a-z]+";
			advice = custom;
		}
		
		return advice;
	}
	
	public String getAdviceStringForAnswer(String s, Issue i){
		return s + " " + i.getFilePath() + " : " + i.getLineStart();
	}
	
	public String createWithinString(ArrayList<Issue> issues) {
		String withinString = "";
		ArrayList<String> uniqueFiles = new ArrayList<String>();
		for (Issue issue : issues) {
			if(!uniqueFiles.contains(issue.getFileName()))
				uniqueFiles.add(issue.getFileName());
		}
		int j = 0;
		for (int i = 0; i < issues.size(); i++) {
			Issue tempIssue = issues.get(i);
			tempIssue.setFilePath(tempIssue.getFilePath().replaceAll(".java", ""));
			if(!withinString.contains(tempIssue.getFileName().replaceAll(".java", ""))){
				withinString += "within("
					+ "*.." + tempIssue.getFileName().replaceAll(".java", "") + ")";
				j++;
				//withinString += "within("
				//		+ tempIssue.getFilePath().replaceAll("/", ".") + ")";
				//if (j != uniqueFiles.size()-1)
				//	withinString += " || \n\t\t\t";
				
			}
		}
		withinString = withinString.replaceAll("\\)within", ") || \n\t\t\twithin");

		return withinString;
	}
	
	public String createLineNumberStringArray(ArrayList<Issue> issues) {
		String lineNumberString = "{";
		for (int i = 0; i < issues.size(); i++) {
			Issue tempIssue = issues.get(i);
			lineNumberString += tempIssue.getLineStart();
			if (i != 0 || i != issues.size() - 1)
				lineNumberString += ", ";
		}
		lineNumberString += "}";
		return lineNumberString;
	}
	
	public AspectBean generateAspectBean(Function f, String withinString,
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
		newBean.setFunctionType(f.getInterceptParamType());
		newBean.setResultString(createResultString(f));
		newBean.setResultVarName(f.getResultVarName());
		newBean.setResultVarType(f.getResultVarType());
		//aspectBeans.add(newBean);
		return newBean;
	}
	
	public String createPointcutParam(Function f) {
		String pointcutParam = "";
		ArrayList<Param> paramList = f.getParamList();
		
		for (Iterator iterator = paramList.iterator(); iterator.hasNext();) {
			Param param = (Param) iterator.next();
			pointcutParam = pointcutParam + param.type + " " + param.name;
			if(iterator.hasNext())
				pointcutParam = pointcutParam + ", ";
		}
		
		//pointcutParam += f.getInterceptParamType() + " param"
		//		+ f.getInterceptParam();
		return pointcutParam;
	}

	public String createFunctionParams(Function f) {
		String functionParams = "";
		ArrayList<Param> paramList = f.getParamList();
		
		for (Iterator iterator = paramList.iterator(); iterator.hasNext();) {
			Param param = (Param) iterator.next();
			functionParams = functionParams + param.type;
			if(iterator.hasNext())
				functionParams = functionParams + ", ";
		}
		
		//for (int i = 0; i < f.getInterceptParam(); i++) {
		//	if (i == f.getInterceptParam() - 1)
		//		functionParams += f.getInterceptParamType();
		//	else
		//		functionParams += ".., ";
		//}
		return functionParams;
	}

	public String createArgsString(Function f) {
		String args = "";
		
		ArrayList<Param> paramList = f.getParamList();
		
		for (Iterator iterator = paramList.iterator(); iterator.hasNext();) {
			Param param = (Param) iterator.next();
			args = args + param.name;
			if(iterator.hasNext())
				args = args + ", ";
		}
		
		//args += "param";
		//args += f.getInterceptParam();
		return args;
	}

	public String createPointcutVarsString(Function f){
		String vars = "";
		
		ArrayList<Param> paramList = f.getParamList();
		
		for (Iterator iterator = paramList.iterator(); iterator.hasNext();) {
			Param param = (Param) iterator.next();
			vars = vars + param.name;
			if(iterator.hasNext())
				vars = vars + ", ";
		}
		
		//vars += "param";
		//vars += f.getInterceptParam();
		return vars;
	}
	
	public String createResultString(Function f){
		String resultString = "";
		
		ArrayList<Param> paramList = f.getParamList();
		
		for (Iterator iterator = paramList.iterator(); iterator.hasNext();) {
			Param param = (Param) iterator.next();
			if(param.isResult())
				resultString = resultString + "result";
			else
				resultString = resultString + param.name;
			if(iterator.hasNext())
				resultString = resultString + ", ";
		}
		
		return resultString;
	}
	
	public String generateLogicForAdvice(Function f) {
		return "Advice Logic " + f.getMethodName();
	}
	
	public void writeAspect(String templateFileName, 
			String resultFileName, 
			String pointcutFileName, 
			String[] templateVariables,  
			HashMap<String, String> adviceMap,
			ArrayList<AspectBean> aspectBeans) {
		try {
			// Write aspect code to template file
			
			
			//FileInputStream aspectInputStream = new FileInputStream(
			//		System.getProperty("user.dir")
			//				+ "/data/templates/aspects/" + templateFileName);
			
			DataInputStream aspectDataStream = new DataInputStream(
					this.getClass().getResourceAsStream("/templates/aspects/" + templateFileName));
			
			//DataInputStream aspectDataStream = new DataInputStream(
			//		aspectInputStream);
			
			File f = new File(System.getProperty("user.dir") + "\\" + resultFileName);
			f.createNewFile();
			
			FileOutputStream aspectOutputStream = new FileOutputStream(f);
			
			//FileOutputStream aspectOutputStream = new FileOutputStream(
			//		System.getProperty("user.dir") + resultFileName);
			DataOutputStream aspectDataOutputStream = new DataOutputStream(
					aspectOutputStream);

			String str;

			while (null != ((str = aspectDataStream.readLine()))) {

				String adviceStringReplace = "<insert_code_here>";
				String apsectFixMapStringReplace = "<insert_fix_map>";
				
				if (str.indexOf(apsectFixMapStringReplace) > -1) {
					str = str + "\n";
					System.out.println("Writing Fix Map");
					Iterator it = adviceMap.entrySet().iterator();
					while(it.hasNext()) {
						Map.Entry<String, String> pairs = (Map.Entry<String, String>) it.next();
						aspectDataOutputStream.writeBytes("\t\tfixes.put(\"" + pairs.getKey() + "\", \"" + pairs.getValue() +"\");");
						aspectDataOutputStream.writeBytes("\n");
					}				
				}
				else if (str.indexOf(adviceStringReplace) > -1) {

					str = str + "\n";
					System.out.println("Writing Aspect");
					for (Iterator iterator = aspectBeans.iterator(); iterator
							.hasNext();) {
						AspectBean aspectBean = (AspectBean) iterator.next();
						writePointcutAdvice(aspectDataOutputStream, aspectBean, aspectBean.getPointcutTemplateFileName(), templateVariables);
						aspectDataOutputStream.writeBytes("\n");

					}
					// aspectDataOutputStream.writeBytes(str);
				}
				else{
					aspectDataOutputStream.writeBytes(str + " \n");
				}
			}
		} catch (IOException ioe) {
			System.err.println("I/O Error - " + ioe);
		}
	}	

	public void writePointcutAdvice(DataOutputStream aspectDataOutputStream,
			AspectBean aspectBean, String pointcutFileName, String[] templateVariables) {
		FileInputStream templateInputStream;
		try {
			//templateInputStream = new FileInputStream(
			//		System.getProperty("user.dir")
			//				+ "/data/templates/" + pointcutFileName);
			DataInputStream templateDataStream = new DataInputStream(
					this.getClass().getResourceAsStream("/templates/" + pointcutFileName));

			String str;
			while (null != ((str = templateDataStream.readLine()))) {

				for (int i = 0; i < templateVariables.length; i++) {
					String toReplace = templateVariables[i];
					String replaceValue = getValueForTemplateVariable(
							templateVariables[i], aspectBean, templateVariables);

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
			AspectBean aspectBean, String[] templateVariables) {
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
		} else if (templateVariable.equals(templateVariables[8])) {
			returnString = aspectBean.getPointcutVars();
		} else if (templateVariable.equals(templateVariables[9])) {
			returnString = aspectBean.getFunctionParams();
		} else if (templateVariable.equals(templateVariables[10])) {
			returnString = aspectBean.getResultString();
		} else if (templateVariable.equals(templateVariables[11])) {
			returnString = aspectBean.getResultVarName();
		} else if (templateVariable.equals(templateVariables[12])) {
			returnString = aspectBean.getResultVarType();
		}
		return returnString;
	}	
	
}

