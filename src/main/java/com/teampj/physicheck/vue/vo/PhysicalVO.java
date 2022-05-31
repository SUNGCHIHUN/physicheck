package com.teampj.physicheck.vue.vo;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;
import lombok.NoArgsConstructor;

// 운동검사
@Data
@Entity(name = "physical")
@NoArgsConstructor
public class PhysicalVO {
	
	@Id
	private int physicalno;
	private int cardioenduranceno;
	private int flexibilityno;
	private int agilityno;
	private int muscularpowerno;
	private int Muscularenduranceno;
	private int quicknessno;
	private String testcode;
	private String testname;
	private int testexpense;
	private String id;
	
}