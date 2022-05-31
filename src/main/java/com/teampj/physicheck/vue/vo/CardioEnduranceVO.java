package com.teampj.physicheck.vue.vo;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;
import lombok.NoArgsConstructor;

// 심폐지구력
@Data
@Entity(name = "cardioendurance")
@NoArgsConstructor
public class CardioEnduranceVO {
	@Id
	private int cardioenduranceno;
	private float run3km;
	private float balkeprotocol;
	private int run3kmresult;
	private int balkeprotocolresult;
}