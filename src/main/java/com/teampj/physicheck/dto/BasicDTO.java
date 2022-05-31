package com.teampj.physicheck.dto;

public class BasicDTO {

	private int basicNo;
	private int bloodNo;
	private int urineNo;
	private int bmiNo;
	private int pressureNo;
	private int eyesightNo;
	private int hearingNo;
	private int testCode;
	private int testName;
	private int testExpense;
	private String id;

	
	public BasicDTO() {}


	public BasicDTO(int basicNo, int bloodNo, int urineNo, int bmiNo, int pressureNo, int eyesightNo, int hearingNo,
			int testCode, int testName, int testExpense, String id) {
		super();
		this.basicNo = basicNo;
		this.bloodNo = bloodNo;
		this.urineNo = urineNo;
		this.bmiNo = bmiNo;
		this.pressureNo = pressureNo;
		this.eyesightNo = eyesightNo;
		this.hearingNo = hearingNo;
		this.testCode = testCode;
		this.testName = testName;
		this.testExpense = testExpense;
		this.id = id;
	}


	public int getBasicNo() {
		return basicNo;
	}


	public void setBasicNo(int basicNo) {
		this.basicNo = basicNo;
	}


	public int getBloodNo() {
		return bloodNo;
	}


	public void setBloodNo(int bloodNo) {
		this.bloodNo = bloodNo;
	}


	public int getUrineNo() {
		return urineNo;
	}


	public void setUrineNo(int urineNo) {
		this.urineNo = urineNo;
	}


	public int getBmiNo() {
		return bmiNo;
	}


	public void setBmiNo(int bmiNo) {
		this.bmiNo = bmiNo;
	}


	public int getPressureNo() {
		return pressureNo;
	}


	public void setPressureNo(int pressureNo) {
		this.pressureNo = pressureNo;
	}


	public int getEyesightNo() {
		return eyesightNo;
	}


	public void setEyesightNo(int eyesightNo) {
		this.eyesightNo = eyesightNo;
	}


	public int getHearingNo() {
		return hearingNo;
	}


	public void setHearingNo(int hearingNo) {
		this.hearingNo = hearingNo;
	}


	public int getTestCode() {
		return testCode;
	}


	public void setTestCode(int testCode) {
		this.testCode = testCode;
	}


	public int getTestName() {
		return testName;
	}


	public void setTestName(int testName) {
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


	@Override
	public String toString() {
		return "BasicDTO [basicNo=" + basicNo + ", bloodNo=" + bloodNo + ", urineNo=" + urineNo + ", bmiNo=" + bmiNo
				+ ", pressureNo=" + pressureNo + ", eyesightNo=" + eyesightNo + ", hearingNo=" + hearingNo
				+ ", testCode=" + testCode + ", testName=" + testName + ", testExpense=" + testExpense + ", id=" + id
				+ "]";
	}
}