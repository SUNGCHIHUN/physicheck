package com.teampj.physicheck.Controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teampj.physicheck.Service.CustomerService;
import com.teampj.physicheck.Service.DoctorService;

@RequestMapping("/doctor/")
@Controller
public class DoctorResultController {
	
	@Autowired
	CustomerService service;
	
	@Autowired
	DoctorService service1;
	
	private static final Logger logger = LoggerFactory.getLogger(DoctorResultController.class);

	// 의료진_회원정보상세_운동검사 정보
	@RequestMapping("customerDetailPhysical")
	public String customerDetailPhysical(HttpServletRequest req, Model model) {
		logger.info("[url ==> customerDetailPhysical]C_con");
		
		service1.getPhysicalResult(req, model);
		return "doctor/mypage/customer/physicalDetail";
	}
	
	//===============================[검사결과등록]====================================
	//===============================[기초검사]====================================
	//의료진_기초검사등록 리스트페이지
	@RequestMapping("resultList1")
	public String resultList1(HttpServletRequest req, Model model) {
		logger.info("[url ==> resultList1]C_con");
		
		service.memberInfo(req, model); //leftbar에 자신이 진료하는 과목만
		service1.resultList(req, model);
		return "doctor/result/resultList1";
	}
	
	//의료진_기초검사등록 리스트페이지
	@RequestMapping("basicResult")
	public String basicResult(HttpServletRequest req, Model model) {
		logger.info("[url ==> basicResult]C_con");
		
		service.memberInfo(req, model); //leftbar에 자신이 진료하는 과목만
		service1.resultMemberInfo(req, model);
		return "doctor/result/basicResult";
	}
	
	//의료진_기초검사등록 페이지_등록(insert)
	@RequestMapping("basicResultInsert")
	public String doctorBasicResultInsert(HttpServletRequest req, Model model) {
		logger.info("[url ==> doctorBasicResultInsert]C_con");
		
		service1.insertResult1(req, model);
		return "doctor/result/basicResultAction";
	}
	
	//===============================[운동검사]====================================
	//의료진_운동검사등록 리스트페이지
	@RequestMapping("resultList2")
	public String resultList2(HttpServletRequest req, Model model) {
		logger.info("[url ==> resultList2]C_con");
		
		service.memberInfo(req, model); //leftbar에 자신이 진료하는 과목만
		service1.resultList1(req, model);
		return "doctor/result/resultList2";
	}
	
	//의료진_운동검사등록 페이지
	@RequestMapping("exerciseResult")
	public String doctorExerciseResult(HttpServletRequest req, Model model) {
		logger.info("[url ==> doctorExerciseResult]C_con");
		
		service.memberInfo(req, model); //leftbar에 자신이 진료하는 과목만
		service1.resultMemberInfo(req, model);
		return "doctor/result/exerciseResult";
	}
	
	//의료진_운동검사등록 insert
	@RequestMapping("exerciseResultInsert")
	public String doctorExerciseInsert(HttpServletRequest req, Model model) {
		logger.info("[url ==> doctorExerciseInsert]C_con");
		
		service1.insertResult2(req, model);
		return "doctor/result/exerciseResultAction";
	}
	
	//===============================[심리검사]====================================
	//의료진_심리검사등록 리스트페이지
	@RequestMapping("resultList3")
	public String resultList3(HttpServletRequest req, Model model) {
		logger.info("[url ==> resultList3]C_con");
		
		service.memberInfo(req, model); //leftbar에 자신이 진료하는 과목만
		service1.resultList2(req, model);
		return "doctor/result/resultList3";
	}
	
	//의료진_심리검사등록 페이지
	@RequestMapping("mentalResult")
	public String mentalResult(HttpServletRequest req, Model model) {
		logger.info("[url ==> mentalResult]C_con");
		
		service.memberInfo(req, model); //leftbar에 자신이 진료하는 과목만
		service1.resultMemberInfo(req, model);
		service1.surveyResult(req,model);
		return "doctor/result/mentalResult";
	}
	
	//의료진_심리검사등록 insert
	@RequestMapping("mentalResultInsert")
	public String doctorMentalResultInsert(HttpServletRequest req, Model model) {
		logger.info("[url ==> mentalResultInsert]C_con");
		
		service1.mentalResultInsert(req,model);
		return "doctor/result/mentalResultAction";
	}
	
}