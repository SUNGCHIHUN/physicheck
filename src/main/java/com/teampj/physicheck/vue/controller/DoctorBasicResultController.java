package com.teampj.physicheck.vue.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.teampj.physicheck.dto.ReserveDTO;
import com.teampj.physicheck.vue.service.BasicService;
import com.teampj.physicheck.vue.vo.BasicMemberVO;
import com.teampj.physicheck.vue.vo.BasicVO;
import com.teampj.physicheck.vue.vo.ExerciseVO;
import com.teampj.physicheck.vue.vo.PhysicalMemberVO;

@RestController
@RequestMapping("/vue/doctor/")
public class DoctorBasicResultController {
	
	private static final Logger logger = LoggerFactory.getLogger(DoctorBasicResultController.class);
	
	@Autowired
	BasicService service;
	
	// 기초검사 리스트
	@RequestMapping("reserveList1")
	public List<ReserveDTO> reserveList1() {
		logger.info("reserveList1");

		List<ReserveDTO> list = service.getVueReserveList1();
		System.out.println("list : " + list);
		return list;
	}
	
	// 회원정보 조회
	@RequestMapping("getMemberInfo1/{id}")
	public BasicMemberVO getMemberInfo1(@PathVariable("id") int reserveNo) {
		logger.info("getMemberInfo1");
  
		return service.getVueMemberInfo1(reserveNo); 
	}
	 
	// 기초검사 등록
	@RequestMapping("basicReusltInsert/{id}")
	public int basicResultInsert(@PathVariable("id") int reserveNo, @RequestBody BasicVO vo, HttpServletRequest req) {
		logger.info("basicResultInsert");

		return service.insertVueBasicResult(reserveNo, vo, req);
	}
	
	// 회원정보 조회
	@RequestMapping("getMemberResultInfo")
	public List<ReserveDTO> getMemberResultInfo() {
		logger.info("getMemberResultInfo");
  
		List<ReserveDTO> list = service.getMemberResultInfo();
		System.out.println("list : " + list);
		return list; 
	}
	
	// 기초검사 결과 조회
	@RequestMapping("basicCustomerResult/{id}")
	public List<Object> basicCustomerResult(@PathVariable("id") int reserveNo, HttpServletRequest req, Model model) {
		logger.info("basicCustomerResult");
  
		return service.basicCustomerResult(reserveNo, req, model); 
	}
	
}