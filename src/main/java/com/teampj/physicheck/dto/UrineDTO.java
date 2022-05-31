package com.teampj.physicheck.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UrineDTO {

	private int urine_no;
	private float urineProtein;
	private float urineAcid;
	private float urineGlucose;
	
}
