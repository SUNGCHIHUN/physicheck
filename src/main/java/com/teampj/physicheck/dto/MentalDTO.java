package com.teampj.physicheck.dto;

public class MentalDTO {

	
	private int mentalNo;
	private int surveyNo;

	private String testCode;
	private String testName;
	private int testExpense;
	private String id;
	private String comments;
	
	//추가
	private int total1;		//시각
	private int total2;		//청각
	private int total3;		//운동감각	
	private int total4;		//기분상태
	private int total5;		//조절력
	
	
	public MentalDTO() {}


	public MentalDTO(int mentalNo, int surveyNo, String testCode, String testName, int testExpense, String id,
			String comments, int total1, int total2, int total3, int total4, int total5) {
		super();
		this.mentalNo = mentalNo;
		this.surveyNo = surveyNo;
		this.testCode = testCode;
		this.testName = testName;
		this.testExpense = testExpense;
		this.id = id;
		this.comments = comments;
		this.total1 = total1;
		this.total2 = total2;
		this.total3 = total3;
		this.total4 = total4;
		this.total5 = total5;
	}


	public int getMentalNo() {
		return mentalNo;
	}


	public void setMentalNo(int mentalNo) {
		this.mentalNo = mentalNo;
	}


	public int getSurveyNo() {
		return surveyNo;
	}


	public void setSurveyNo(int surveyNo) {
		this.surveyNo = surveyNo;
	}


	public String getTestCode() {
		return testCode;
	}


	public void setTestCode(String testCode) {
		this.testCode = testCode;
	}


	public String getTestName() {
		return testName;
	}


	public void setTestName(String testName) {
		this.testName = testName;
	}


	public int getTestExpense() {
		return testExpense;
	}


	public void setTestExpense(int testExpense) {
		this.testExpense = testExpense;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getComments() {
		return comments;
	}


	public void setComments(String comments) {
		this.comments = comments;
	}

	public int getTotal1() {
		return total1;
	}

	public void setTotal1(int total1) {
		this.total1 = total1;
	}

	public int getTotal2() {
		return total2;
	}

	public void setTotal2(int total2) {
		this.total2 = total2;
	}

	public int getTotal3() {
		return total3;
	}

	public void setTotal3(int total3) {
		this.total3 = total3;
	}

	public int getTotal4() {
		return total4;
	}

	public void setTotal4(int total4) {
		this.total4 = total4;
	}

	
	public int getTotal5() {
		return total5;
	}


	public void setTotal5(int total5) {
		this.total5 = total5;
	}


	@Override
	public String toString() {
		return "MentalDTO [mentalNo=" + mentalNo + ", surveyNo=" + surveyNo + ", testCode=" + testCode + ", testName="
				+ testName + ", testExpense=" + testExpense + ", id=" + id + ", comments=" + comments + ", total1="
				+ total1 + ", total2=" + total2 + ", total3=" + total3 + ", total4=" + total4 + ", total5=" + total5
				+ "]";
	}
}