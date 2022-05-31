package com.teampj.physicheck.dto;

public class Sales2DTO {
	private int paymentYear;
	private int paymentMonth;
	private int paymentDay;
	private String testCode;
	private int total;
	
	public Sales2DTO() {}

	public int getPaymentYear() {
		return paymentYear;
	}

	public void setPaymentYear(int paymentYear) {
		this.paymentYear = paymentYear;
	}

	public int getPaymentMonth() {
		return paymentMonth;
	}

	public void setPaymentMonth(int paymentMonth) {
		this.paymentMonth = paymentMonth;
	}

	public int getPaymentDay() {
		return paymentDay;
	}

	public void setPaymentDay(int paymentDay) {
		this.paymentDay = paymentDay;
	}

	public String getTestCode() {
		return testCode;
	}

	public void setTestCode(String testCode) {
		this.testCode = testCode;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "Sales2DTO [paymentYear=" + paymentYear + ", paymentMonth=" + paymentMonth + ", paymentDay=" + paymentDay
				+ ", testCode=" + testCode + ", total=" + total + "]";
	}
}