package com.teampj.physicheck.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BmiDTO {

	private int bmiNo;
	private float height;
	private float weight;
	private float bmi;
	private float bodyFat;
	private float bodyMuscle;
	private float bodyWater;
	
}