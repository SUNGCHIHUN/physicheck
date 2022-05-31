package com.teampj.physicheck.vue.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teampj.physicheck.dto.ReviewDTO;
import com.teampj.physicheck.vue.dao.ReviewVueMapper;

@Service
public class ReviewService {

	@Autowired
	ReviewVueMapper dao;

	// 리뷰 목록
	public List<ReviewDTO> getVueReviewList(){
		System.out.println("ReviewService - getVueReviewList()");

		return dao.getVueReviewList();
	}	
	
    // 리뷰 상세
	public ReviewDTO vueReviewDetail(int reviewNo) {
		System.out.println("ReviewService - vueReviewDetail()");
		
		return dao.vueReviewDetail(reviewNo);
	}

	// 리뷰 등록
	public int vueReviewInsert(ReviewDTO dto) {
		System.out.println("ReviewService - vueReviewInsert()");
		
		
		
		return dao.vueReviewInsert(dto);
	}

	// 리뷰 수정
	public int vueReviewUpdate(ReviewDTO dto) {
		System.out.println("ReviewService - vueReviewUpdate()");
		
		return dao.vueReviewEdit(dto);
	}

	// 리뷰 삭제
	public int vueReviewDelete(int reviewNo) {
		System.out.println("ReviewService - vueReviewDelete()");

		return dao.vueReviewDelete(reviewNo);
	}
    
	
}
