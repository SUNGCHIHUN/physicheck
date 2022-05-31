package com.teampj.physicheck.dto;

import java.sql.Date;

public class CustomerDTO {
	
	// 멤버변수 = 컬럼명 = input 태그명
	private int memberNo;
	private String id;
    private String password;
    private String name;
	private String email;
	private Date inDate;
	private Date outDate;
	private String authority;	// 권한등급 : ROLE_USER: customer, ROLE_ADMIN:관리자
	private String tel;
	private String able;
	private String gender;
	private int jumin1;
	private int jumin2;
	private String address;	
	private String enabled;	// 계정사용 가능여부(1: 사용가능, 0: 사용불가) : 이메일인증시 1로 update
	private String checks;
	private String examination;
	//추가
	private int reserveNo;
   
    // 디폴트 생성자 
    public CustomerDTO() {}

    // setter, getter 
	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getInDate() {
		return inDate;
	}

	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}

	public Date getOutDate() {
		return outDate;
	}

	public void setOutDate(Date outDate) {
		this.outDate = outDate;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAble() {
		return able;
	}

	public void setAble(String able) {
		this.able = able;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getJumin1() {
		return jumin1;
	}

	public void setJumin1(int jumin1) {
		this.jumin1 = jumin1;
	}

	public int getJumin2() {
		return jumin2;
	}

	public void setJumin2(int jumin2) {
		this.jumin2 = jumin2;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public String getChecks() {
		return checks;
	}

	public void setChecks(String checks) {
		this.checks = checks;
	}

	public String getExamination() {
		return examination;
	}

	public void setExamination(String examination) {
		this.examination = examination;
	}
	
	public int getReserveNo() {
		return reserveNo;
	}

	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}

	@Override
	public String toString() {
		return "CustomerDTO [memberNo=" + memberNo + ", id=" + id + ", password=" + password + ", name=" + name
				+ ", email=" + email + ", inDate=" + inDate + ", outDate=" + outDate + ", authority=" + authority
				+ ", tel=" + tel + ", able=" + able + ", gender=" + gender + ", jumin1=" + jumin1 + ", jumin2=" + jumin2
				+ ", address=" + address + ", enabled=" + enabled + ", checks=" + checks + ", examination="
				+ examination + ", reserveNo=" + reserveNo + "]";
	}
}
