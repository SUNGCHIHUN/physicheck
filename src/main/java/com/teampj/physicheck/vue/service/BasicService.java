package com.teampj.physicheck.vue.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.teampj.physicheck.dto.BasicDTO;
import com.teampj.physicheck.dto.BloodDTO;
import com.teampj.physicheck.dto.BmiDTO;
import com.teampj.physicheck.dto.PressureDTO;
import com.teampj.physicheck.dto.ReserveDTO;
import com.teampj.physicheck.dto.UrineDTO;
import com.teampj.physicheck.vue.dao.BasicMapper;
import com.teampj.physicheck.vue.vo.BasicMemberVO;
import com.teampj.physicheck.vue.vo.BasicVO;

@Service
public class BasicService {
	
	@Autowired
	BasicMapper dao;
	
	public List<ReserveDTO> getVueReserveList1() {
		return dao.getVueReserveList1();
	}
	
	public BasicMemberVO getVueMemberInfo1(int reserveNo) {
		return dao.getVueMemberInfo1(reserveNo);
	}

	public int insertVueBasicResult(int reserveNo, BasicVO vo, HttpServletRequest req) {
		System.out.println("insertVueBasicResult()");
		System.out.println("reserveNo" + reserveNo);
		System.out.println("vo : " + vo);
		String gender = vo.getGender();
		System.out.println("성별 : " + gender);
		
		//체질량 검사
		BmiDTO dto1 = new BmiDTO();
		dto1.setBmiNo(reserveNo);
	
		//bmi 계산 - 성별 구분 X
		float cm= vo.getHeight();
		float kg= vo.getWeight();
		cm/=100;	//cm -> m 로 변환
		float bmi = kg / (cm*cm);
		//bmi= (float) ((bmi*100)/100.0); //소수점 2자리
		cm*=100;	//m -> cm 로 변환
		dto1.setBmi(bmi);
		
		//체지방 계산
		if (gender.equals("남성")) {
			// 남자)  체지방량(kg) ->  (1.1 * 자기 체중) - {128 * (자기 체중 / 자기 키)}
			float bodyFat = (float) ((1.1 * kg) - (128 * (kg/cm)));
			//bodyFat = (float) ((bodyFat*100)/100.0);	//소수점 2자리
			dto1.setBodyFat(Math.round(bodyFat));
	    } else if (gender.equals("여성")){
	    	// 여자)  체지방량(kg) ->  (1.07 * 자기 체중) - {128 * (자기 체중 / 자기 키)}
	    	float bodyFat = (float) ((1.07 * kg) - (128 * (kg/cm)));
	    	//bodyFat = (float) ((bodyFat*100)/100.0);	//소수점 2자리
	    	dto1.setBodyFat(Math.round(bodyFat));
	    } else {
	        System.out.println("안탐");
	    }
		
		//근육량
		// 근육량(+-0.3kg) = 체중 - 체지방량 - 무기질량(2.5~3.0) -> 무기질량 남자는 3.0 여자는 2.5로 잡음
		if (gender.equals("남성")) {
			// 남자)  근육량(+-0.3kg) = 체중 - 체지방량 - 무기질량(3.0)
			float bodyMuscle = (float) (kg - dto1.getBodyFat() - 3.0);
			//bodyMuscle = (float) ((bodyMuscle*100)/100.0);	//소수점 2자리
			dto1.setBodyMuscle(Math.round(bodyMuscle));
	    } else if (gender.equals("여성")){
	    	// 여자)  근육량(+-0.3kg) = 체중 - 체지방량 - 무기질량(2.5)
	    	float bodyMuscle = (float) (kg - dto1.getBodyFat() - 2.5);
	    	//bodyMuscle = (float) ((bodyMuscle*100)/100.0);	//소수점 2자리
	    	dto1.setBodyMuscle(Math.round(bodyMuscle));
	    } else {
	        System.out.println("안탐");
	    }
		
		dto1.setHeight(cm);
		dto1.setWeight(kg);
		dto1.setBmi(Math.round(bmi));
		float bodyWater = vo.getBodyWater();
		dto1.setBodyWater(bodyWater);
		System.out.println("===============================================");
		System.out.println("체질량 검사 dto : " + dto1);

		int bmiInsertCnt = dao.bmiVueResultInsert(dto1);
		System.out.println("bmiInsertCnt : " + bmiInsertCnt);
		System.out.println("===============================================");
		
		//혈압검사
		PressureDTO dto2 = new PressureDTO();
		dto2.setPressure_no(reserveNo);
		dto2.setPressureHigh(vo.getPressureHigh());
		dto2.setPressureLow(vo.getPressureLow());
		System.out.println("===============================================");
		System.out.println("혈압 검사 dto : " + dto2);

		int pressureInsertCnt = dao.pressureVueResultInsert(dto2);
		System.out.println("pressureInsertCnt : " + pressureInsertCnt);
		System.out.println("===============================================");
		
		//소변검사
		UrineDTO dto3 = new UrineDTO();
		dto3.setUrine_no(reserveNo);
		dto3.setUrineProtein(vo.getUrineProtein());
		dto3.setUrineAcid(vo.getUrineAcid());
		dto3.setUrineGlucose(vo.getUrineGlucose());
		System.out.println("===============================================");
		System.out.println("소변검사 dto : " + dto3);

		int urineInsertCnt = dao.urineVueResultInsert(dto3);
		System.out.println("urineResultInsert : " + urineInsertCnt);
		System.out.println("===============================================");
		
		//혈액검사
		BloodDTO dto4 = new BloodDTO();
		dto4.setBloodNo(reserveNo);
		dto4.setRedBloodCell(vo.getRedBloodCell());
		dto4.setWhiteBloodCell(vo.getWhiteBloodCell());
		dto4.setBloodPlatelet(vo.getBloodPlatelet());
		dto4.setLiverFunction(vo.getLiverFunction());
		dto4.setBloodGlucose(vo.getBloodGlucose());
		System.out.println("===============================================");
		System.out.println("혈액 검사 dto : " + dto4);

		int bloodInsertCnt = dao.bloodVueResultInsert(dto4);
		System.out.println("bloodInsertCnt : " + bloodInsertCnt);
		System.out.println("===============================================");
		
		//상위테이블로 insert
		BasicDTO dto7 = new BasicDTO();
		dto7.setBasicNo(reserveNo);
		dto7.setBmiNo(reserveNo);
		dto7.setPressureNo(reserveNo);
		dto7.setUrineNo(reserveNo);
		dto7.setBloodNo(reserveNo);
		dto7.setTestExpense(50000);
		dto7.setId("basicdoctor");

		System.out.println("===============================================");
		System.out.println("기초검사 상위 테이블 : " + dto7);

		int BasicInsertCnt = dao.BasicVueInsert(dto7);
		System.out.println("BasicInsertCnt : " + BasicInsertCnt);
		System.out.println("===============================================");
		
		int updateCnt = 0;
		if (bmiInsertCnt == 1 && pressureInsertCnt == 1 && urineInsertCnt == 1 &&
				bloodInsertCnt == 1) {
			System.out.println("reserveNo : " + reserveNo);
			updateCnt = dao.showUpdateVue(reserveNo);
			System.out.println("update : " + updateCnt);

		}else{
			System.out.println("show='n'으로 못 바꿈"); }

		return updateCnt;
	}

	public List<ReserveDTO> getMemberResultInfo() {
		// TODO Auto-generated method stub
		return dao.getVueMemberResultInfo();
	}

	// 기초검사 결과 조회
	public  List<Object> basicCustomerResult(int reserveNo, HttpServletRequest req, Model model) {
		System.out.println("D_service => basicReault");
		List<Object> list = new ArrayList<Object>();
		
		//체질량검사 가져와기
		BmiDTO bmi = dao.getVueBmiResult(reserveNo);
		System.out.println("bmi : " + bmi);
		
		
		//혈압검사
		PressureDTO pressure = dao.getVuePressureResult(reserveNo);
		System.out.println("pressure : " + pressure);
		
		//소변검사
		UrineDTO urine = dao.getVueUrineResult(reserveNo);
		System.out.println("urine : " + urine);
		
		//혈액검사
		BloodDTO blood = dao.getVueBloodResult(reserveNo);
		System.out.println("blood : " + blood);
		
		list.add(bmi);
		list.add(pressure);
		list.add(urine);
		list.add(blood);
		
		return list;
	}

}
