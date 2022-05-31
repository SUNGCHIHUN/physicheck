package com.teampj.physicheck.vue.vo;

import lombok.Data;

@Data
public class MentalVO {
	
	private int reserveNo;
	private int total1;			//시각
	private int total2;			//청각
	private int total3;			//운동감각
	private int total4;			//기분상태
	private int total5;			//조절력
	private String comments;	//소견서

}
