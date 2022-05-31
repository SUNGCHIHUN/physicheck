package com.teampj.physicheck.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teampj.physicheck.dto.DoctorDTO;
import com.teampj.physicheck.dto.MemberDTO;
import com.teampj.physicheck.dto.PerformanceDTO;
import com.teampj.physicheck.dto.Sales2DTO;
import com.teampj.physicheck.dto.SalesDTO;

@Mapper
public interface AdminInfoMapper {

	// ---------------------- 회원 관리 ---------------------------
	// 회원 전체수 조회
	int getMemberTotal(String keyword);
	
	// 회원 리스트 조회
	List<MemberDTO> getMemberList(Map<String, Object> map);
	
	// 회원 승인
	int confirmRegist(int memberNo);
	
	// 회원 삭제
	int deleteMember(int memberNo);
	
	// ---------------------- 의료진 관리 ---------------------------
	
	// 의료진 전체수 조회
	int getDoctorTotal(String keyword);
	
	// 의료진 리스트 조회
	List<DoctorDTO> getDoctorList(Map<String, Object> map);
	
	// 의료진 등록 처리
	int registDoctor(DoctorDTO dto);
	
	// 의료진 정보 가져오기
	DoctorDTO getDoctorDetail(int doctorNo);
	
	// 의료진 검진과목 수정
	int modifyExamination(DoctorDTO dto);
	
	// 의료진 삭제 처리
	int deleteDoctor(int doctorNo);

	// 의료진 실적 조회 (연도별)
	List<PerformanceDTO> getPerformance();
	
	// 의료진 실적 조회 (특정 연도별)
	List<PerformanceDTO> getPerformanceYear(int year);
	
	// 의료진 실적 조회 (월별)
	List<PerformanceDTO> getPerformanceMonth(int year);
	
	// 의료진 실적 조회 (일별)
	List<PerformanceDTO> getPerformanceDay(Map<String, Object> map);
	
	// ----------------------- 결산 ------------------------------

	// 총 매출(연도별)
	List<SalesDTO> getTotalSales();
	
	// 총 매출(월별)
	List<SalesDTO> getTotalSalesMonth(int year);
	
	// 총 매출(일별)
	List<SalesDTO> getTotalSalesDay(Map<String, Object> map);
	
	// 검사항목별 총 매출(연도별)
	List<Sales2DTO> getTestSales();

	// 검사항목별 총 매출(월별)
	List<Sales2DTO> getTestSalesMonth(int year);
	
	// 검사항목별 총 매출(일별)
	List<Sales2DTO> getTestSalesDay(Map<String, Object> map);
	
}