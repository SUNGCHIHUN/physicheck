package com.teampj.physicheck.dto;


public class Survey1DTO {

	
	private int survey1No;
	private int answer1;
	private int answer2;
	private int answer3;
	private int answer4;
	private int answer5;
	private int total1;
	private String id;

	public Survey1DTO() {}

	public Survey1DTO(int survey1No, int answer1, int answer2, int answer3, int answer4, int answer5, int total1,
			String id) {
		super();
		this.survey1No = survey1No;
		this.answer1 = answer1;
		this.answer2 = answer2;
		this.answer3 = answer3;
		this.answer4 = answer4;
		this.answer5 = answer5;
		this.total1 = total1;
		this.id = id;
	}

	public int getSurvey1No() {
		return survey1No;
	}

	public void setSurvey1No(int survey1No) {
		this.survey1No = survey1No;
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

	public int getTotal1() {
		return total1;
	}

	public void setTotal1(int total1) {
		this.total1 = total1;
	}

	public String getId() {
		return id;
	}

	public void setId(String strId) {
		this.id = strId;
	}

	@Override
	public String toString() {
		return "Survey1DTO [survey1No=" + survey1No + ", answer1=" + answer1 + ", answer2=" + answer2 + ", answer3="
				+ answer3 + ", answer4=" + answer4 + ", answer5=" + answer5 + ", total1=" + total1 + ", id=" + id + "]";
	}



	
}
