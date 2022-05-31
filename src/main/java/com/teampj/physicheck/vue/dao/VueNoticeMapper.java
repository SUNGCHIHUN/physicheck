package com.teampj.physicheck.vue.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teampj.physicheck.dto.NoticeDTO;

@Mapper
public interface VueNoticeMapper {
	
	//공지사항 - 조회수
	public int readCnt();
	
	//공지사항 - 조회수 증가
	public void plusReadCnt(int noticeNo);
	
	//공지사항 - 조회
	public List<NoticeDTO> noticeList();
	
	//공지사항 - 상세
	public NoticeDTO noticeDetail(int noticeNo);
	
	//공지사항 - 수정처리
	public int noticeUpdateAction(NoticeDTO dto);
	
	//공지사항 - 등록
	public int noticeInsert(NoticeDTO dto);

	//공지사항 - 삭제
	public int noticeDelete(int noticeNo);
	
	//공지사항 - 검색수
	public int searchCnt(String content);
	
	//공지사항 - 검색 목록
	public List<NoticeDTO> noticeSearch();
	
}