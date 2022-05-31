package com.teampj.physicheck.dto;



public class Survey4DTO {
	
	private int survey4No;
	private int answer1;
	private int answer2;
	private int answer3;
	private int answer4;
	private int answer5;
	private int total4;
	
	
	public Survey4DTO() {}


	public Survey4DTO(int survey4No, int answer1, int answer2, int answer3, int answer4, int answer5, int total4) {
		super();
		this.survey4No = survey4No;
		this.answer1 = answer1;
		this.answer2 = answer2;
		this.answer3 = answer3;
		this.answer4 = answer4;
		this.answer5 = answer5;
		this.total4 = total4;
	}


	public int getSurvey4No() {
		return survey4No;
	}


	public void setSurvey4No(int survey4No) {
		this.survey4No = survey4No;
	}


	public int getAnswer1() {
		return answer1;
	}


	public void setAnswer1(int answer1) {
		this.answer1 = answer1;
	}


	public int getAnswer2() {
		return answer2;
	}


	public void setAnswer2(int answer2) {
		this.answer2 = answer2;
	}


	public int getAnswer3() {
		return answer3;
	}


	public void setAnswer3(int answer3) {
		this.answer3 = answer3;
	}


	public int getAnswer4() {
		return answer4;
	}


	public void setAnswer4(int answer4) {
		this.answer4 = answer4;
	}


	public int getAnswer5() {
		return answer5;
	}


	public void setAnswer5(int answer5) {
		this.answer5 = answer5;
	}


	public int getTotal4() {
		return total4;
	}


	public void setTotal4(int total4) {
		this.total4 = total4;
	}


	@Override
	public String toString() {
		return "Survey4DTO [survey4No=" + survey4No + ", answer1=" + answer1 + ", answer2=" + answer2 + ", answer3="
				+ answer3 + ", answer4=" + answer4 + ", answer5=" + answer5 + ", total4=" + total4 + "]";
	}

	
}
