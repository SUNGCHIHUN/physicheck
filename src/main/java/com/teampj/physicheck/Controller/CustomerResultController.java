package com.teampj.physicheck.Controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teampj.physicheck.Service.CustomerResultService;
import com.teampj.physicheck.Service.DoctorService;
import com.teampj.physicheck.Service.TestService;

@RequestMapping("/customer/")
@Controller
public class CustomerResultController {

	@Autowired
	CustomerResultService service;
	
	@Autowired
	TestService service1;
	
	@Autowired
	DoctorService service2;
	
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerResultController.class);

	//기초검사결과 리스트
	@RequestMapping("basicResultList")
	public String basicResultList(HttpServletRequest req, Model model) {
		logger.info("[url ==> basicResultList]_controller");

		service.basicResultList(req, model);
		return "customer/result/basicResultList";
	}
	
	//기초검사결과 상세
	@RequestMapping("basicResult")
	public String basicResult(HttpServletRequest req, Model model) {
		logger.info("[url ==> basicResult]_controller");

		service2.resultMemberInfo(req, model);
		service2.basicReault(req, model);
		return "customer/result/basicResult";
	}
	
	//운동검사결과 상세
	@RequestMapping("physicalResult")
	public String physicalResult(HttpServletRequest req, Model model) {
		logger.info("[url ==> physicalResult.ct]_controller");
		service1.physicalResultAction(req, model);
		
		return "customer/result/physicalResult";
	}
	
	// 종합검사결과 상세
	@RequestMapping("totalResult")
	public String totalResult(HttpServletRequest req, Model model) {
		logger.info("[url ==> totalResult.ct]_controller");
		service2.resultMemberInfo(req, model);
		service.totalResult(req, model);
		
		return "customer/result/totalResult";
	}	
//------------------------------------------- Result
	
	// 운동검사 결과 리스트
	@RequestMapping("physicalResultList")
	public String physicalResultList(HttpServletRequest req, Model model) {
		logger.info("[url ==> physicalResultList.ct]_controller");
		service1.physicalResultList(req, model);
		
		return "customer/result/physicalResultList";
	}
	
	//심리검사결과 리스트
	@RequestMapping("mentalResultList")
	public String mentalResultList(HttpServletRequest req, Model model) {
		logger.info("[url ==> mentalResultList]_controller");

		service.mentalResultList(req, model);
		return "customer/result/mentalResultList";
	}
	
	//심리검사결과 상세
	@RequestMapping("mentalResult")
	public String mentalResult(HttpServletRequest req, Model model) {
		logger.info("[url ==> mentalResult]_controller");

		service2.resultMemberInfo(req, model);
		service2.surveyResult2(req,model);		//심리검사결과차트용
		service2.surveyResult(req,model);	   //심리검사결과
		return "customer/result/mentalResult";
	}

	// 종합검사결과 리스트
	@RequestMapping("totalResultList")
	public String totalResultList(HttpServletRequest req, Model model) {
		logger.info("[url ==> totalResultList]_controller");

		service.totalResultList(req, model);
		
		return "customer/result/totalResultList";
	}
}