package com.thesis.aop.logic.beans;

public class TestBean {

	private String input;
	private String fix;
	
	public TestBean(String input, String fix){
		this.input = input;
		this.fix = fix;
	}
	
	public String getInput() {
		return input;
	}
	public void setInput(String input) {
		this.input = input;
	}
	public String getFix() {
		return fix;
	}
	public void setFix(String fix) {
		this.fix = fix;
	}
	
	
}
