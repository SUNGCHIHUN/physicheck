package com.teampj.physicheck.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teampj.physicheck.dto.AgilityDTO;
import com.teampj.physicheck.dto.BasicDTO;
import com.teampj.physicheck.dto.BloodDTO;
import com.teampj.physicheck.dto.BmiDTO;
import com.teampj.physicheck.dto.CardioEnduranceDTO;
import com.teampj.physicheck.dto.CustomerDTO;
import com.teampj.physicheck.dto.DoctorDTO;
import com.teampj.physicheck.dto.EyesightDTO;
import com.teampj.physicheck.dto.FlexibilityDTO;
import com.teampj.physicheck.dto.HearingDTO;
import com.teampj.physicheck.dto.MentalDTO;
import com.teampj.physicheck.dto.MuscularEnduranceDTO;
import com.teampj.physicheck.dto.MuscularPowerDTO;
import com.teampj.physicheck.dto.PhysicalDTO;
import com.teampj.physicheck.dto.PressureDTO;
import com.teampj.physicheck.dto.QuicknessDTO;
import com.teampj.physicheck.dto.ReserveDTO;
import com.teampj.physicheck.dto.UrineDTO;


@Mapper
public interface DoctorInfoMapper {
	
	//===============================[의료진 정보수정]====================================
	//의료진 정보 update
	int memberInfoUpdate(DoctorDTO dto);
	
	//===============================[일정관리]====================================
	//캘린더 
	List<Map<String, Object>> schduleList();
	
	//===============================[담당회원정보]====================================
	//담당회원정보 목록 (진료과목 + show='n')
	List<ReserveDTO> getReserveInfoList(Map<String, Object> map);
	
	List<ReserveDTO> getReserveInfoList1(Map<String, Object> map);
	
	List<ReserveDTO> getReserveInfoList2(Map<String, Object> map);
	
	//기초검사 결과 select
	//체질량 검사
	BmiDTO getBmiResult(int reserveNo);
	
	//혈압검사
	PressureDTO getPressureResult(int reserveNo);
	
	//소변검사
	UrineDTO getUrineResult(int reserveNo);
	
	//혈액검사
	BloodDTO getBloodResult(int reserveNo);
	
	//이전검사결과list(기초)
	List<ReserveDTO> resultBasicList(Map<String, Object> map);
	
	//이전검사결과list(심리)
	List<ReserveDTO> resultMentalList(Map<String, Object> map);
	
	//기초검사 결과 update
	int bmiResultUpdate(Map<String, Object> map);
	
	//혈압 검사
	int pressureResultUpdate(Map<String, Object> map);
	
	//소변 검사
	int urineResultUpdate(Map<String, Object> map);
	
	//혈액 검사
	int bloodResultUpdate(Map<String, Object> map);
	
	//심리검사 소견서 select
	MentalDTO getMentalComments(int reserveNo);
	
	// 검진이력 'X' -> 'Y'
	int checksUpdate(int memberNo);
	
	//===============================[검사결과등록]====================================
	//게시글 갯수
	int boardCnt();
	 
	//게시글 목록(기본)
	List<ReserveDTO> getReserveList(Map<String, Object> map);
	
	//게시글 목록(운동)
	List<ReserveDTO> getReserveList1(Map<String, Object> map);
	
	//게시글 목록(심리)
	List<ReserveDTO> getReserveList2(Map<String, Object> map);
	
	//회원정보 불러오기
	CustomerDTO getCustomerList(int reserveNo);

	//---------------------------------[기초검사 insert]--------------------------------------
	//체질량 검사
	int bmiResultInsert(BmiDTO dto);
	
	//혈압 검사
	int pressureResultInsert(PressureDTO dto);
	
	//소변 검사
	int urineResultInsert(UrineDTO dto);
	
	//혈액 검사
	int bloodResultInsert(BloodDTO dto);
	
	//시력 검사
	int eyesightResultInsert(EyesightDTO dto);
	
	//청력 검사
	int hearingResultInsert(HearingDTO dto);
	
	//기초 상위 테이블로 이동
	int BasicInsert(BasicDTO dto);
	
	//---------------------------------[운동능력검사 insert]--------------------------------------
	//심페지구력 검사
	int CardioEnduranceResultInsert(CardioEnduranceDTO dto);
	
	//유연성 검사 2
	int FlexibilityResultInsert(FlexibilityDTO dto);
	
	//순발력 검사
	int AgilityResultInsert(AgilityDTO dto);
	
	//근력 검사
	int MuscularPowerResultInsert(MuscularPowerDTO dto);
	
	//근지구력 검사
	int MuscularEnduranceResultInsert(MuscularEnduranceDTO dto);
	
	//민첩성 검사
	int QuicknessResultInsert(QuicknessDTO dto);
	
	//운동검사
	int PhysicalInsert(PhysicalDTO dto);
	
	//---------------------------------[심리검사 insert]--------------------------------------
	//심리검사 설문지
	MentalDTO getMentalSurveyResult(int mentalNo);
	
	//심리검사 설문지 > 그래프용
	MentalDTO getMentalSurveyResult2(int mentalNo);
	
	//심리검사 
	int mentalResultInsert(MentalDTO dto);
	
	//---------------------------------[모든 검사 insert 후 show='n'으로 변경해서 리스트에 안보이도록 적용]--------------------------------------
	//기본 bshow
	int showUpdate(int reserveNo);
	
	//운동 pshow
	int showUpdate1(int reserveNo);
	
	//심리 mshow
	int showUpdate2(int reserveNo);

	// --------------------------- 회원 상세 운동검사 정보
	CardioEnduranceDTO getPhysicalCardio(int reserveNo);
	
	FlexibilityDTO getPhysicalFlexibility(int reserveNo);
	
	AgilityDTO getPhysicalAgility(int reserveNo);
	
	MuscularPowerDTO getPhysicalMuscularPower(int reserveNo);
	
	MuscularEnduranceDTO getPhysicalMuscularEndurance(int reserveNo); 
	
	QuicknessDTO getPhysicalQuickness(int reserveNo);
	
	
	// 운동검사 결과 수정
	// 심폐지구력
	int CardioEnduranceResultUpdate(Map map);
	
	// 유연성
	int FlexibilityResultUpdate(Map map);
	
	// 순발력
	int AgilityResultUpdate(Map map);

	// 근력
	int MuscularPowerResultUpdate(Map map);
	
	// 근지구력
	int MuscularEnduranceResultUpdate(Map map);
	
	// 민첩성
	int QuicknessResultUpdate(Map map);
}