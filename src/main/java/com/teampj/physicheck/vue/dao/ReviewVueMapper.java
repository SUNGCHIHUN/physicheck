package com.teampj.physicheck.vue.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.teampj.physicheck.dto.ReviewDTO;

@Mapper
public interface ReviewVueMapper {

    // 리뷰 갯수
    public int reviewCnt();

	// 조회수 증가
	public void addReadCnt(int reviewNo);
	
    // 리뷰 목록
	public List<ReviewDTO> getVueReviewList();

    // 리뷰 상세
    public ReviewDTO vueReviewDetail(int reviewNo);
	
	// 리뷰 등록
	public int vueReviewInsert(ReviewDTO dto);
	
	// 리뷰 수정
	public int vueReviewEdit(ReviewDTO dto);

	// 리뷰 삭제
	public int vueReviewDelete(int reviewNo);
	
}
