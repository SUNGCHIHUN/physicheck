package com.teampj.physicheck.dto;

// 민첩성
public class QuicknessDTO {

	private int quickness_no;
	private float sideStep;
	private float burpeeTest;
	private int sideStepResult;
	private int burpeeTestResult;
	
	public QuicknessDTO() {}


	public int getQuickness_no() {
		return quickness_no;
	}


	public void setQuickness_no(int quickness_no) {
		this.quickness_no = quickness_no;
	}


	public float getSideStep() {
		return sideStep;
	}


	public void setSideStep(float sideStep) {
		this.sideStep = sideStep;
	}


	public float getBurpeeTest() {
		return burpeeTest;
	}


	public void setBurpeeTest(float burpeeTest) {
		this.burpeeTest = burpeeTest;
	}


	public int getSideStepResult() {
		return sideStepResult;
	}


	public void setSideStepResult(int sideStepResult) {
		this.sideStepResult = sideStepResult;
	}


	public int getBurpeeTestResult() {
		return burpeeTestResult;
	}


	public void setBurpeeTestResult(int burpeeTestResult) {
		this.burpeeTestResult = burpeeTestResult;
	}


	@Override
	public String toString() {
		return "QuicknessDTO [quickness_no=" + quickness_no + ", sideStep=" + sideStep + ", burpeeTest=" + burpeeTest
				+ ", sideStepResult=" + sideStepResult + ", burpeeTestResult=" + burpeeTestResult + "]";
	}

	
}