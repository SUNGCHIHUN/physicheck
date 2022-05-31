package com.teampj.physicheck.Controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teampj.physicheck.Service.StaticService;

@Controller
@RequestMapping("/admin/")
public class StaticController {

	private static final Logger logger = LoggerFactory.getLogger(StaticController.class);
	
	@Autowired
	StaticService service;
	
// ---------------------------- 통계 --------------------------------
	// 통계 - 성별
	@RequestMapping("statics1")
	public String statics1(HttpServletRequest req, Model model) {
		logger.info("[url ==> statics1]");
		
		service.statics1(req, model);
		return "admin/sales/statics1";
	}
	// 통계 - 연령별
	@RequestMapping("statics2")
	public String statics2(HttpServletRequest req, Model model) {
		logger.info("[url ==> statics2]");
		
		service.statics2(req, model);
		return "admin/sales/statics2";
	}
	
}
