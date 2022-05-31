package com.teampj.physicheck.dto;



public class Survey3DTO {

	private int survey3No;
	private int answer1;
	private int answer2;
	private int answer3;
	private int answer4;
	private int answer5;
	private int total3;

	public Survey3DTO() {}

	public Survey3DTO(int survey3No, int answer1, int answer2, int answer3, int answer4, int answer5, int total3) {
		super();
		this.survey3No = survey3No;
		this.answer1 = answer1;
		this.answer2 = answer2;
		this.answer3 = answer3;
		this.answer4 = answer4;
		this.answer5 = answer5;
		this.total3 = total3;
	}

	public int getSurvey3No() {
		return survey3No;
	}

	public void setSurvey3No(int survey3No) {
		this.survey3No = survey3No;
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

	public int getTotal3() {
		return total3;
	}

	public void setTotal3(int total3) {
		this.total3 = total3;
	}

	@Override
	public String toString() {
		return "Survey3DTO [survey3No=" + survey3No + ", answer1=" + answer1 + ", answer2=" + answer2 + ", answer3="
				+ answer3 + ", answer4=" + answer4 + ", answer5=" + answer5 + ", total3=" + total3 + "]";
	}


	
}
