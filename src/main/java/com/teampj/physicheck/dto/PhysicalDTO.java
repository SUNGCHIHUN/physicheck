package com.teampj.physicheck.dto;

public class PhysicalDTO {

	private int physicalNo;
	private int cardioEnduranceNo;
	private int flexibilityNo;
	private int agilityNo;
	private int muscularPowerNo;
	private int muscularEnduranceNo;
	private int quicknessNo;
	private int testCode;
	private int testName;
	private int testExpense;
	private String id;
	
	
	public PhysicalDTO() {}


	public PhysicalDTO(int physicalNo, int cardioEnduranceNo, int flexibilityNo, int agilityNo, int muscularPowerNo,
			int muscularEnduranceNo, int quicknessNo, int testCode, int testName, int testExpense, String id) {
		super();
		this.physicalNo = physicalNo;
		this.cardioEnduranceNo = cardioEnduranceNo;
		this.flexibilityNo = flexibilityNo;
		this.agilityNo = agilityNo;
		this.muscularPowerNo = muscularPowerNo;
		this.muscularEnduranceNo = muscularEnduranceNo;
		this.quicknessNo = quicknessNo;
		this.testCode = testCode;
		this.testName = testName;
		this.testExpense = testExpense;
		this.id = id;
	}


	public int getPhysicalNo() {
		return physicalNo;
	}


	public void setPhysicalNo(int physicalNo) {
		this.physicalNo = physicalNo;
	}


	public int getCardioEnduranceNo() {
		return cardioEnduranceNo;
	}


	public void setCardioEnduranceNo(int cardioEnduranceNo) {
		this.cardioEnduranceNo = cardioEnduranceNo;
	}


	public int getFlexibilityNo() {
		return flexibilityNo;
	}


	public void setFlexibilityNo(int flexibilityNo) {
		this.flexibilityNo = flexibilityNo;
	}


	public int getAgilityNo() {
		return agilityNo;
	}


	public void setAgilityNo(int agilityNo) {
		this.agilityNo = agilityNo;
	}


	public int getMuscularPowerNo() {
		return muscularPowerNo;
	}


	public void setMuscularPowerNo(int muscularPowerNo) {
		this.muscularPowerNo = muscularPowerNo;
	}


	public int getMuscularEnduranceNo() {
		return muscularEnduranceNo;
	}


	public void setMuscularEnduranceNo(int muscularEnduranceNo) {
		this.muscularEnduranceNo = muscularEnduranceNo;
	}


	public int getQuicknessNo() {
		return quicknessNo;
	}


	public void setQuicknessNo(int quicknessNo) {
		this.quicknessNo = quicknessNo;
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
	
	
	
}
