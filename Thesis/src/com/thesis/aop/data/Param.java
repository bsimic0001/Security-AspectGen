package com.thesis.aop.data;

public class Param {
	public String name;
	public String type;
	public int location;
	public boolean result;
	
	public Param(String name, String type, int location, boolean result) {
		super();
		this.name = name;
		this.type = type;
		this.location = location;
		this.result = result;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getLocation() {
		return location;
	}
	public void setLocation(int location) {
		this.location = location;
	}

	public boolean isResult() {
		return result;
	}

	public void setResult(boolean result) {
		this.result = result;
	}
	
	
	
	
}
