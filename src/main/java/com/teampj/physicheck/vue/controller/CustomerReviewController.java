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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.teampj.physicheck.dto.ReviewDTO;
import com.teampj.physicheck.vue.service.ReviewService;

@RestController
@RequestMapping("/vue/customer/")
public class CustomerReviewController {

	@Autowired
	ReviewService service;

	private static final Logger logger = LoggerFactory.getLogger(CustomerReviewController.class);

	// 리뷰 목록
	@RequestMapping("reviewList")
	public List<ReviewDTO> reviewList() {
		logger.info("[url ==> reviewList]");
		
		return service.getVueReviewList();
	}

	// 리뷰 상세
	@ResponseBody	
	@RequestMapping("reviewDetail/{reviewNo}")
	public ReviewDTO reviewDetail(@PathVariable("reviewNo") int reviewNo) {
		logger.info("[url ==> reviewDetail]");
		
		return service.vueReviewDetail(reviewNo);
	}	
	
	// 리뷰 등록
	@ResponseBody
	@RequestMapping("reviewInsert")
	public int reviewInsert(@RequestBody ReviewDTO dto) {
		logger.info("[url ==> reviewInsert]");
		
		return service.vueReviewInsert(dto);
	}

	// 리뷰 수정
	@ResponseBody	
	@RequestMapping("reviewUpdate")
	public int reviewUpdate(@RequestBody ReviewDTO dto) {
		logger.info("[url ==> reviewUpdate]");
		
		return service.vueReviewUpdate(dto);
	}
		
	// 리뷰 삭제
	@ResponseBody	
	@RequestMapping("reviewDelete/{reviewNo}")
	public int reviewDelete(@PathVariable("reviewNo") int reviewNo) {
		logger.info("[url ==> reviewDelete]");
		
		return service.vueReviewDelete(reviewNo);
	}
	

}
