package com.thesis.aop.main;

import com.thesis.aop.data.XMLParser;

public class Main {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("Hello");
		XMLParser parser = new XMLParser();
		parser.ParseFile("jada_report.xml");
	}

}
