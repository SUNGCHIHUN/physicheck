package com.teampj.physicheck.vue.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teampj.physicheck.dto.BasicDTO;
import com.teampj.physicheck.dto.BloodDTO;
import com.teampj.physicheck.dto.BmiDTO;
import com.teampj.physicheck.dto.PressureDTO;
import com.teampj.physicheck.dto.ReserveDTO;
import com.teampj.physicheck.dto.UrineDTO;
import com.teampj.physicheck.vue.vo.BasicMemberVO;
import com.teampj.physicheck.vue.vo.BasicVO;

@Mapper
public interface BasicMapper {
	
	// 기초검사 등록 대기목록 조회
	public List<ReserveDTO> getVueReserveList1();
	
	// 회원정보
	public BasicMemberVO getVueMemberInfo1(int reserveNo);

	// bmi 등록
	public int bmiVueResultInsert(BmiDTO bmi);
	
	// 혈압검사
	public int pressureVueResultInsert(PressureDTO pressure);
	
	// 소변검사
	public int urineVueResultInsert(UrineDTO urine);
	
	// 혈액검사
	public int bloodVueResultInsert(BloodDTO blood);
	
	// 상위테이블 등록
	public int BasicVueInsert(BasicDTO basic);
	
	// 기초검사등록 확인 시 목록에서 가리기
	public int showUpdateVue(int reserveNo);
	
	// 기초검사 등록 목록 조회
	public List<ReserveDTO> getVueMemberResultInfo();

	// 기초검사 결과 조회
	//bmi
	public BmiDTO getVueBmiResult(int reserveNo);
	
	// 혈압검사
	public PressureDTO getVuePressureResult(int reserveNo);
	
	// 소변검사
	public UrineDTO getVueUrineResult(int reserveNo);
	
	// 혈액검사
	public BloodDTO getVueBloodResult(int reserveNo);
	
}