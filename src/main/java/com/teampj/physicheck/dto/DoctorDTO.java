package com.teampj.physicheck.dto;

import java.sql.Date;

public class DoctorDTO {
	
	private int memberNo; // 번호
	private	String id; // 아이디
	private String password; // 비밀번호
	private String name; // 이름
	private String email; // 이메일
	private Date inDate; // 가입일
	private Date outDate; // 탈퇴일
	private String able; // 삭제여부
	private String tel; // 연락처
	private String gender; // 성별
	private int jumin1; // 주민번호1
	private int jumin2; // 주민번호2
	private String address; // 주소
	private int enabled; // 회원 승인 여부
	private String checks; // 검진이력
	private String examination; // 검진과목
	private String authority; // 권한
	private int age; // (만)나이
	
	public DoctorDTO() {}

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

	public String getAble() {
		return able;
	}

	public void setAble(String able) {
		this.able = able;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
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

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
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

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "DoctorDTO [memberNo=" + memberNo + ", id=" + id + ", password=" + password + ", name=" + name
				+ ", email=" + email + ", inDate=" + inDate + ", outDate=" + outDate + ", able=" + able + ", tel=" + tel
				+ ", gender=" + gender + ", jumin1=" + jumin1 + ", jumin2=" + jumin2 + ", address=" + address
				+ ", enabled=" + enabled + ", checks=" + checks + ", examination=" + examination + ", authority="
				+ authority + ", age=" + age + "]";
	}
}