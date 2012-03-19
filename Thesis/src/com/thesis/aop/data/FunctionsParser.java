package com.thesis.aop.data;

import java.io.File;
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
				boolean newParamNumber = false;
				//boolean newParam = true;

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
					if(qName.equalsIgnoreCase("TOTALPARAMNUMBER")){
						newParamNumber = true;
					}
					if(qName.equalsIgnoreCase("PARAM")){
						//newParam = true;
						
						String name = attributes.getValue("name");
						String type = attributes.getValue("type");
						int location = (new Integer(attributes.getValue("location")).intValue());
						boolean result = (new Boolean(attributes.getValue("result")));
						Param p = new Param(name, type, location, result);
						tempFunction.addToParams(p);
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
					if(newParamNumber){
						Integer i = new Integer(new String(ch, start, length));
						tempFunction.setTotalParamNumber(i.intValue());
						newParamNumber = false;
					}
				}

			};
			
			System.out.println(System.getProperty("user.dir"));
			saxParser.parse(this.getClass().getResourceAsStream("/functions/" + fileName), handler);
			//saxParser.parse(System.getProperty("user.dir")
			//		+ "/data/functions/" + fileName, handler);
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
