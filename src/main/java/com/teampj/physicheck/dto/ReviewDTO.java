package com.teampj.physicheck.dto;

import java.sql.Timestamp;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReviewDTO {

	
	int reviewNo;		// 리뷰번호
	String content;		// 내용
	int starPoint;		// 별점
	Timestamp inDate;	// 작성일
	int reserveNo;		// 예약번호 
	int memberNo;		// 회원번호
	
	
}