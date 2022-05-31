package com.teampj.physicheck.vue.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.teampj.physicheck.dto.NoticeDTO;
import com.teampj.physicheck.vue.service.NoticeService;

@RestController
@RequestMapping("/vue/notice/")
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	NoticeService service;
	
	//공지사항 목록
	@RequestMapping("noticeList")
	public List<NoticeDTO> noticeList() {
		logger.info("[url ==> noticeList]");

		return service.noticeList();
	}

	//공지사항 상세
	@ResponseBody
	@GetMapping("noticeDetail/{noticeNo}")
	public NoticeDTO noticeDetail(@PathVariable("noticeNo") int noticeNo) {
		logger.info("[url ==> noticeDetail]");

		return service.noticeDetail(noticeNo);
	}

	//관리자_공지사항 수정페이지
	@ResponseBody
	@GetMapping("noticeUpdate/{noticeNo}")
	public NoticeDTO noticeUpdate(@PathVariable("noticeNo") int noticeNo) {
		logger.info("[url ==> noticeUpdate]");
		
		return service.noticeUpdate(noticeNo);
	}
	//공지사항 수정 처리
	@ResponseBody
	@RequestMapping("noticeUpdateAction")
	public int noticeUpdateAction(@RequestBody NoticeDTO dto) {
		logger.info("[url ==> noticeUpdateAction]");

		return service.noticeUpdateAction(dto);
	}

	//공지사항 등록
	@ResponseBody
	@PostMapping("noticeInsert")
	public int noticeInsert(@RequestBody NoticeDTO dto) {
		logger.info("[url ==> noticeInsert]");

		return service.noticeInsert(dto);
	}

	//공지사항 삭제
	@ResponseBody
	@RequestMapping("noticeDelete/{noticeNo}")
	public int noticeDelete(@PathVariable("noticeNo") int noticeNo) {
		logger.info("[url ==> noticeDelete]");

		return service.noticeDelete(noticeNo);
	}
	
	//관리자_공지사항 검색 리스트
	@RequestMapping("noticeSearch")
	public List<NoticeDTO> noticeSearch() {
		logger.info("[url ==> noticeSearch]");
		
		return service.noticeSearch();
	}
}