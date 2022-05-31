package com.teampj.physicheck.dto;

public class Statics1DTO {
	
	private int total;
	private String gender;
	
	public Statics1DTO() {}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "Statics1DTO [total=" + total + ", gender=" + gender + "]";
	}
	
	
}
