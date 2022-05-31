package com.teampj.physicheck.Controller;

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

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RequestMapping("/doctor/")
@Controller
public class DoctorScheduleController {
	
	@Autowired
	CustomerService service;
	
	@Autowired
	DoctorService service1;
	
	private static final Logger logger = LoggerFactory.getLogger(DoctorScheduleController.class);
	
	//===============================[일정관리]====================================
	//의료진_진료일정 페이지
	@RequestMapping("schedule")
	public String doctorSchedule(HttpServletRequest req, Model model) {
		logger.info("[url ==> schedule]C_con");
		
		service.memberInfo(req, model); //leftbar에 자신이 진료하는 과목만
		return "doctor/mypage/schedule/schedule";
	}
	
	//의료진_진료일정 불러오기
	@RequestMapping(value="scheduleList", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> doctorScheduleList(HttpServletRequest req, Model model) {
		logger.info("[url ==> scheduleList]C_con");
		
		List<Map<String, Object>> test = service1.schedule(req, model);;
		return test;
	}
	
}
