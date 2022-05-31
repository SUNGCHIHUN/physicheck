package com.teampj.physicheck.dto;

import java.sql.Date;

// 식단
public class DietDTO {

	private int dietNo;      // 번호
	private String title;    // 식단명
	private String content1; // 필요성
	private String content2; // 실제
	private String content3; // 권장 식품
	private String content4; // 주의 식품
	private String content5; // 그 외 주의사항
	private String image;    // 이미지 경로
	private String image2;   // 추천 식단
	private int memberNo;    // 작성한 의사 번호
	private Date inDate;     // 작성일
	private int count;       // 조회수
	private String show;
	
	public int getDietNo() {
		return dietNo;
	}
	public void setDietNo(int dietNo) {
		this.dietNo = dietNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent1() {
		return content1;
	}
	public void setContent1(String content1) {
		this.content1 = content1;
	}
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	public String getContent3() {
		return content3;
	}
	public void setContent3(String content3) {
		this.content3 = content3;
	}
	public String getContent4() {
		return content4;
	}
	public void setContent4(String content4) {
		this.content4 = content4;
	}
	public String getContent5() {
		return content5;
	}
	public void setContent5(String content5) {
		this.content5 = content5;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public Date getInDate() {
		return inDate;
	}
	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	
	@Override
	public String toString() {
		return "DietDTO [dietNo=" + dietNo + ", title=" + title + ", content1=" + content1 + ", content2=" + content2
				+ ", content3=" + content3 + ", content4=" + content4 + ", content5=" + content5 + ", image=" + image
				+ ", image2=" + image2 + ", memberNo=" + memberNo + ", inDate=" + inDate + ", count=" + count
				+ ", show=" + show + "]";
	}
}