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
package com.thesis.aop.data;

import java.util.ArrayList;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;


/**
 * The Class DataFileParser.
 */
public class DataFileParser {
	
	/** The file name. */
	private String fileName;
	
	/** The issues. */
	private ArrayList<Issue> issues = new ArrayList<Issue>();
	
	/** The xss issues. */
	private ArrayList<Issue> xssIssues = new ArrayList<Issue>();
	
	/** The sql injection issues. */
	private ArrayList<Issue> sqlInjectionIssues = new ArrayList<Issue>();
	
	/**
	 * Instantiates a new data file parser.
	 */
	public DataFileParser(){}
	
	/**
	 * Parses the file.
	 *
	 * @param fileName the file name
	 */
	public void ParseFile(String fileName) {
		this.fileName = fileName;
		
		try {
			SAXParserFactory factory = SAXParserFactory.newInstance();
			SAXParser saxParser = factory.newSAXParser();

			DefaultHandler handler = new DefaultHandler() {
				boolean newIssue = false;
				boolean newCategory = false;
				boolean newFolder = false;
				boolean newKingdom = false;
				boolean newAbstract = false;
				boolean newPriority = false;
				boolean newFileName = false;
				boolean newFilePath = false;
				boolean newLineStart = false;
				boolean newSourceIssue = false;

				Issue tempIssue;
				Issue tempSourceIssue;

				public void startElement(String uri, String localName,
						String qName, Attributes attributes)
						throws SAXException {

					// System.out.println("Start Element :" + qName);
					if (qName.equalsIgnoreCase("ISSUE")) {
						newIssue = true;
						tempIssue = new Issue();
						tempIssue.setRuleID(attributes.getValue("ruleID"));
						tempIssue.setIid(attributes.getValue("iid"));
					}
					if(qName.equalsIgnoreCase("SOURCE")){
						newSourceIssue = true;
						tempSourceIssue = new Issue();
						tempSourceIssue.setRuleID("Source_" + tempIssue.getRuleID());
						tempSourceIssue.setIid("Source_" + tempIssue.getIid());
					}
					if(qName.equalsIgnoreCase("CATEGORY")){
						newCategory = true;
					}
					if(qName.equalsIgnoreCase("FOLDER")){
						newFolder = true;
					}
					if(qName.equalsIgnoreCase("KINGDOM")){
						newKingdom = true;
					}
					if(qName.equalsIgnoreCase("ABSTRACT")){
						newAbstract = true;
					}
					if(qName.equalsIgnoreCase("FRIORITY")){
						newPriority = true;
					}
					if(qName.equalsIgnoreCase("FILENAME")){
						newFileName = true;
					}
					if(qName.equalsIgnoreCase("FILEPATH")){
						newFilePath = true;
					}
					if(qName.equalsIgnoreCase("LINESTART")){
						newLineStart = true;
					}
				}

				public void endElement(String uri, String localName,
						String qName) throws SAXException {

					if (qName.equalsIgnoreCase("ISSUE")) {
						issues.add(tempIssue);
						addIssueToList(tempIssue);
						newIssue = false;
					}
					if (qName.equalsIgnoreCase("SOURCE")) {
						issues.add(tempSourceIssue);
						tempSourceIssue.setAbstractDefn("SOURCE NODE - NO ABSTRACT AVAILABLE");
						tempSourceIssue.setCategory(tempIssue.getCategory());
						tempSourceIssue.setFolder(tempIssue.getFolder());
						tempSourceIssue.setKingdom(tempIssue.getKingdom());
						tempSourceIssue.setPriority(tempIssue.getPriority());

						addIssueToList(tempSourceIssue);
						newSourceIssue = false;
					}
					// System.out.println("End Element :" + qName);

				}

				public void characters(char ch[], int start, int length)
						throws SAXException {

					if(newCategory){
						tempIssue.setCategory(new String(ch, start, length));
						newCategory = false;
					}
					if(newFolder){
						tempIssue.setFolder(new String(ch, start, length));
						newFolder = false;
					}
					if(newKingdom){
						tempIssue.setKingdom(new String(ch, start, length));
						newKingdom = false;
					}
					if(newAbstract){
						tempIssue.setAbstractDefn(new String(ch, start, length));
						newAbstract = false;
					}
					if(newPriority){
						tempIssue.setPriority(new String(ch, start, length));
						newPriority = false;
					}
					if(newFileName){
						if(newSourceIssue)
							tempSourceIssue.setFileName(new String(ch, start, length));
						else
							tempIssue.setFileName(new String(ch, start, length));
						newFileName = false;
					}
					if(newFilePath){
						if(newSourceIssue)
							tempSourceIssue.setFilePath(new String(ch, start, length));
						else
							tempIssue.setFilePath(new String(ch, start, length));
						newFilePath = false;
					}
					if(newLineStart){
						if(newSourceIssue)
							tempSourceIssue.setLineStart(Integer.valueOf(new String(ch, start, length)).intValue());
						else
							tempIssue.setLineStart(Integer.valueOf(new String(ch, start, length)).intValue());
						newLineStart = false;
					}
				}

			};

			System.out.println(System.getProperty("user.dir"));
			saxParser.parse("./" + fileName, handler);
			//saxParser.parse(System.getProperty("user.dir")
			//		+ "/data/" + fileName, handler);
			System.out.println(issues.size());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * Gets the file name.
	 *
	 * @return the file name
	 */
	public String getFileName() {
		return fileName;
	}

	/**
	 * Sets the file name.
	 *
	 * @param fileName the new file name
	 */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	/**
	 * Gets the issues.
	 *
	 * @return the issues
	 */
	public ArrayList<Issue> getIssues() {
		return issues;
	}

	/**
	 * Sets the issues.
	 *
	 * @param issues the new issues
	 */
	public void setIssues(ArrayList<Issue> issues) {
		this.issues = issues;
	}

	/**
	 * Gets the xss issues.
	 *
	 * @return the xss issues
	 */
	public ArrayList<Issue> getXssIssues() {
		return xssIssues;
	}

	/**
	 * Sets the xss issues.
	 *
	 * @param xssIssues the new xss issues
	 */
	public void setXssIssues(ArrayList<Issue> xssIssues) {
		this.xssIssues = xssIssues;
	}

	/**
	 * Gets the sql injection issues.
	 *
	 * @return the sql injection issues
	 */
	public ArrayList<Issue> getSqlInjectionIssues() {
		return sqlInjectionIssues;
	}

	/**
	 * Sets the sql injection issues.
	 *
	 * @param sqlInjectionIssues the new sql injection issues
	 */
	public void setSqlInjectionIssues(ArrayList<Issue> sqlInjectionIssues) {
		this.sqlInjectionIssues = sqlInjectionIssues;
	}

	/**
	 * Adds the issue to list.
	 *
	 * @param i the i
	 */
	public void addIssueToList(Issue i){
		if(i.getCategory().indexOf("SQL Injection") != -1)
			sqlInjectionIssues.add(i);
		else if(i.getCategory().indexOf("Cross-Site Scripting") != -1)
			xssIssues.add(i);
	}
	

}
