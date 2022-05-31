package com.teampj.physicheck.dto;

// 순발력
public class AgilityDTO {

	private int agilityNo;
	private float longJump;
	private float run50;
	private int longJumpResult;
	private int run50Result;

	public AgilityDTO() {}


	public int getAgilityNo() {
		return agilityNo;
	}


	public void setAgilityNo(int agilityNo) {
		this.agilityNo = agilityNo;
	}


	public float getLongJump() {
		return longJump;
	}


	public void setLongJump(float longJump) {
		this.longJump = longJump;
	}


	public float getRun50() {
		return run50;
	}


	public void setRun50(float run50) {
		this.run50 = run50;
	}


	public int getLongJumpResult() {
		return longJumpResult;
	}


	public void setLongJumpResult(int longJumpResult) {
		this.longJumpResult = longJumpResult;
	}


	public int getRun50Result() {
		return run50Result;
	}


	public void setRun50Result(int run50Result) {
		this.run50Result = run50Result;
	}


	@Override
	public String toString() {
		return "AgilityDTO [agilityNo=" + agilityNo + ", longJump=" + longJump + ", run50=" + run50
				+ ", longJumpResult=" + longJumpResult + ", run50Result=" + run50Result + "]";
	}
}