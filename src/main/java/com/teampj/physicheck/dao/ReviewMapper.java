package com.teampj.physicheck.dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teampj.physicheck.dto.ReviewDTO;


@Mapper
public interface ReviewMapper {
	
	//리뷰 - 리뷰수
	public int reviewCnt();
	
	//리뷰 - 조회
	public List<ReviewDTO> review(Map<String,Object>map);
	
	//리뷰 - 별점
	public int starPoint(ReviewDTO dto);

	//리뷰 - 삭제
	public int reviewDelete(int reviewNo);
	
	//리뷰 - 검색수
	public int searchCnt(String content);
	
	//리뷰 - 검색 목록
	public List<ReviewDTO> reviewSearch(Map<String,Object>map);

}
