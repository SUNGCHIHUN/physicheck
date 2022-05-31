package com.teampj.physicheck.vue.vo;

import lombok.Data;

@Data
public class BasicMemberVO {
	private int memberNo; // 회원번호
	private int reserveNo; // 예약번호
	private String name; // 이름
	private int jumin1; // 주민번호(나이 계산용)
	private String gender; // 성별
}
