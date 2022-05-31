package com.teampj.physicheck.dto;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberDTO {
	
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
	private String authority; // 권한

	
}