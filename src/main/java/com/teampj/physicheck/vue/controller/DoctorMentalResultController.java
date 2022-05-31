package com.teampj.physicheck.vue.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.teampj.physicheck.dto.MentalDTO;
import com.teampj.physicheck.dto.ReserveDTO;
import com.teampj.physicheck.vue.service.MentalService;
import com.teampj.physicheck.vue.vo.BasicVO;
import com.teampj.physicheck.vue.vo.MentalCommentVO;
import com.teampj.physicheck.vue.vo.MentalVO;

@RestController
@RequestMapping("/vue/doctor/")
public class DoctorMentalResultController {
	
	private static final Logger logger = LoggerFactory.getLogger(DoctorMentalResultController.class);
	
	@Autowired
	MentalService service;
	
	// 심리검사 리스트
	@RequestMapping("reserveList2")
	public List<ReserveDTO> reserveList() {
		logger.info("reserveList2");

		List<ReserveDTO> list = service.getVueReserveList2();
		System.out.println("list : " + list);
		return list;
	}
	
	// 회원정보 조회는 값은 따로 필요없으므로 -> DoctorBasicResultController - getMemberInfo1
	
	// 심리검사결과 조회
	@RequestMapping("getMentalInfo/{id}")
	public MentalVO getMentalInfo(@PathVariable("id") int reserveNo) {
		logger.info("getMentalInfo");
		return service.getMentalInfo(reserveNo);
	}
	
	// 심리검사 등록
	
	@RequestMapping("mentalResultUpdate/{id}")
	public int mentalResultInsert(@PathVariable("id") int reserveNo,@RequestBody MentalVO vo) {
		System.out.println(reserveNo);
		System.out.println(vo.toString());
		
		logger.info("mentalResultUpdate");
		return service.mentalResultInsert(reserveNo, vo);
	}
	
	// 회원정보 조회
	@RequestMapping("getMemberResultInfo2")
	public List<ReserveDTO> getMemberResultInfo2() {
		logger.info("getMemberResultInfo");
	  
			List<ReserveDTO> list = service.getMemberResultInfo2();
			System.out.println("list : " + list);
		return list; 
	} 
	
}