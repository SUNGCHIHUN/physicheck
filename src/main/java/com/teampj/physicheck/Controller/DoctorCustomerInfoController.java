package com.teampj.physicheck.Controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teampj.physicheck.Service.CustomerService;
import com.teampj.physicheck.Service.DoctorService;

@RequestMapping("/doctor/")
@Controller
public class DoctorCustomerInfoController {
	
	@Autowired
	CustomerService service;
	
	@Autowired
	DoctorService service1;
	
	private static final Logger logger = LoggerFactory.getLogger(DoctorCustomerInfoController.class);
	

	//===============================[담당회원정보]====================================
	//의료진_회원정보 페이지
	@RequestMapping("customerInfo")
	public String doctorCustomerInfo(HttpServletRequest req, Model model) {
		logger.info("[url ==> customerInfo]C_con");
		
		service.memberInfo(req, model); //leftbar에 자신이 진료하는 과목만
		service1.resultInfoList(req, model);
		return "doctor/mypage/customer/info";
	}
	
	/*
	//의료진_회원정보상세
	@RequestMapping("customerDetail")
	public String doctorCustomerDetail(HttpServletRequest req, Model model) {
		logger.info("[url ==> customerDetail]C_con");
		
		service.memberInfo(req, model); //leftbar에 자신이 진료하는 과목만
		service1.resultMemberInfo(req, model);
		service1.basicReault(req, model);
		service1.surveyResult(req,model);	   //심리검사결과
		//service1.resultInfoList(req, model); //이전검사내역
		return "doctor/mypage/customer/infoDetail";
	}
	*/
	
	//의료진_회원정보상세(기초)
	@RequestMapping("customerDetail1")
	public String doctorCustomerDetail1(HttpServletRequest req, Model model) {
		logger.info("[url ==> customerDetail1]C_con");
		
		service.memberInfo(req, model); //leftbar에 자신이 진료하는 과목만
		service1.resultMemberInfo(req, model);
		service1.basicReault(req, model);
		service1.resultBasicList(req, model); //이전검사내역
		return "doctor/mypage/customer/infoDetail1";
	}

	//의료진_회원정보상세수정화면(기초)
	@RequestMapping("basicDetialModify")
	public String basicDetialModify(HttpServletRequest req, Model model) {
		logger.info("[url ==> basicDetialModify]C_con");
		
		service1.resultMemberInfo(req, model);
		service1.basicReault(req, model);
		return "doctor/mypage/customer/basicDetailModify";
	}
	
	//의료진_회원정보상세수정(기초)
	@RequestMapping("basicDetialModifyAction")
	public String basicDetialModifyAction(HttpServletRequest req, Model model) {
		logger.info("[url ==> basicDetialModify]C_con");
		
		service1.customerDetailBasicModify(req,model);
		return "doctor/mypage/customer/basicDetailModifyAction";
	}
	
	// 의료진_회원정보상세_운동
	@RequestMapping("customerDetail2")
	public String doctorCustomerDetail2(HttpServletRequest req, Model model) {
		logger.info("[url ==> customerDetail2]C_con");
		
		service.memberInfo(req, model); //leftbar에 자신이 진료하는 과목만
		//service.doctorMemberInfo(req, model);
		service1.resultMemberInfo(req, model);
		service1.getPhysicalResult(req, model);
		//service1.resultInfoList(req, model); //이전검사내역
		return "doctor/mypage/customer/infoDetail2";
	}
	
	//의료진_회원정보상세(심리)
	@RequestMapping("customerDetail3")
	public String doctorCustomerDetail3(HttpServletRequest req, Model model) {
		logger.info("[url ==> customerDetail3]C_con");
		
		service.memberInfo(req, model); //leftbar에 자신이 진료하는 과목만
		service1.resultMemberInfo(req, model);
		service1.surveyResult2(req,model);		//심리검사결과차트용
		service1.surveyResult(req,model);	   //심리검사결과
		service1.resultMentalList(req, model); //이전검사내역
		return "doctor/mypage/customer/infoDetail3";
	}
	
	//의료진_회원정보상세수정화면(심리)
	@RequestMapping("mentalDetialModify")
	public String mentalDetialModify(HttpServletRequest req, Model model) {
		logger.info("[url ==> mentalDetialModify]C_con");
		
		service1.resultMemberInfo(req, model);
		service1.surveyResult(req,model);
		//service1.mentalReault(req, model);
		return "doctor/mypage/customer/mentalDetailModify";
	}
	
	//의료진_회원정보상세수정(심리)
	@RequestMapping("mentalDetialModifyAction")
	public String mentalDetialModifyAction(HttpServletRequest req, Model model) {
		logger.info("[url ==> mentalDetialModify]C_con");
		
		service1.mentalResultInsert(req,model);
		return "doctor/mypage/customer/mentalDetailModifyAction";
	}
	
	// 의료진_회원정보상세_운동_수정페이지
	@RequestMapping("doctorCustomerDetail2Modify")
	public String doctorCustomerDetail2Modify(HttpServletRequest req, Model model) {
		
		// service1.customerDetailPhysicalModify(req, model);
		service1.resultMemberInfo(req, model);
		service.memberInfo(req, model); //leftbar에 자신이 진료하는 과목만
		return "doctor/mypage/customer/infoDetail2Modify";
	}
	
	// 의료진_회원정보상세_운동검사 정보 수정 액션
	@RequestMapping("customerDetailPhysicalModifyAction")
	public String customerDetailPhysicalModifyAction(HttpServletRequest req, Model model) {
		
		logger.info("[url ==> customerDetailPhysicalModifyAction]C_con");
		
		service1.customerDetailPhysicalModify(req, model);
		
		return "doctor/mypage/customer/physicalDetailModifyAction";
	}
}