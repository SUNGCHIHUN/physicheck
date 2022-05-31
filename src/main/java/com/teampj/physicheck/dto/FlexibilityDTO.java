package com.teampj.physicheck.dto;

// 유연성
public class FlexibilityDTO {

	private int flexibilityNo;
	private float forwardBending;
	private float bridge;
	private int forwardBendingResult;
	private int bridgeResult;
	
	public FlexibilityDTO() {}


	public int getFlexibilityNo() {
		return flexibilityNo;
	}


	public void setFlexibilityNo(int flexibilityNo) {
		this.flexibilityNo = flexibilityNo;
	}


	public float getForwardBending() {
		return forwardBending;
	}


	public void setForwardBending(float forwardBending) {
		this.forwardBending = forwardBending;
	}


	public float getBridge() {
		return bridge;
	}


	public void setBridge(float bridge) {
		this.bridge = bridge;
	}


	public int getForwardBendingResult() {
		return forwardBendingResult;
	}


	public void setForwardBendingResult(int forwardBendingResult) {
		this.forwardBendingResult = forwardBendingResult;
	}


	public int getBridgeResult() {
		return bridgeResult;
	}


	public void setBridgeResult(int bridgeResult) {
		this.bridgeResult = bridgeResult;
	}


	@Override
	public String toString() {
		return "FlexibilityDTO [flexibilityNo=" + flexibilityNo + ", forwardBending=" + forwardBending + ", bridge="
				+ bridge + ", forwardBendingResult=" + forwardBendingResult + ", bridgeResult=" + bridgeResult + "]";
	}
}
