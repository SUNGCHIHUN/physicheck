package com.teampj.physicheck.dto;

// 근지구력
public class MuscularEnduranceDTO {

	private int muscularEndurance_no;
	private float sitUp;
	private float pushUp;
	private int sitUpResult;
	private int pushUpResult;
	
	public MuscularEnduranceDTO() {}

	public int getMuscularEndurance_no() {
		return muscularEndurance_no;
	}

	public void setMuscularEndurance_no(int muscularEndurance_no) {
		this.muscularEndurance_no = muscularEndurance_no;
	}

	public float getSitUp() {
		return sitUp;
	}

	public void setSitUp(float sitUp) {
		this.sitUp = sitUp;
	}

	public float getPushUp() {
		return pushUp;
	}

	public void setPushUp(float pushUp) {
		this.pushUp = pushUp;
	}

	public int getSitUpResult() {
		return sitUpResult;
	}

	public void setSitUpResult(int sitUpResult) {
		this.sitUpResult = sitUpResult;
	}

	public int getPushUpResult() {
		return pushUpResult;
	}

	public void setPushUpResult(int pushUpResult) {
		this.pushUpResult = pushUpResult;
	}

	@Override
	public String toString() {
		return "MuscularEnduranceDTO [muscularEndurance_no=" + muscularEndurance_no + ", sitUp=" + sitUp + ", pushUp="
				+ pushUp + ", sitUpResult=" + sitUpResult + ", pushUpResult=" + pushUpResult + "]";
	}

}