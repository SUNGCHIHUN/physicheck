package com.teampj.physicheck.vue.vo;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity(name = "reserve")
@NoArgsConstructor
public class ReserveVO {

	@Id
	private int reserveno;
	private int memberno;
    private String id;
	private Timestamp reservedate;
	private Integer paystate;
	private Integer basicno;
	private Integer physicalno;
	private Integer mentalno;
	private Integer reviewstate;
    private String bshow;
    private String pshow;
    private String mshow;
}