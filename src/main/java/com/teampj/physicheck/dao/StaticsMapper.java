package com.teampj.physicheck.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teampj.physicheck.dto.Statics1DTO;
import com.teampj.physicheck.dto.Statics2DTO;


@Mapper
public interface StaticsMapper {
	
	//통계 - 성별
	public List<Statics1DTO> statics1();
	
	//통계 - 연령별
	public List<Statics2DTO> statics2();
	
}
