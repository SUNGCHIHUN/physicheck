package com.teampj.physicheck.dto;


public class Survey2DTO {

	
	private int survey2No;
	private int answer1;
	private int answer2;
	private int answer3;
	private int answer4;
	private int answer5;
	private int total2;

	public Survey2DTO() {}

	public Survey2DTO(int survey2No, int answer1, int answer2, int answer3, int answer4, int answer5, int total2) {
		super();
		this.survey2No = survey2No;
		this.answer1 = answer1;
		this.answer2 = answer2;
		this.answer3 = answer3;
		this.answer4 = answer4;
		this.answer5 = answer5;
		this.total2 = total2;
	}

	public int getSurvey2No() {
		return survey2No;
	}

	public void setSurvey2No(int survey2No) {
		this.survey2No = survey2No;
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

	public int getTotal2() {
		return total2;
	}

	public void setTotal2(int total2) {
		this.total2 = total2;
	}

	@Override
	public String toString() {
		return "Survey2DTO [survey2No=" + survey2No + ", answer1=" + answer1 + ", answer2=" + answer2 + ", answer3="
				+ answer3 + ", answer4=" + answer4 + ", answer5=" + answer5 + ", total2=" + total2 + "]";
	}

	
	
}
