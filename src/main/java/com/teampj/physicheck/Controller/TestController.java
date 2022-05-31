package com.teampj.physicheck.Controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teampj.physicheck.Service.DoctorService;
import com.teampj.physicheck.Service.TestService;


@RequestMapping("/customer/")
@Controller
public class TestController {

	@Autowired
	TestService service;
	
	@Autowired
	DoctorService service1;

	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@RequestMapping("mentalTest") // done
	public String mentalTest1(HttpServletRequest req, Model model) {
		logger.info("[url ==> mentalTest.ct]_controller");
		
		service.mental_Action(req,model); // reserveNo 들고 오는 서비스
		return "customer/mentaltest/mentaltest1";
	}	

	@RequestMapping("mental_1Action") // done
	public String mental_1Action(HttpServletRequest req, Model model) {
		logger.info("[url ==> mental_1Action.ct]_controller");
		
		service.mental_1Action(req, model);
		service.mentalInsertAction(req, model);
		
		return "customer/mentaltest/mentaltest2";
	}	
	
	@RequestMapping("mental_2Action") // done
	public String mental_2Action(HttpServletRequest req, Model model) {
		logger.info("[url ==> mental_2Action.ct]_controller");
		service.mental_2Action(req, model);
		
		return "customer/mentaltest/mentaltest3";
	}	
	
	@RequestMapping("mental_3Action") // done
	public String mental_3Action(HttpServletRequest req, Model model) {
		logger.info("[url ==> mental_3Action.ct]_controller");
		service.mental_3Action(req, model);

		return "customer/mentaltest/mentaltest4";
	}		
	
	@RequestMapping("mental_4Action")
	public String mental_4Action(HttpServletRequest req, Model model) {
		logger.info("[url ==> mental_4Action.ct]_controller");
		service.mental_4Action(req, model);
		
		return "common/main";
	}
}