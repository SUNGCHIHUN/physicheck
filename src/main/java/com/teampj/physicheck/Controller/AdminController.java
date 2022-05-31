package com.teampj.physicheck.Controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teampj.physicheck.Service.AdminService;
import com.teampj.physicheck.es.service.ElasticService;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	AdminService service;
	
	@Autowired
	ElasticService elasticService;
	
	// 관리자 메인
	@RequestMapping("main")
	public String main(HttpServletRequest req, Model model) {
		logger.info("[url ==> main]");

		return "admin/common/main";
	}

	// ---------------------------- 의료진관리 --------------------------------
	// 의료진 관리 페이지 이동
	@RequestMapping("doctorList")
	public String doctorList(HttpServletRequest req, Model model) {
		logger.info("[url ==> doctorList]");
		
		service.getDoctorList(req, model);
		
		return "admin/doctor/doctorList";
	}
	
	// 의료진 등록 페이지 이동
	@RequestMapping("doctorRegistForm")
	public String doctorRegistForm(HttpServletRequest req, Model model) {
		logger.info("[url ==> doctorRegistForm]");
		
		return "admin/doctor/doctorRegistForm";
	}
	
	// 의료진 등록 처리
	@RequestMapping("doctorRegistAction")
	public String doctorRegistAction(HttpServletRequest req, Model model) {
		logger.info("[url ==> doctorRegistAction]");
		
		service.registDoctorAction(req, model);
		
		return "admin/doctor/doctorRegistAction";
	}
	
	// 의료진 수정 페이지 이동
	@RequestMapping("doctorModifyForm")
	public String doctorModifyForm(HttpServletRequest req, Model model) {
		logger.info("[url ==> doctorModifyForm]");
	
		service.getDoctorDetail(req, model);
		
		return "admin/doctor/doctorModifyForm";
	}
	
	// 의료진 수정 처리
	@RequestMapping("doctorModifyAction")
	public String doctorModifyAction(HttpServletRequest req, Model model) {
		logger.info("[url ==> doctorModifyAction]");
		
		service.modifyDoctorAction(req, model);
		
		return "admin/doctor/doctorModifyAction";
	}
	
	// 의료진 삭제 처리
	@RequestMapping("doctorDeleteAction")
	public String doctorDelete(HttpServletRequest req, Model model) {
		logger.info("[url ==> doctorDeleteAction]");
		
		service.deleteDoctorAction(req, model);
		
		return "admin/doctor/doctorDeleteAction";
	}
	
	// 의료진 검색 처리
	@RequestMapping("doctorSearch")
	public String doctorSearch(HttpServletRequest req, Model model) {
		logger.info("[url ==> doctorSearch]");
		
		return "admin/doctor/doctorList";
	}
	
	// 의료진 실적 페이지 이동
	@RequestMapping("doctorPerformance")
	public String doctorPerformance(HttpServletRequest req, Model model) {
		logger.info("[url ==> doctorPerformance]");

		service.getPerformance(req, model);
		
		return "admin/doctor/doctorPerformance";
	}
	
	// 의료진 실적 페이지 이동
	@RequestMapping("doctorPerformanceMonth")
	public String doctorPerformanceMonth(HttpServletRequest req, Model model) {
		logger.info("[url ==> doctorPerformanceMonth]");

		service.getPerformanceMonth(req, model);
		
		return "admin/doctor/doctorPerformanceMonth";
	}
	
	// 의료진 실적 페이지 이동
	@RequestMapping("doctorPerformanceDay")
	public String doctorPerformanceDay(HttpServletRequest req, Model model) {
		logger.info("[url ==> doctorPerformanceDay]");

		service.getPerformanceDay(req, model);
		
		return "admin/doctor/doctorPerformanceDay";
	}
	
	// ---------------------------- 회원 관리 --------------------------------
	// 회원 관리 페이지 이동
	@RequestMapping("memberList")
	public String memberList(HttpServletRequest req, Model model) {
		logger.info("[url ==> memberList]");
		
		service.getMemberList(req, model);
		
		return "admin/member/memberList";
	}
	
	// 회원 등록 처리
	@RequestMapping("memberRegistAction")
	public String memberRegistAction(HttpServletRequest req, Model model) {
		logger.info("[url ==> memberRegistAction]");
		return "admin/member/memberList";
	}
	
	// 회원 검색 처리
	@RequestMapping("memberSearch")
	public String memberSearch(HttpServletRequest req, Model model) {
		logger.info("[url ==> memberSearch]");
		
		return "admin/member/memberList";
	}
	
	// 회원 요청 리스트 페이지 이동
	@RequestMapping("memberRegistList")
	public String memberRegistList(HttpServletRequest req, Model model) {
		logger.info("[url ==> memberRegistList]");
		
		service.getMemberRegistList(req, model);
		
		return "admin/member/memberRegistList";
	}
	
	// 회원 요청 승인
	@RequestMapping("memberRegistConfirm")
	public String memberRegistConfirm(HttpServletRequest req, Model model) {
		logger.info("[url ==> memberRegistConfirm]");
		
		service.confirmRegist(req, model);
		
		return "admin/member/memberConfirmAction";
	}
	
	// 회원 삭제 처리
	@RequestMapping("memberDeleteAction")
	public String memberDeleteAction(HttpServletRequest req, Model model) {
		logger.info("[url ==> memberDeleteAction]");
		
		service.deleteMember(req, model);
		
		return "admin/member/memberDeleteAction";
	}
	
	// ---------------------------- 결산 --------------------------------
	// 총 결산 페이지 이동(기본 연도별)
	@RequestMapping("totalSales")
	public String totalSales(HttpServletRequest req, Model model) {
		logger.info("[url ==> totalSales]");
		
		elasticService.salesSave();
		
		service.getTotalSales(req, model);
		
		return "admin/sales/totalSales";
	}
	
	// 총 결산 페이지 불러오기
	@RequestMapping("totalSalesYear")
	public String testSalesYear(HttpServletRequest req, Model model) {
		logger.info("[url ==> testSalesYear]");
		
		service.getTotalSales(req, model);
		
		return "admin/sales/totalSales";
	}
	
	// 총 결산(월별)
	@RequestMapping("totalSalesMonth")
	public String totalSalesMonth(HttpServletRequest req, Model model) {
		logger.info("[url ==> totalSalesMonth]");
		
		service.getTotalSalesMonth(req, model);
		
		return "admin/sales/totalSalesMonth";
	}
	
	// 총 결산(일별)
	@RequestMapping("totalSalesDay")
	public String totalSalesDay(HttpServletRequest req, Model model) {
		logger.info("[url ==> totalSalesDay]");
		
		service.getTotalSalesDay(req, model);
		
		return "admin/sales/totalSalesDay";
	}
	
	// 검사항목별 결산 페이지 이동(기본 연도별)
	@RequestMapping("testSales")
	public String testSales(HttpServletRequest req, Model model) {
		logger.info("[url ==> testSales]");
		
		service.getTestSales(req, model);
		
		return "admin/sales/testSales";
	}
	
	// 검사항목별 결산(월별)
	@RequestMapping("testSalesMonth")
	public String testSalesMonth(HttpServletRequest req, Model model) {
		logger.info("[url ==> testSalesMonth]");
		
		service.getTestSalesMonth(req, model);
		
		return "admin/sales/testSalesMonth";
	}
	
	// 검사항복별 결산(일별)
	@RequestMapping("testSalesDay")
	public String testSalesDay(HttpServletRequest req, Model model) {
		logger.info("[url ==> testSalesDay]");
		
		service.getTestSalesDay(req, model);
		
		return "admin/sales/testSalesDay";
	}
}
