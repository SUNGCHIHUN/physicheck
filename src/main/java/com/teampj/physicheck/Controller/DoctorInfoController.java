package com.teampj.physicheck.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teampj.physicheck.Service.CustomerService;
import com.teampj.physicheck.Service.DoctorService;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RequestMapping("/doctor/")
@Controller
public class DoctorInfoController {
	
	@Autowired
	CustomerService service;
	
	@Autowired
	DoctorService service1;
	
	private static final Logger logger = LoggerFactory.getLogger(DoctorInfoController.class);
	
	//메인
	@RequestMapping("main")
	public String doctorMain(HttpServletRequest req, Model model) {
		logger.info("[url ==> doctorMain]C_con");
		
		service.memberInfo(req, model); //leftbar에 자신이 진료하는 과목만
		return "doctor/common/main";
	}
	
	//===============================[개인정보수정]====================================
	//의료진정보 수정페이지
	@RequestMapping("info")
	public String doctorInfo(HttpServletRequest req, Model model) {
		logger.info("[url ==> doctorInfo]C_con");
		
		service.memberInfo(req, model);
		return "doctor/mypage/info/myInfo";
	}
	
	//의료진정보 수정처리
	@RequestMapping("infoUpdate")
	public String infoUpdate(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException {
		logger.info("[url ==> infoUpdate]C_con");
		
		service1.memberInfoUpdate(req, model);
		return "doctor/mypage/info/myInfoAction";
	}
}
