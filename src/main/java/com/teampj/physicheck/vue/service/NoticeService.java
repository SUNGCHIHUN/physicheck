package com.teampj.physicheck.vue.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.teampj.physicheck.dto.NoticeDTO;
import com.teampj.physicheck.vue.dao.VueNoticeMapper;

@Service
public class NoticeService {
	
	@Autowired
	VueNoticeMapper dao;
	
	//공지사항 - 목록
	public List<NoticeDTO> noticeList() {
		System.out.println("A_service => noticeList");

		List<NoticeDTO> list = dao.noticeList();
		return list;
	}

	//공지사항 - 상세
	public NoticeDTO noticeDetail(int noticeNo) {
		System.out.println("A_service => noticeDetail");
		dao.plusReadCnt(noticeNo);
		return dao.noticeDetail(noticeNo);
	}
	
	//공지사항 - 수정 페이지
	public NoticeDTO noticeUpdate(int noticeNo) {
		System.out.println("A_service => noticeUpdate");
		return dao.noticeDetail(noticeNo);
	}

	//공지사항 - 수정처리
	public int noticeUpdateAction(NoticeDTO dto) {
		System.out.println("A_service => noticeUpdateAction");
		
		System.out.println(dto);
		return dao.noticeUpdateAction(dto);
	}
	

	// 공지사항 - 등록
	public int noticeInsert(NoticeDTO dto) {
		System.out.println("A_service => noticeInsert");

		return dao.noticeInsert(dto);
	}
	
	//공지사항 - 삭제
	public int noticeDelete(int noticeNo) {
		System.out.println("A_service => noticeDelete");
		
 		return dao.noticeDelete(noticeNo);
	}
	
	
	//공지사항 - 검색목록
	public List<NoticeDTO> noticeSearch() {
		System.out.println("A_service => noticeSearch");
		
		List<NoticeDTO> list = dao.noticeSearch();
		return list;
	}
}
