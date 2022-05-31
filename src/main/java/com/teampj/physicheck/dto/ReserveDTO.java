package com.teampj.physicheck.dto;

import java.sql.Timestamp;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReserveDTO {

	private int reserveNo;            // 예약번호
	private int memberNo;            // 회원번호
	private Timestamp reserveDate;      // 예약일
	private int basicNo;            // 기초검사번호
	private int physicalNo;            // 운동검사번호
	private int mentalNo;            // 심리검사번호
	private int payState;            // 결제 상태
	private int reviewState;         // 리뷰 작성 여부
   
   //추가
   private String name;      //회원명
   //추가
   private String bshow;      // 기본검사 등록 완료시 bshow='n'
   private String pshow;      // 운동검사 등록 완료시 pshow='n'
   private String mshow;      // 심리검사 등록 완료시 mshow='n'
   //추가
   private String testCode;
   //추가
   private String gender;
   //
   private String reserveDate1;
   
}