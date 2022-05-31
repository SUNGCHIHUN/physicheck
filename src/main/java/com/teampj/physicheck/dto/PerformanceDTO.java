package com.teampj.physicheck.dto;

public class PerformanceDTO {
	private int performanceYear;
	private int performanceMonth;
	private int performanceDay;
	private int memberNo;
	private String name;
	private String gender;
	private String examination;
	private int examTotal;
	
	public PerformanceDTO() {}
	
	
	public int getPerformanceYear() {
		return performanceYear;
	}


	public void setPerformanceYear(int performanceYear) {
		this.performanceYear = performanceYear;
	}


	public int getPerformanceMonth() {
		return performanceMonth;
	}


	public void setPerformanceMonth(int performanceMonth) {
		this.performanceMonth = performanceMonth;
	}


	public int getPerformanceDay() {
		return performanceDay;
	}


	public void setPerformanceDay(int performanceDay) {
		this.performanceDay = performanceDay;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getExamination() {
		return examination;
	}


	public void setExamination(String examination) {
		this.examination = examination;
	}


	public int getExamTotal() {
		return examTotal;
	}


	public void setExamTotal(int examTotal) {
		this.examTotal = examTotal;
	}


	@Override
	public String toString() {
		return "PerformanceDTO [performanceYear=" + performanceYear + ", performanceMonth=" + performanceMonth
				+ ", performanceDay=" + performanceDay + ", memberNo=" + memberNo + ", name=" + name + ", gender="
				+ gender + ", examination=" + examination + ", examTotal=" + examTotal + "]";
	}
	
}