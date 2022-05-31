package com.teampj.physicheck.vue.vo;

import lombok.Data;

@Data
public class BasicVO {
	
	private String gender;
	//bmi
	private float height;
	private float weight;
	private float bmi;
	private float bodyFat;
	private float bodyMuscle;
	private float bodyWater;
	//pressure
	private float pressureHigh;
	private float pressureLow;
	//urine
	private float urineProtein;
	private float urineAcid;
	private float urineGlucose;
	// blood
	private float redBloodCell;
	private float whiteBloodCell;
	private float bloodPlatelet;
	private float liverFunction;
	private float bloodGlucose;
	
}