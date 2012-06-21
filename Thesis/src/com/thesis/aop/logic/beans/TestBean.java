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
