package com.teampj.physicheck.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teampj.physicheck.dto.AgilityDTO;
import com.teampj.physicheck.dto.BmiDTO;
import com.teampj.physicheck.dto.CardioEnduranceDTO;
import com.teampj.physicheck.dto.CustomerDTO;
import com.teampj.physicheck.dto.FlexibilityDTO;
import com.teampj.physicheck.dto.MentalDTO;
import com.teampj.physicheck.dto.MuscularEnduranceDTO;
import com.teampj.physicheck.dto.MuscularPowerDTO;
import com.teampj.physicheck.dto.PressureDTO;
import com.teampj.physicheck.dto.QuicknessDTO;
import com.teampj.physicheck.dto.ReserveDTO;
import com.teampj.physicheck.dto.Survey1DTO;
import com.teampj.physicheck.dto.Survey2DTO;
import com.teampj.physicheck.dto.Survey3DTO;
import com.teampj.physicheck.dto.Survey4DTO;
import com.teampj.physicheck.dto.UrineDTO;

@Mapper
public interface TestMapper {

	// 검사보낼때 예약한 번호와 각 설문 no 상위 테이블(mental)no와 맞추기위함
	CustomerDTO getMemberNo(int memberNo);
	
	//String getResurveNo(int memberNo);
	
    // 고객 심리검사 보내기_1
    int setMentalInsert1(Survey1DTO dto); // int는 null 불가, Integer는 null 가능

    // 고객 심리검사 보내기_2
    int setMentalInsert2(Survey2DTO dto); // int는 null 불가, Integer는 null 가능
    
    // 고객 심리검사 보내기_3
    int setMentalInsert3(Survey3DTO dto); // int는 null 불가, Integer는 null 가능

    // 고객 심리검사 보내기_4
    int setMentalInsert4(Survey4DTO dto); // int는 null 불가, Integer는 null 가능
    
    // 심리검사 결과 상위테이블로 보냄 mentalInsertAction() in TestService
    int mentalSelectAction(String strId);
    int mentalInsertAction(MentalDTO dto);
 
    
    // << - - - - Result - - - - >>
    // 심리결과 가져오기
    MentalDTO getMentalNo(String strId);
    MentalDTO getMentalResultAction(String strId, int mentalNo);
    
// - - - - - - - - - - - - - -- - - - - - - - - - - -- - - - - - - - - - - - - - - mentalTest    
    
    // 결과 보내기
    
    // << - - - - Result - - - - >>
    // 기본검사 결과 도출    
    // view로 한번에 가져오는게 더 간단
    PressureDTO getPressureResultAction(String strId);
    UrineDTO getUrineResultAction(String strId);    
    BmiDTO getBmiResultAction(String strId);
    
    // 기본 합계 도출
    // BasicDTO getBasicResultAction(String strId);
    
// - - - - - - - - - - - - - -- - - - - - - - - - - -- - - - - - - - - - - - - - - basicTest    

    // 결과 보내기    
    
    
    // 신체검사 결과 도출
    CardioEnduranceDTO getCardioEnduranceResultAction(String strId);
    FlexibilityDTO getFlexibilityResultAction(String strId);
    QuicknessDTO getQuicknessResultAction(String strId);
    MuscularPowerDTO getMuscularPowerResultAction(String strId);
    MuscularEnduranceDTO getMuscularEnduranceResultAction(String strId);
    AgilityDTO getAgilityResultAction(String strId);

    // 운동 합계 도출
    //PhysicalDTO getPhysicalResultAction(String strId);
    	
// - - - - - - - - - - - - - -- - - - - - - - - - - -- - - - - - - - - - - - - - - physicalTest    
	
    // 운동검사 리스트 가쟈오기
    List<ReserveDTO> physicalResultList(Map map);
    
    // 운동검사 리스트 갯수 가져오기
    int physicalResultListCnt(int memberNo);
    
    // ---- 고객_종합검사 결과_ 등록여부 체크 -----
    // 기초검사 등록여부 체크
    int totalBasicChk(int reserveNo);
    
    // 운동검사 등록여부 체크
    int totalPhysicalChk(int reserveNo);
    
    // 심리검사 등록여부 체크 
    int totalMentalChk(int reserveNo);
    
}