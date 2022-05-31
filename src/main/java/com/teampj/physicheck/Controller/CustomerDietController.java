package com.teampj.physicheck.Controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.teampj.physicheck.Service.DietService;

// 식단 컨트롤러
@RequestMapping("/customer/")
@Controller
public class CustomerDietController {

	@Autowired
	private DietService service;

	private static final Logger logger = LoggerFactory.getLogger(DoctorInfoController.class);	
	
	// 식단 조회
	@RequestMapping("dietList")
	public String dietList(HttpServletRequest req, Model model) {
		
		service.getDietList(req, model);
		
		return "/customer/diet/dietList";
	}
	
	// 식단 상세조회
	@RequestMapping("dietDetail")
	public String dietDetail(HttpServletRequest req, Model model) {
		
		service.getDietDetail(req, model);
		
		return "/customer/diet/dietDetail";
	}

	// 의약품 리스트
	@RequestMapping("medicineList")
	public String medicine(HttpServletRequest req, Model model) {
		logger.info("[url ==> medicineList]_cont");

		service.getMedicineList(req, model);		
		return "/customer/diet/medicineList"; // cust는 양이 적어서 같은폴더에 둠
	}	
	
}