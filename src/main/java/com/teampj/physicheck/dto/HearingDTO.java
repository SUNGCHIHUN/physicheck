package com.teampj.physicheck.dto;

public class HearingDTO {

	
	private int hearingNo;
	private float hearingLeft;
	private float hearingRight;
	
	
	public HearingDTO() {}

	public HearingDTO(int hearingNo, float hearingLeft, float hearingRight) {
		this.hearingNo = hearingNo;
		this.hearingLeft = hearingLeft;
		this.hearingRight = hearingRight;
	}

	public int getHearingNo() {
		return hearingNo;
	}

	public void setHearingNo(int hearingNo) {
		this.hearingNo = hearingNo;
	}

	public float getHearingLeft() {
		return hearingLeft;
	}

	public void setHearingLeft(float hearingLeft) {
		this.hearingLeft = hearingLeft;
	}

	public float getHearingRight() {
		return hearingRight;
	}

	public void setHearingRight(float hearingRight) {
		this.hearingRight = hearingRight;
	}

	@Override
	public String toString() {
		return "HearingDTO [hearingNo=" + hearingNo + ", hearingLeft=" + hearingLeft + ", hearingRight=" + hearingRight
				+ "]";
	}
	
}
