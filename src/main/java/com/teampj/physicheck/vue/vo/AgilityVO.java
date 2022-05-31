package com.teampj.physicheck.vue.vo;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;
import lombok.NoArgsConstructor;

// 순발력
@Data
@Entity(name="agility")
@NoArgsConstructor
public class AgilityVO {

	@Id
	private int agilityno;
	private float longjump;
	private float run50;
	private int longjumpresult;
	private int run50result;
}