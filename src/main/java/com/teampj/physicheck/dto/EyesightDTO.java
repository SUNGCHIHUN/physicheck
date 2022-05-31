package com.teampj.physicheck.dto;

public class EyesightDTO {

	private int eyesightNo;
	private float eyesightLeft;
	private float eyesightRight;

	
	public EyesightDTO() {}


	public EyesightDTO(int eyesightNo, float eyesightLeft, float eyesightRight) {
		this.eyesightNo = eyesightNo;
		this.eyesightLeft = eyesightLeft;
		this.eyesightRight = eyesightRight;
	}


	public int getEyesightNo() {
		return eyesightNo;
	}


	public void setEyesightNo(int eyesightNo) {
		this.eyesightNo = eyesightNo;
	}


	public float getEyesightLeft() {
		return eyesightLeft;
	}


	public void setEyesightLeft(float eyesightLeft) {
		this.eyesightLeft = eyesightLeft;
	}


	public float getEyesightRight() {
		return eyesightRight;
	}


	public void setEyesightRight(float eyesightRight) {
		this.eyesightRight = eyesightRight;
	}


	@Override
	public String toString() {
		return "EyesightDTO [eyesightNo=" + eyesightNo + ", eyesightLeft=" + eyesightLeft + ", eyesightRight="
				+ eyesightRight + "]";
	}
	
}
