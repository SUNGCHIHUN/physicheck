package com.teampj.physicheck.dto;

// 근력
public class MuscularPowerDTO {

	private int muscularPower_no;
	private float squirt;
	private float benchPress;
	private int squirtResult;
	private int benchPressResult;

	public MuscularPowerDTO() {}

	public int getMuscularPower_no() {
		return muscularPower_no;
	}



	public void setMuscularPower_no(int muscularPower_no) {
		this.muscularPower_no = muscularPower_no;
	}



	public float getSquirt() {
		return squirt;
	}



	public void setSquirt(float squirt) {
		this.squirt = squirt;
	}



	public float getBenchPress() {
		return benchPress;
	}



	public void setBenchPress(float benchPress) {
		this.benchPress = benchPress;
	}



	public int getSquirtResult() {
		return squirtResult;
	}



	public void setSquirtResult(int squirtResult) {
		this.squirtResult = squirtResult;
	}



	public int getBenchPressResult() {
		return benchPressResult;
	}



	public void setBenchPressResult(int benchPressResult) {
		this.benchPressResult = benchPressResult;
	}



	@Override
	public String toString() {
		return "MuscularPowerDTO [muscularPower_no=" + muscularPower_no + ", squirt=" + squirt + ", benchPress="
				+ benchPress + ", squirtResult=" + squirtResult + ", benchPressResult=" + benchPressResult + "]";
	}

}