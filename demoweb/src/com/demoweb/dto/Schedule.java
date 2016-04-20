package com.demoweb.dto;

import java.util.Date;

public class Schedule {

	
	private	int idxNo;
	private Date sDate;
	private String sClass;
	private String sSubject;
	private String sImageName;
	private String sTime;
	private String sWriter;
	private String sContent;
	
	public int getIdxNo() {
		return idxNo;
	}
	public void setIdxNo(int idxNo) {
		this.idxNo = idxNo;
	}
	public Date getsDate() {
		return sDate;
	}
	public void setsDate(Date sDate) {
		this.sDate = sDate;
	}
	public String getsClass() {
		return sClass;
	}
	public void setsClass(String sClass) {
		this.sClass = sClass;
	}
	public String getsSubject() {
		return sSubject;
	}
	public void setsSubject(String sSubject) {
		this.sSubject = sSubject;
	}
	public String getsImageName() {
		return sImageName;
	}
	public void setsImageName(String sImageName) {
		this.sImageName = sImageName;
	}
	public String getsTime() {
		return sTime;
	}
	public void setsTime(String sTime) {
		this.sTime = sTime;
	}
	public String getsWriter() {
		return sWriter;
	}
	public void setsWriter(String sWriter) {
		this.sWriter = sWriter;
	}
	public String getsContent() {
		return sContent;
	}
	public void setsContent(String sContent) {
		this.sContent = sContent;
	}
	
	
	
	
}
