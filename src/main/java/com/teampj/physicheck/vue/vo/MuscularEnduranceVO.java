package com.teampj.physicheck.vue.vo;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;
import lombok.NoArgsConstructor;

// 근지구력
@Data
@Entity(name = "muscularendurance")
@NoArgsConstructor
public class MuscularEnduranceVO {

	@Id
	private int muscularenduranceno;
	private float situp;
	private float pushup;
	private int situpresult;
	private int pushupresult;
}