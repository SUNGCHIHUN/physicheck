package com.teampj.physicheck.es.vo;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity(name = "totalsalesyear")
public class SalesVO {
	
	@Id
	private int rn;
	
	private Date salesdate;
	private String paymentway;
	private int total;
}