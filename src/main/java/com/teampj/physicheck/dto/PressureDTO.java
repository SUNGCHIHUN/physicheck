package com.teampj.physicheck.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PressureDTO {

	private int pressure_no;
	private float pressureHigh;
	private float pressureLow;
	
}
