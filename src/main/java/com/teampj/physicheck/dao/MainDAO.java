package com.teampj.physicheck.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teampj.physicheck.dto.CustomerDTO;
import com.teampj.physicheck.dto.DietDTO;
import com.teampj.physicheck.dto.NoticeDTO;
import com.teampj.physicheck.dto.ReserveDTO;
import com.teampj.physicheck.dto.ReviewDTO;

@Mapper
public interface MainDAO {
	
	//로그인
	public String confirmIdPwd(Map<String, String> in);
	
	//회원정보
	public CustomerDTO getMemberInfo(String id);
	
	// 리뷰 리스트
	public List<ReviewDTO> mobileReviewList();
	
	// 공지사항 리스트
	public List<NoticeDTO> mobileNoticeList();
	
	// 다이어트 리스트
    public List<DietDTO> mobileDietList();
    
    // 예약 리스트
    public List<ReserveDTO> mobileReserveList(String id);
	
}
