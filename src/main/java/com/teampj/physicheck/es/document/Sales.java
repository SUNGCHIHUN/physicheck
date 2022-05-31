package com.teampj.physicheck.es.document;

import java.sql.Date;

import javax.persistence.Id;

import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

import lombok.Data;

@Data
@Document(indexName = "sales")
public class Sales {
	
	@Id
	private int id;
	
	@Field(type = FieldType.Date)
	private Date salesDate;
	
	@Field(type = FieldType.Keyword)
	private String paymentWay;
	
	@Field(type = FieldType.Integer)
	private int total;
}