package com.teampj.physicheck.vue.vo;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;
import lombok.NoArgsConstructor;

// 유연성
@Data
@Entity(name = "flexibility")
@NoArgsConstructor
public class FlexibilityVO {

	@Id
	private int flexibilityno;
	private float forwardbending;
	private float bridge;
	private int forwardbendingresult;
	private int bridgeresult;
}
