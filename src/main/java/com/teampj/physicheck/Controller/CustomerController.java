package com.teampj.physicheck.Controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teampj.physicheck.Service.CustomerService;
import com.teampj.physicheck.common.service.MemberService;


@RequestMapping("/customer/")
@Controller
public class CustomerController {

	@Autowired
	CustomerService service;

	@Autowired
	MemberService memberService;

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	//회원정보 상세
	@RequestMapping("memberInfo")
	public String memberInfo(HttpServletRequest req, Model model) {
		logger.info("[url ==> memberInfo]_controller");

		service.memberInfo(req, model);

		return "customer/memberInfo";
	}

	//회원정보 수정처리
	@RequestMapping("memberUpdateAction")
	public String memberUpdateAction(HttpServletRequest req, Model model) {
		logger.info("[url ==> memberUpdateAction]_controller");

		service.memberUpdateAction(req, model);

		return "common/login";
	}
	//회원정보 수정
	@RequestMapping("memberUpdate")
	public String memberUpdate(HttpServletRequest req, Model model) {
		logger.info("[url ==> memberUpdate]_controller");

		service.memberInfo(req, model);

		return "customer/memberUpdate";
	}
	
	//회원정보 탈퇴
	@RequestMapping("memberDelete")
	public String memberDelete(HttpServletRequest req, Model model) {
		logger.info("[url ==> memberDelete]_controller");
		service.memberDeleteAction(req, model);
		return "customer/memberDeleteAction";
	}
	
//------------------------------------------- CustomerInfo
	
	// 병원소개 > 오시는길
	@RequestMapping("comingWay")
	public String comingWay(HttpServletRequest req, Model model) {
		logger.info("[url ==> comingWay]_controller");

		return "customer/comingWay";
	}
	
	// 게시판
	// 게시판 리스트
	@RequestMapping("boardList")
	public String boardList(HttpServletRequest req, Model model) {
		logger.info("[url ==> boardList]_controller");

		service.noticeList(req, model);
		return "customer/board/boardList";
	}
	
	// 게시판 상세
	@RequestMapping("boardInfo")
	public String boardInfo(HttpServletRequest req, Model model) {
		logger.info("[url ==> boardInfo]_controller");

		service.noticeInfo(req, model);
		
		return "customer/board/boardInfo";
	}
		
	// 예약
	// 예약 리스트
	@RequestMapping("reserveList")
	public String reserveList(HttpServletRequest req, Model model) {
		logger.info("[url ==> reserveList]_controller");

		service.reserveList(req, model);
		
		return "customer/reserve/reserveList";
	}
	
	// 시간표 처리
	@RequestMapping("timeList")
	public String timeList( HttpServletRequest req, Model model) {
		logger.info("[url ==> timeList]_controller");
		
		
		service.timeList(req, model);
		
		return "customer/reserve/timeList";
	}
				
	// 예약하기 페이지
	@RequestMapping("reservePlay")
	public String reservePlay(HttpServletRequest req, Model model) {
		logger.info("[url ==> reservePlay]_controller");

		return "customer/reserve/reservePlay";
	}
	
	// 예약하기 버튼
	@RequestMapping("reserveAction")
	public String reserveAction(HttpServletRequest req, Model model) {
		logger.info("[url ==> reserveAction]_controller");

		service.reserveBtn(req, model); 
		
		return "customer/reserve/reservePlay";
	}
	
	// 예약변경
	@RequestMapping("reserveModify")
	public String reserveModify(HttpServletRequest req, Model model) {
		logger.info("[url ==> reserveModify]_controller");

		return "customer/reserve/reserveModify";
	}
		
	// 예약상세
	@RequestMapping("reserveInfo")
	public String reserveInfo(HttpServletRequest req, Model model) {
		logger.info("[url ==> reserveInfo]_controller");
		service.reserveInfo(req, model);
		
		return "customer/reserve/reserveInfo";
	}
	
	// 예약취소
	@RequestMapping("reserveCancelBtn")
	public String reserveCancelBtn(HttpServletRequest req, Model model) {
		logger.info("[url ==> reserveCancelBtn]_controller");
		service.reserveCancelBtn(req, model);
		service.reserveList(req, model);
		return "customer/reserve/reserveList";
	}
	
	// 리뷰	
	@RequestMapping("reviewList")
	public String reviewList(HttpServletRequest req, Model model) {
		logger.info("[url ==> reviewList]_controller");

		service.reviewList(req, model);
		return "customer/review/reviewList";
	}
	
	// 리뷰 등록 페이지
	@RequestMapping("reviewAdd")
	public String reviewAdd(HttpServletRequest req, Model model) {
		logger.info("[url ==> reviewAdd]_controller");
		
		service.reviewAddPage(req, model);
		
		return "customer/review/reviewAdd";
	}
	
	// 리뷰 등록 버튼
	@RequestMapping("reviewAddBtn")
	public String reviewAddBtn(HttpServletRequest req, Model model) {
		logger.info("[url ==> reviewAddBtn]_controller");
		
		service.reviewAdd(req, model);
		
		return "redirect:/customer/reviewList";
	}
		
	// 리뷰 상세
	@RequestMapping("reviewInfo")
	public String reviewInfo(HttpServletRequest req, Model model) {
		logger.info("[url ==> reviewInfo]_controller");

		service.reviewInfo(req, model);
		
		return "customer/review/reviewInfo";
	}

	// 리뷰 삭제
	@RequestMapping("reviewDelete")
	public String reviewDelete(HttpServletRequest req, Model model) {
		logger.info("[url ==> reviewDelete]_controller");

		service.reviewDelete(req, model);
		
		return "redirect:/customer/reviewList";
	}
	
	// 리뷰 수정 페이지	
	@RequestMapping("reviewModify")
	public String reviewModify(HttpServletRequest req, Model model) {
		logger.info("[url ==> reviewModify]_controller");

		service.reviewInfo(req, model);
		return "customer/review/reviewModify";
		
	}
	
	// 리뷰 수정 액션
	@RequestMapping("reviewModifyAction")
	public String reviewModifyAction(HttpServletRequest req, Model model) {
		logger.info("[url ==> reviewModifyAction]_controller");

		service.reviewModifyAction(req, model);
		
		return "redirect:/customer/reviewList";
		
	}
	
	// 리뷰검색 
	@RequestMapping("reviewSearch")
	public String reviewSearch(HttpServletRequest req, Model model) {
		logger.info("[url ==> reviewSearch]_controller");

		service.reviewSearchList(req, model);
		
		return "customer/review/reviewSearchList";
		
	}
	
	// kakao페이 결제 페이지
	@RequestMapping("reserveKakaopay")
	public String reserveKakaopay(HttpServletRequest req, Model model) {
		logger.info("[url ==> reserveKakaopay]_controller");
		
		return "customer/reserve/reserveKakaopay";
		
		
	}
	

	// kakao페이 액션 
	@RequestMapping("kakaoAction")
	public String kakaoAction(HttpServletRequest req, Model model) {
		logger.info("[url ==> kakaoAction]_controller");
		
		service.kakaoAction(req, model);
		
		return "redirect:/customer/reserveList";
		
	}
	
	// card 결제 페이지
	@RequestMapping("reserveCard")
	public String reserveCard(HttpServletRequest req, Model model) {
		logger.info("[url ==> reserveCard]_controller");
		
		return "customer/reserve/reserveCard";
		
		
	}
	
	// 카드 결제 액션 
	@RequestMapping("cardAction")
	public String cardAction(HttpServletRequest req, Model model) {
		logger.info("[url ==> cardAction]_controller");
		
		service.cardAction(req, model);
		
		return "redirect:/customer/reserveList";
		
	}
		
	// 직접 결제
	@RequestMapping("directPay")
	public String directPay(HttpServletRequest req, Model model) {
		logger.info("[url ==> directPay]_controller");
		
		service.directPay(req, model);
		
		return "redirect:/customer/reserveList";
		
	}

	
	// 환불 액션
	@RequestMapping("paidReturn")
	public String paidReturn(HttpServletRequest req, Model model) {
		logger.info("[url ==> paidReturn]_controller");
	
		service.paidReturn(req, model);
		return "redirect:/customer/reserveList";
	}
//------------------------------------------- Board



}
