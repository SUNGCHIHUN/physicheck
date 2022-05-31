package com.teampj.physicheck.dto;

public class SalesDTO {
	private int paymentYear; // 결제 년도
	private int paymentMonth; // 결제 월
	private int paymentDay; // 결제 일
	private String paymentWay; // 결제 방법
	private int total; // 매출
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
	public String getPaymentWay() {
		return paymentWay;
	}
	public void setPaymentWay(String paymentWay) {
		this.paymentWay = paymentWay;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "SalesDTO [paymentYear=" + paymentYear + ", paymentMonth=" + paymentMonth + ", paymentDay=" + paymentDay
				+ ", paymentWay=" + paymentWay + ", total=" + total + "]";
	}
}