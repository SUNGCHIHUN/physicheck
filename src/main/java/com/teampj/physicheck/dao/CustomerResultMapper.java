package com.teampj.physicheck.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teampj.physicheck.dto.ReserveDTO;

@Mapper
public interface CustomerResultMapper {

	// 리스트 갯수
	int reserveCnt(int memberNo);
	
	// 기초검사결과 리스트
	List<ReserveDTO> getBasicResultList(Map map);
	
	// 심리검사결과 리스트
	List<ReserveDTO> getMentalResultList(Map map);
    
	// 종합검사결과 리스트
	List<ReserveDTO> getTotalResultList(Map map);
}