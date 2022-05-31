package com.teampj.physicheck.common.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teampj.physicheck.Service.CustomerService;
import com.teampj.physicheck.common.dto.JoinRequest;
import com.teampj.physicheck.common.dto.LoginRequest;
import com.teampj.physicheck.common.service.MemberService;

@Controller
public class CommonController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	CustomerService customerService;

	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

	@RequestMapping("main")
	public String main(HttpServletRequest req, Model model) {
		logger.info("[url ==> main]com_controller");

		return "common/main";
	}

	@RequestMapping("login")
	public String login(HttpServletRequest req, Model model) {
		logger.info("[url ==> login]com_controller");

		return "common/login";
	}

	@RequestMapping("join")
	public String join(HttpServletRequest req, Model model) {
		logger.info("[url ==> join]com_controller");

		return "common/join";
	}

	@PostMapping("joinAction")
	public String joinAction(JoinRequest request, Model model) {
		logger.info("[url ==> joinAction]com_controller");

		boolean success = memberService.save(request);

		model.addAttribute("result", success);

		return "common/login";
	}

	@RequestMapping("confirmIdAction")
	public String confirmIdAction(HttpServletRequest req, Model model) {
		logger.info("[url ==> confirmIdAction]com_controller");

		memberService.confirmIdAction(req, model);

		return "common/confirmIdAction";
	}

	//기초검사 안내
	@RequestMapping("basicCheckup")
	public String basicCheckup(HttpServletRequest req, Model model) {
		logger.info("[url ==> basicCheckup]com_controller");

		return "customer/testGuide/basicCheckup";
	}

	//운동검사 안내
	@RequestMapping("physicalCheckup")
	public String physicalCheckup(HttpServletRequest req, Model model) {
		logger.info("[url ==> physicalCheckup]com_controller");

		return "customer/testGuide/physicalCheckup";
	}

	//심리검사 안내
	@RequestMapping("mentalCheckup")
	public String mentalCheckup(HttpServletRequest req, Model model) {
		logger.info("[url ==> mentalCheckup]com_controller");

		return "customer/testGuide/mentalCheckup";
	}

	// 병원소개 > 오시는길
	@RequestMapping("comingWay")
	public String comingWay(HttpServletRequest req, Model model) {
		logger.info("[url ==> comingWay]com_controller");

		return "customer/comingWay";
	}

	// 공지사항
	// 공지사항 리스트
	@RequestMapping("boardList")
	public String boardList(HttpServletRequest req, Model model) {
		logger.info("[url ==> boardList]com_controller");

		customerService.noticeList(req, model);
		
		return "customer/board/boardList";
	}

	// 공지사항 상세
	@RequestMapping("boardInfo")
	public String boardInfo(HttpServletRequest req, Model model) {
		logger.info("[url ==> boardInfo]com_controller");
		
		customerService.noticeInfo(req, model);
		return "customer/board/boardInfo";
	}
	
	// 공지사항 검색 리스트
	@RequestMapping("noticeSearch")
	public String noticeSearch(HttpServletRequest req, Model model) {
		logger.info("[url ==> noticeSearch]com_controller");
		
		customerService.noticeSearch(req, model);
		return "customer/board/boardSearchList";
	}
	
	// 편의사항
	@RequestMapping("amenity")
	public String amenity(HttpServletRequest req, Model model) {
		logger.info("[url ==> amenity]com_controller");
		
		return "customer/amenity";
	}

	@ResponseBody
	@PostMapping("vueLogin")
	public Map<String, Object> vueLogin(@RequestBody LoginRequest req) {
		logger.info("[url ==> vueLogin]com_controller");
		return memberService.vueLogin(req);
	}
}
