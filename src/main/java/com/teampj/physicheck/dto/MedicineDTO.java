package com.teampj.physicheck.dto;

import java.sql.Date;

public class MedicineDTO {

	private int medicineNo;	 // 의약품번호
	private String name;	 // 이름
	private String img;		 // 이미지
	private String content1;  // 내용
	private String content2;  // 내용	
	private int memberNo;    // 작성한 의사 번호
	private Date inDate;     // 작성일
	private int count;       // 조회수
	private String show;	 // 삭제여부
	private String examination;
	
	public MedicineDTO() {}

	public MedicineDTO(int medicineNo, String name, String img, String content1, String content2, int memberNo,
			Date inDate, int count, String show, String examination) {
		super();
		this.medicineNo = medicineNo;
		this.name = name;
		this.img = img;
		this.content1 = content1;
		this.content2 = content2;
		this.memberNo = memberNo;
		this.inDate = inDate;
		this.count = count;
		this.show = show;
		this.examination = examination;
	}

	public int getMedicineNo() {
		return medicineNo;
	}

	public void setMedicineNo(int medicineNo) {
		this.medicineNo = medicineNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
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

	public String getExamination() {
		return examination;
	}

	public void setExamination(String examination) {
		this.examination = examination;
	}

	@Override
	public String toString() {
		return "MedicineDTO [medicineNo=" + medicineNo + ", name=" + name + ", img=" + img + ", content1=" + content1
				+ ", content2=" + content2 + ", memberNo=" + memberNo + ", inDate=" + inDate + ", count=" + count
				+ ", show=" + show + ", examination=" + examination + "]";
	}

	
	
}
