package com.teampj.physicheck.Controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.teampj.physicheck.Service.CustomerService;
import com.teampj.physicheck.Service.DietService;

// 식단 컨트롤러
@RequestMapping("/doctor/")
@Controller
public class DoctorDietController {

	@Autowired
	CustomerService service1;
	
	@Autowired
	private DietService service;

	private static final Logger logger = LoggerFactory.getLogger(DoctorInfoController.class);	
	
	// 식단 조회
	@RequestMapping("dietList")
	public String dietList(HttpServletRequest req, Model model) {
		
		service1.memberInfo(req, model); //leftbar에 자신이 진료하는 과목만
		service.getDietList(req, model);
		
		return "/doctor/diet/dietList";
	}
	
	// 식단 등록 화면 이동
	@RequestMapping("dietAddForm")
	public String dietAddForm(HttpServletRequest req, Model model) {
		
		service1.memberInfo(req, model); //leftbar에 자신이 진료하는 과목만
		return "/doctor/diet/dietAddForm";
	}
	
	// 식단 등록처리
	@RequestMapping("dietAddAction")
	public String dietAddAction(MultipartHttpServletRequest req, Model model) {
		
		service1.memberInfo(req, model); //leftbar에 자신이 진료하는 과목만
		service.dietAddAction(req, model);
		
		return "/doctor/diet/dietAddAction";
	}
	
	// 식단 삭제
	@RequestMapping("dietDeleteAction")
	public String dietDeleteAction(HttpServletRequest req, Model model) {
		
		service1.memberInfo(req, model); //leftbar에 자신이 진료하는 과목만
		service.dietDeleteAction(req, model);
		
		return "/doctor/diet/dietDeleteAction";
	}
	
	// 식단 상세조회
	@RequestMapping("dietDetail")
	public String dietDetail(HttpServletRequest req, Model model) {
		
		service1.memberInfo(req, model); //leftbar에 자신이 진료하는 과목만
		service.getDietDetail(req, model);
		
		return "/doctor/diet/dietDetail";
	}
	
	
	//---------------------------------------------------------------------
	
	// 의약품 목록
	@RequestMapping("medicList")
	public String medicList(HttpServletRequest req, Model model) {
		logger.info("[url ==> medicList]_controller");
		
		service1.memberInfo(req, model); //leftbar에 자신이 진료하는 과목만
		service.getMedicineList(req, model);
		
		return "/doctor/medicine/medicList";
	}	
	
	// 의약품 등록 화면 이동
	@RequestMapping("medicAddForm")
	public String medicAddForm(HttpServletRequest req, Model model) {
		logger.info("[url ==> medicAddForm]_controller");
		
		service1.memberInfo(req, model); //leftbar에 자신이 진료하는 과목만
		return "/doctor/medicine/medicAddForm";
	}
	
	// 의약품 등록처리
	@RequestMapping("medicAddAction")
	public String medicAddAction(MultipartHttpServletRequest req, Model model) {
		logger.info("[url ==> medicAddAction]_controller");		
		service1.memberInfo(req, model);
		
		logger.info("medicAddAction - memberInfo() out");
		service.medicAddAction(req, model);
		
		return "/doctor/medicine/medicAddAction";
	}

	
	// 의약품 수정 화면 이동
	@RequestMapping("getMedicUpdate")
	public String getMedicUpdate(HttpServletRequest req, Model model) {
		logger.info("[url ==> getMedicUpdate]_controller");
		
		service1.memberInfo(req, model);
		logger.info("getMedicUpdate - memberInfo() out");
		
		service.getMedicUpdate(req, model);
		
		return "/doctor/medicine/medicUpdateForm";
	}	
	
	
	// 의약품 수정처리
	@RequestMapping("setMedicUpdate")
	public String setMedicUpdate(MultipartHttpServletRequest req, Model model) {
		logger.info("[url ==> setMedicUpdate]_controller");	
		service.setMedicUpdate(req, model);
		
		return "/doctor/medicine/medicUpdateAction";
	}	
	
	
	// 의약품 삭제
	@RequestMapping("medicDeleteAction")
	public String medicDeleteAction(HttpServletRequest req, Model model) {
		logger.info("[url ==> medicDeleteAction]_controller");
		
		service1.memberInfo(req, model); //leftbar에 자신이 진료하는 과목만
		service.medicDeleteAction(req, model);
		
		return "/doctor/medicine/medicDeleteAction";
	}	
}