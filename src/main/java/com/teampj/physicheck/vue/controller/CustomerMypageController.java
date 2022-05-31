package com.teampj.physicheck.vue.controller;

import com.teampj.physicheck.common.dto.JoinRequest;
import com.teampj.physicheck.common.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.teampj.physicheck.dto.MemberDTO;
import com.teampj.physicheck.vue.service.MypageService;

@RestController
@RequestMapping("/vue/customer/")
public class CustomerMypageController {
	
	@Autowired
	MypageService service;

	@Autowired
	MemberService memberService;

	private static final Logger logger = LoggerFactory.getLogger(CustomerMypageController.class);

	// 마이페이지 조회
	@RequestMapping("getMemberInfo/{id}")
	public MemberDTO getMemberInfo(@PathVariable("id") String id) {
		logger.info("[url ==> getMemberInfo]");
		System.out.println("id : " + id);
		
		return service.vueGetMemberInfo(id);
	}

	// 마이페이지 수정
	@ResponseBody	
	@RequestMapping("setMemberInfo/{id}")
	public int setMemberInfo(@RequestBody MemberDTO dto) {
		logger.info("[url ==> setMemberInfo]");
		
		return service.vueSetMemberInfo(dto);
	}
		
	// 마이페이지 탈퇴
	@ResponseBody	
	@RequestMapping("memberDelete/{id}")
	public int memberDelete(@PathVariable("id") String id) {
		logger.info("[url ==> memberDelete]");
		
		return service.vueMemberDelete(id);
	}

	@ResponseBody
	@RequestMapping("join")
	public boolean vueJoin(@RequestBody JoinRequest request) {
		logger.info("[url ==> vueJoin]com_controller");

		return memberService.save(request);
	}
	
}
