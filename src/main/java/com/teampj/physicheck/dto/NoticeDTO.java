package com.teampj.physicheck.dto;

import java.sql.Timestamp;

public class NoticeDTO {

	private int noticeNo;				// 공지사항 번호
	private String title;				// 제목
	private String content;				// 내용
	private String writer;				// 작성자
	private Timestamp inDate;			// 작성일
	private int readCnt;				// 조회수
	
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getInDate() {
		return inDate;
	}
	public void setInDate(Timestamp inDate) {
		this.inDate = inDate;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	
	
	@Override
	public String toString() {
		return "NoticeDTO [noticeNo=" + noticeNo + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", inDate=" + inDate + ", readCnt=" + readCnt + "]";
	}

	
	
}
