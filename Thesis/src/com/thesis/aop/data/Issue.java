package com.thesis.aop.data;

public class Issue {

	public String ruleID;
	public String iid;
	public String category;
	public String folder;
	public String kingdom;
	public String abstractDefn;
	public String priority;
	public String fileName;
	public String filePath;
	public int lineStart;
	
	public Issue(){}

	public Issue(String ruleID, String iid, String category, String folder,
			String kingdom, String abstractDefn, String priority,
			String fileName, String filePath, int lineStart) {
		super();
		this.ruleID = ruleID;
		this.iid = iid;
		this.category = category;
		this.folder = folder;
		this.kingdom = kingdom;
		this.abstractDefn = abstractDefn;
		this.priority = priority;
		this.fileName = fileName;
		this.filePath = filePath;
		this.lineStart = lineStart;
	}

	public String getRuleID() {
		return ruleID;
	}

	public void setRuleID(String ruleID) {
		this.ruleID = ruleID;
	}

	public String getIid() {
		return iid;
	}

	public void setIid(String iid) {
		this.iid = iid;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getFolder() {
		return folder;
	}

	public void setFolder(String folder) {
		this.folder = folder;
	}

	public String getKingdom() {
		return kingdom;
	}

	public void setKingdom(String kingdom) {
		this.kingdom = kingdom;
	}

	public String getAbstractDefn() {
		return abstractDefn;
	}

	public void setAbstractDefn(String abstractDefn) {
		this.abstractDefn = abstractDefn;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getLineStart() {
		return lineStart;
	}

	public void setLineStart(int lineStart) {
		this.lineStart = lineStart;
	}
}
