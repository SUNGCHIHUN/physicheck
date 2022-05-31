package com.teampj.physicheck.vue.controller;

import java.util.List;

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
import com.teampj.physicheck.vue.service.PhysicalService;
import com.teampj.physicheck.vue.vo.ExerciseVO;
import com.teampj.physicheck.vue.vo.PhysicalMemberVO;

@RestController
@RequestMapping("/vue/doctor/")
public class DoctorPhysicalResultController {
	
	private static final Logger logger = LoggerFactory.getLogger(DoctorPhysicalResultController.class);
	
	@Autowired
	PhysicalService service;
	
	// 예약 목록
	@RequestMapping("reserveList")
	public List<ReserveDTO> reserveList() {
		logger.info("reserveList");

		return service.getVueReserveList();
	}

	// 회원정보 조회
	@RequestMapping("getMemberInfo/{id}")
	public PhysicalMemberVO getMemberInfo(@PathVariable("id") int reserveNo) {
		logger.info("getMemberInfo");
		
		return service.getVueMemberInfo(reserveNo);
	}
	
	// 운동검사 등록
	@RequestMapping("exerciseResultAction/{id}")
	public int exerciseResultAction(@PathVariable("id") int reserveNo, @RequestBody ExerciseVO vo, HttpServletRequest req) {
		logger.info("exerciseResultAction");

		return service.insertVueExerciseResult(reserveNo, vo, req);
	}
	
	//===============================[담당회원정보]====================================
	   //의료진_회원정보 페이지_운동
	   @RequestMapping("vueCustomerInfo2")
	   public List<ReserveDTO> doctorCustomerInfo(HttpServletRequest req, Model model) {
	      logger.info("[url ==> customerInfo]C_con");      
	      
	      return service.vueResultInfoList2(req, model);
	   }
	      
	   // 의료진_회원정보상세_운동
	   @RequestMapping("vueCustomerDetail2/{reserveNo}")
	   public List<Object> doctorCustomerDetail2(@PathVariable("reserveNo") int reserveNo, HttpServletRequest req, Model model) {
	      logger.info("[url ==> customerDetail2]C_con");
	      
	      return service.vueGetPhysicalResult2(req, model, reserveNo);
	   }
	
}