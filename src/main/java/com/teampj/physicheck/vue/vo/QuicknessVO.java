package com.teampj.physicheck.vue.vo;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;
import lombok.NoArgsConstructor;

// 민첩성
@Data
@Entity(name = "quickness")
@NoArgsConstructor
public class QuicknessVO {

	@Id
	private int quicknessno;
	private float sidestep;
	private float burpeetest;
	private int sidestepresult;
	private int burpeetestresult;
}