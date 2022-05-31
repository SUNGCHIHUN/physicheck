package com.teampj.physicheck.vue.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teampj.physicheck.dto.BmiDTO;
import com.teampj.physicheck.dto.MentalDTO;
import com.teampj.physicheck.dto.ReserveDTO;
import com.teampj.physicheck.vue.vo.MentalVO;

@Mapper
public interface MentalMapper {
	
	// 심리검사 등록 대기목록 조회
	List<ReserveDTO> getVueReserveList2();
	
	// 심리검사 결과 조회
	public MentalVO getVueMentalInfo(int reserveNo);
	
	// 소견서 등록
	public int mentalVueResultInsert(MentalVO dto);
		
	// 심리검사등록 확인 시 목록에서 가리기
	public int showUpdateVue2(int reserveNo);
	
	// 심리검사 등록 목록 조회
	public List<ReserveDTO> getVueMemberResultInfo2();

}