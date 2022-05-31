package com.teampj.physicheck.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BloodDTO {

	private int bloodNo;
	private float redBloodCell;
	private float whiteBloodCell;
	private float bloodPlatelet;
	private float liverFunction;
	private float bloodGlucose;
	
}
