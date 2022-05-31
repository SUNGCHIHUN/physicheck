package com.teampj.physicheck.Controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teampj.physicheck.Service.BoardService;

@Controller
@RequestMapping("/admin/")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardService service;

	// ---------------------------- 공지사항  --------------------------------
	//관리자_공지사항
	@RequestMapping("notice")
	public String notice(HttpServletRequest req, Model model) {
		logger.info("[url ==> notice]");
		service.notice(req, model);
		return "admin/board/notice";
	}

	//관리자_공지사항 상세
	@RequestMapping("noticeDetail")
	public String noticeDetail(HttpServletRequest req, Model model) {
		logger.info("[url ==> noticeDetail]");
		service.noticeDetail(req, model);
		
		return "admin/board/noticeDetail";
	}
	
	//관리자_공지사항 수정페이지
	@RequestMapping("noticeEdit")
	public String noticeEdit(HttpServletRequest req, Model model) {
		logger.info("[url ==> noticeEdit]");
		
		service.noticeEdit(req, model);
		return "admin/board/noticeEdit";
	}
	
	//관리자_공지사항 수정 처리
	@RequestMapping("noticeEditAction")
	public void noticeEditAction(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException {
		logger.info("[url ==> noticeEditAction]");
		
		service.noticeEditAction(req, model);
		String viewPage = req.getContextPath() +"notice";
		res.sendRedirect(viewPage);
	}
	
	//관리자_공지사항 등록페이지
	@RequestMapping("noticeInsert")
	public String noticeInsert(HttpServletRequest req, Model model) {
		logger.info("[url ==> noticeInsert]");
		
		return "admin/board/noticeInsert";
	}
	
	//관리자_공지사항 등록 처리
	@RequestMapping("noticeInsertAction")
	public void noticeInsertAction(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException {
		logger.info("[url ==> noticeInsertAction]");
		System.out.println("[url ==> noticeInsertAction]");
		
		service.noticeInsert(req, model);
		String viewPage = req.getContextPath() +"notice";
		res.sendRedirect(viewPage);
	}
	
	//관리자_공지사항 삭제
	@RequestMapping("noticeDelete")
	public void noticeDelete(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException {
		logger.info("[url ==> noticeDelete]");
		
		service.noticeDelete(req, model);
		String viewPage = req.getContextPath() +"notice";
		res.sendRedirect(viewPage);
	}
	
	//관리자_공지사항 검색 리스트
	@RequestMapping("noticeSearch")
	public String noticeSearch(HttpServletRequest req, Model model) {
		logger.info("[url ==> noticeSearch]");
		service.noticeSearch(req, model);
		return "admin/board/noticeSearch";
	}

	// ---------------------------- 리뷰  --------------------------------
	//관리자_리뷰 페이지
	@RequestMapping("review")
	public String review(HttpServletRequest req, Model model) {
		logger.info("[url ==> review]");
		service.review(req, model);
		return "admin/board/review";
	}
	
	//관리자_리뷰 삭제
	@RequestMapping("reviewDelete")
	public void reviewDelete(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException {
		logger.info("[url ==> reviewDelete]");
		
		service.reviewDelete(req, model);
		String viewPage = req.getContextPath() +"review";
		res.sendRedirect(viewPage);
	}
	
	//관리자_리뷰 검색 리스트
	@RequestMapping("reviewSearch")
	public String reviewSearch(HttpServletRequest req, Model model) {
		logger.info("[url ==> reviewSearch]");
		service.reviewSearch(req, model);
		return "admin/board/reviewSearch";
	}

}
