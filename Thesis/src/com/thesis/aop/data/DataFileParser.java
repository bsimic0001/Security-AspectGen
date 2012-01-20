package com.thesis.aop.data;

import java.util.ArrayList;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class DataFileParser {
	private String fileName;
	private ArrayList<Issue> issues = new ArrayList<Issue>();
	
	public DataFileParser(){}
	
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
						newIssue = false;
					}
					if (qName.equalsIgnoreCase("SOURCE")) {
						issues.add(tempSourceIssue);
						newSourceIssue = false;
					}
					// System.out.println("End Element :" + qName);

				}

				public void characters(char ch[], int start, int length)
						throws SAXException {

					if(newCategory){
						tempIssue.setCategory(new String(ch, start, length));
						if(newSourceIssue)
							tempSourceIssue.setCategory(new String(ch, start, length));
						newCategory = false;
					}
					if(newFolder){
						tempIssue.setFolder(new String(ch, start, length));
						if(newSourceIssue)
							tempSourceIssue.setFolder(new String(ch, start, length));
						newFolder = false;
					}
					if(newKingdom){
						tempIssue.setKingdom(new String(ch, start, length));
						if(newSourceIssue)
							tempSourceIssue.setKingdom(new String(ch, start, length));
						newKingdom = false;
					}
					if(newAbstract){
						tempIssue.setAbstractDefn(new String(ch, start, length));
						if(newSourceIssue)
							tempSourceIssue.setAbstractDefn("SOURCE NODE - NO ABSTRACT AVAILABLE");
						newAbstract = false;
					}
					if(newPriority){
						tempIssue.setPriority(new String(ch, start, length));
						if(newSourceIssue)
							tempSourceIssue.setPriority(new String(ch, start, length));
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
			saxParser.parse(System.getProperty("user.dir")
					+ "/data/" + fileName, handler);
			System.out.println(issues.size());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	

}