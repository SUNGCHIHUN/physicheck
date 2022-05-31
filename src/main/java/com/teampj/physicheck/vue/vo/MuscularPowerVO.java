package com.teampj.physicheck.vue.vo;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;
import lombok.NoArgsConstructor;

// 근력
@Data
@Entity(name = "muscularpower")
@NoArgsConstructor
public class MuscularPowerVO {

	@Id
	private int muscularpowerno;
	private float squirt;
	private float benchpress;
	private int squirtresult;
	private int benchpressresult;
}