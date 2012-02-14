package com.thesis.aop.data;

import java.util.ArrayList;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class FunctionsParser {
	private String fileName;
	private ArrayList<Function> functions = new ArrayList<Function>();
	
	public FunctionsParser(){}
	
	public void resetParser(){
		fileName = null;
		functions = null;
		functions = new ArrayList<Function>();
	}
	
	public void ParseFile(String fileName) {
		this.fileName = fileName;
		
		try {

			SAXParserFactory factory = SAXParserFactory.newInstance();
			SAXParser saxParser = factory.newSAXParser();

			DefaultHandler handler = new DefaultHandler() {

				boolean newFunction = false;
				boolean newName = false;
				boolean newMethodName = false;
				boolean newInterceptParam = false;
				boolean newInterceptParamType = false;

				Function tempFunction;

				public void startElement(String uri, String localName,
						String qName, Attributes attributes)
						throws SAXException {

					// System.out.println("Start Element :" + qName);
					if (qName.equalsIgnoreCase("FUNCTION")) {
						newFunction = true;
						tempFunction = new Function();
						tempFunction.setName(attributes.getValue("name"));
					}
					if(qName.equalsIgnoreCase("METHODNAME")){
						newMethodName = true;
					}
					if(qName.equalsIgnoreCase("INTERCEPTPARAM")){
						newInterceptParam = true;
					}
					if(qName.equalsIgnoreCase("INTERCEPTPARAMTYPE")){
						newInterceptParamType = true;
					}
				}

				public void endElement(String uri, String localName,
						String qName) throws SAXException {

					if (qName.equalsIgnoreCase("FUNCTION")) {
						functions.add(tempFunction);
						newFunction = false;
					}
					// System.out.println("End Element :" + qName);

				}

				public void characters(char ch[], int start, int length)
						throws SAXException {

					if(newMethodName){
						tempFunction.setMethodName(new String(ch, start, length));
						newMethodName = false;
					}
					if(newInterceptParam){
						Integer i = new Integer(new String(ch, start, length));
						tempFunction.setInterceptParam(i.intValue());
						newInterceptParam = false;
					}
					if(newInterceptParamType){
						tempFunction.setInterceptParamType(new String(ch, start, length));
						newInterceptParamType = false;
					}
				}

			};

			System.out.println(System.getProperty("user.dir"));
			saxParser.parse(System.getProperty("user.dir")
					+ "/data/functions/" + fileName, handler);
			System.out.println(functions.size());
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

	public ArrayList<Function> getFunctions() {
		return functions;
	}

	public void setFunctions(ArrayList<Function> functions) {
		this.functions = functions;
	}
	

}
