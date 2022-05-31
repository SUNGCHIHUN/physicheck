package com.teampj.physicheck.dto;

public class Statics2DTO {
	private int total;
	private int age;
	private String generation;
	
	public Statics2DTO() {}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGeneration() {
		return generation;
	}

	public void setGeneration(String generation) {
		this.generation = generation;
	}

	@Override
	public String toString() {
		return "Statics2DTO{" +
				"total=" + total +
				", age=" + age +
				", generation='" + generation + '\'' +
				'}';
	}
}
