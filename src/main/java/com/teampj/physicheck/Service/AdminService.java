package com.teampj.physicheck.Service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.teampj.physicheck.dao.AdminInfoMapper;
import com.teampj.physicheck.dto.DoctorDTO;
import com.teampj.physicheck.dto.MemberDTO;
import com.teampj.physicheck.dto.PerformanceDTO;
import com.teampj.physicheck.dto.Sales2DTO;
import com.teampj.physicheck.dto.SalesDTO;
import com.teampj.physicheck.util.Paging;

@Service
public class AdminService {

	@Autowired
	AdminInfoMapper dao;
	
	@Autowired
	PasswordEncoder passwordEncoder;

	// ------------------------ 회원 관리 ---------------------------
	
	// 회원 리스트 조회
	public void getMemberList(HttpServletRequest req, Model model) {
		System.out.println("A_service => getMemberList");

		// 페이징처리 --------------------------------------
		String pageNum = req.getParameter("pageNum");
		Paging paging = new Paging(pageNum);
		int total = dao.getMemberTotal(req.getParameter("keyword"));
		paging.setTotalCount(total);
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		// ----------------------------------------------
		
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", req.getParameter("keyword"));

		// dao에서 회원리스트 조회
		List<MemberDTO> mlist = dao.getMemberList(map);
		System.out.println("mlist : " + mlist);
		
		model.addAttribute("mlist", mlist);
		model.addAttribute("paging", paging);
	}
	
	// 회원 요청 리스트 조회
	public void getMemberRegistList(HttpServletRequest req, Model model) {
		System.out.println("A_service => getMemberRegistList");

		// 페이징처리 --------------------------------------
		String pageNum = req.getParameter("pageNum");
		Paging paging = new Paging(pageNum);
		int total = dao.getMemberTotal(req.getParameter("keyword"));
		paging.setTotalCount(total);
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		// ----------------------------------------------
		
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", req.getParameter("keyword"));
		
		// dao에서 회원리스트 조회
		List<MemberDTO> mlist = dao.getMemberList(map);
		System.out.println("mlist : " + mlist);
		
		model.addAttribute("mlist", mlist);
		model.addAttribute("paging", paging);
	}
		
	// 회원 요청 승인
	public void confirmRegist(HttpServletRequest req, Model model) {
		System.out.println("A_service => confirmRegist");

		// 페이지 번호를
		String pageNum = req.getParameter("pageNum");
		
		// 회원번호를 받아옵니다.
		String memberArr = req.getParameter("memberArr");
		String[] data = memberArr.split(",");
		
		// dao에서 회원 승인처리
		int updateResult = 0;
		for (String no : data) {
			System.out.println("no : " + no);
			updateResult += dao.confirmRegist(Integer.parseInt(no));
		}
		
		System.out.println("updateResult : " + updateResult);
		
		model.addAttribute("updateResult", updateResult);
		model.addAttribute("pageNum", pageNum);
	}
	
	// 회원 삭제 처리
	public void deleteMember(HttpServletRequest req, Model model) {
		System.out.println("A_service => deleteMember");
		
		// 삭제할 회원의 번호를 가져온다.
		String memberArr = req.getParameter("memberArr");
		String[] data = memberArr.split(",");
		
		// 선택한 회원 수 만큼 삭제 표시 처리
		int updateResult = 0;
		for (String no : data) {
			updateResult += dao.deleteDoctor(Integer.parseInt(no));
		}
		
		System.out.println("updateResult : " + updateResult);
		
		// 결과값 전달
		model.addAttribute("updateResult", updateResult);
		
	}
	
	// ------------------------ 의료진 관리 --------------------------
	
	// 의료진 조회
	public void getDoctorList(HttpServletRequest req, Model model) {
		System.out.println("A_service => getDoctorList");
		
		// 페이징처리 --------------------------------------
		String pageNum = req.getParameter("pageNum");
		Paging paging = new Paging(pageNum);
		int total = dao.getDoctorTotal(req.getParameter("keyword"));
		paging.setTotalCount(total);
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		// ----------------------------------------------
		
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", req.getParameter("keyword"));
		
		// dao에서 의료진 리스트 조회
		List<DoctorDTO> dlist = dao.getDoctorList(map);
		System.out.println("dlist : " + dlist);
		
		// 결과값 전달
		model.addAttribute("dlist", dlist);
		model.addAttribute("paging", paging);
	}
	
	// 의료진 등록 처리
	public void registDoctorAction(HttpServletRequest req, Model model) {
		System.out.println("A_service => registDoctor");
		
		// 입력받은 값들을 dto에 저장
		DoctorDTO dto = new DoctorDTO();
		
		// 사번 생성
		// 현재날짜 구하기
		LocalDate now = LocalDate.now();
		// 날짜 형식
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		// 날짜 형식에 맞게 변환
		String formatedNow = now.format(formatter);
		
		// 날짜 뒤에 회원수 값 추가
		String id = formatedNow + dao.getDoctorTotal("");
		dto.setId(id);
		
		// 비밀번호 인코딩
		String rawPassword = passwordEncoder.encode((req.getParameter("password")));
		dto.setPassword(rawPassword);
		
		dto.setName(req.getParameter("name"));
		dto.setExamination(req.getParameter("examination"));
		dto.setGender(req.getParameter("gender"));
		dto.setJumin1(Integer.parseInt(req.getParameter("jumin1")));
		dto.setJumin2(Integer.parseInt(req.getParameter("jumin2")));
		dto.setTel(req.getParameter("tel"));
		
		String email = req.getParameter("email1") + "@" + req.getParameter("email2");
		dto.setEmail(email);

		// 주소
		String address = req.getParameter("address");
		String detailAddress = req.getParameter("detailAddress");
		String extraAddress = req.getParameter("extraAddress");
		String data = address + " " + detailAddress + " " + extraAddress;
		
		dto.setAddress(data);
		dto.setAuthority("ROLE_DOCTOR");
		dto.setAge(age(req.getParameter("jumin1"), req.getParameter("jumin2")));
		System.out.println("dto.getAge() : " + dto.getAge());
		
		int insertResult = dao.registDoctor(dto);
		System.out.println("insertResult : " + insertResult);
		
		// 결과값 전달
		model.addAttribute("insertResult", insertResult);
	}
		
	// 의료진 데이터 조회
	public void getDoctorDetail(HttpServletRequest req, Model model) {
		System.out.println("A_service => getDoctorDetail");
		
		// 의사번호 가져오기
		String doctorNo = req.getParameter("doctorNo");
		
		// 해당 의료진 데이터 가져오기
		DoctorDTO dto = dao.getDoctorDetail(Integer.parseInt(doctorNo));
		
		// 결과값 전달
		model.addAttribute("doctor", dto);
	}
	
	// 의료진 수정 처리
	public void modifyDoctorAction(HttpServletRequest req, Model model) {
		System.out.println("A_service => modifyDoctor");

		// 페이지번호
		String pageNum = req.getParameter("pageNum");
		
		// 입력받은 값들을 dto에 저장
		DoctorDTO dto = new DoctorDTO();
		
		int doctorNo = Integer.parseInt(req.getParameter("doctorNo")); 
		dto.setMemberNo(doctorNo);
		dto.setExamination(req.getParameter("examination"));
		
		int updateResult = dao.modifyExamination(dto);
		System.out.println("updateResult : " + updateResult);
		
		// 결과값 전달
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("doctorNo", doctorNo);
		model.addAttribute("updateResult", updateResult);
	}
	
	// 의료진 삭제
	public void deleteDoctorAction(HttpServletRequest req, Model model) {
		System.out.println("A_service => deleteDoctor");
		
		// 화면에서 값을 받아오기
		String pageNum = req.getParameter("pageNum");
		String doctorArr = req.getParameter("doctorArr");
		String[] data = doctorArr.split(",");
		
		// 의료진 삭제 처리
		int updateResult = 0;
		for (String no : data) {
			updateResult += dao.deleteMember(Integer.parseInt(no));
		}
		System.out.println("updateResult : " + updateResult);
		
		// 결과값 전달
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("updateResult", updateResult);
	}
	
	// 의료진 실적 조회(연도별)
	public void getPerformance(HttpServletRequest req, Model model) {
		System.out.println("A_service => getPerformance");
		
		// 전체 연도 구하기
		List<Integer> years = new ArrayList<>();
		List<PerformanceDTO> list = dao.getPerformance();
		
		for (int i=0; i<list.size() - 1; i++) {
			if (String.valueOf(list.get(i).getPerformanceYear()) == null) break;
			
			if (list.get(i).getPerformanceYear() != list.get(i+1).getPerformanceYear())
				years.add(list.get(i).getPerformanceYear());
		}
		
		int year = 0;
		if (req.getParameter("year") != null)
			year = Integer.parseInt(req.getParameter("year"));
		else
			year = years.get(0);
		
		List<PerformanceDTO> pylist = dao.getPerformanceYear(year);
		
		// 결과값 전달
		model.addAttribute("years", years);
		model.addAttribute("pylist", pylist);
	}
	
	// 의료진 실적 조회(월별)
	public void getPerformanceMonth(HttpServletRequest req, Model model) {
		System.out.println("A_service => getPerformanceMonth");
	
		// 전체 연도 구하기
		List<Integer> years = new ArrayList<>();
		List<PerformanceDTO> list = dao.getPerformance();
		
		for (int i=0; i<list.size() - 1; i++) {
			if (String.valueOf(list.get(i).getPerformanceYear()) == null) break;
			
			if (list.get(i).getPerformanceYear() != list.get(i+1).getPerformanceYear())
				years.add(list.get(i).getPerformanceYear());
		}
		
		int year = 0;
		if (req.getParameter("year") != null)
			year = Integer.parseInt(req.getParameter("year"));
		else
			year = years.get(0);
		
		// 월별 실적 조회
		List<PerformanceDTO> pmlist = dao.getPerformanceMonth(year);
		
		// 결과값 전달
		model.addAttribute("years", years);
		model.addAttribute("pmlist", pmlist);
	}
	
	// 의료진 실적 조회(일별)
	public void getPerformanceDay(HttpServletRequest req, Model model) {
		System.out.println("A_service => getPerformanceDay");
		
		// 전체 연도 구하기
		List<Integer> years = new ArrayList<>();
		List<PerformanceDTO> list = dao.getPerformance();
		
		for (int i=0; i<list.size() - 1; i++) {
			if (String.valueOf(list.get(i).getPerformanceYear()) == null) break;
			
			if (list.get(i).getPerformanceYear() != list.get(i+1).getPerformanceYear())
				years.add(list.get(i).getPerformanceYear());
		}
		
		int year = 0;
		if (req.getParameter("year") != null)
			year = Integer.parseInt(req.getParameter("year"));
		else
			year = years.get(0);
		
		// 전체 월 구하기
		List<Integer> months = new ArrayList<>();
		List<PerformanceDTO> list2 = dao.getPerformanceMonth(year);
		
		if (list2.size() == 1)
			months.add(list2.get(0).getPerformanceMonth());
		else {
			
			months.add(list2.get(0).getPerformanceMonth());
			
			for (int j=0; j<list2.size() - 1; j++) {
				System.out.println("list2.get : " + list2.get(j));
				if (list2.get(j).getPerformanceMonth() != list2.get(j+1).getPerformanceMonth())
					months.add(list2.get(j+1).getPerformanceMonth());
			}
		}
		
		// 기본 월 설정
		int month = 0;
		if (req.getParameter("month") != null)
			month = Integer.parseInt(req.getParameter("month"));
		else
			month = months.get(0);
		
		// 월별 총 결산 조회
		Map<String, Object> map = new HashMap<>();
		map.put("year", year);
		map.put("month", month);
		
		List<PerformanceDTO> pdlist = dao.getPerformanceDay(map);

		System.out.println("years : " + years);
		System.out.println("months : " + months);
		System.out.println("pdlist : " + pdlist);
		
		// 결과값 전달
		model.addAttribute("years", years);
		model.addAttribute("months", months);
		model.addAttribute("pdlist", pdlist);
	}
	
	// ------------------------- 결산 ------------------------------
	
	// -- 총 결산 ---
	// 연도별 조회
	public void getTotalSales(HttpServletRequest req, Model model) {
		System.out.println("A_service => getTotalSales");
		
		// 연도별 총 결산 조회
		List<SalesDTO> ytslist = dao.getTotalSales();
		System.out.println("ytslist : " + ytslist);
		// 결과값 전달
		model.addAttribute("ytslist", ytslist);
	}
	
	// 월별 조회
	public void getTotalSalesMonth(HttpServletRequest req, Model model) {
		System.out.println("A_service => getTotalSalesMonth");
	
		int year = Integer.parseInt(req.getParameter("year"));
		
		// 특정 월별 총 결산 조회
		List<SalesDTO> mtslist = dao.getTotalSalesMonth(year);
		System.out.println("mtslist : " + mtslist);
		
		// 전체 연도 구하기
		List<Integer> years = new ArrayList<>();
		List<SalesDTO> list = dao.getTotalSales();

		for (int i=0; i<list.size() - 1; i++) {
			if (String.valueOf(list.get(i).getPaymentYear()) == null) break;
			
			if (list.get(i).getPaymentYear() != list.get(i+1).getPaymentYear())
				years.add(list.get(i).getPaymentYear());
		}
		
		// 결과값 전달
		model.addAttribute("years", years);
		model.addAttribute("mtslist", mtslist);
	}
	
	// 일별 조회
	public void getTotalSalesDay(HttpServletRequest req, Model model) {
		System.out.println("A_service => getTotalSalesDay");

		int year = Integer.parseInt(req.getParameter("year"));
		
		// 전체 연도 구하기
		List<Integer> years = new ArrayList<>();
		List<SalesDTO> list = dao.getTotalSales();

		for (int i=0; i<list.size() - 1; i++) {
			if (String.valueOf(list.get(i).getPaymentYear()) == null) break;
			
			if (list.get(i).getPaymentYear() != list.get(i+1).getPaymentYear())
				years.add(list.get(i).getPaymentYear());
		}	
		
		// 전체 월 구하기
		List<Integer> months = new ArrayList<>();
		List<SalesDTO> list2 = dao.getTotalSalesMonth(year);
		
		for (int j=0; j<list2.size() - 1; j++) {
			// 첫번쨰 등장하는 월 저장
			if (j == 0) {
				months.add(list2.get(j).getPaymentMonth());
			}

			// 현재 월과 다음 월이 다른 경우 다음 월 저장
			if (list2.get(j).getPaymentMonth() != list2.get(j+1).getPaymentMonth()) {
				months.add(list2.get(j+1).getPaymentMonth());	
			}
		}
		
		// 기본 월 설정
		int month = 0;
		if (req.getParameter("month") != null)
			month = Integer.parseInt(req.getParameter("month"));
		else
			month = months.get(0);
			
		// 월별 총 결산 조회
		Map<String, Object> map = new HashMap<>();
		map.put("year", year);
		map.put("month", month);
		
		List<SalesDTO> dtslist = dao.getTotalSalesDay(map);
		System.out.println("dtslist : " + dtslist);
		
		// 결과값 전달
		model.addAttribute("years", years);
		model.addAttribute("months", months);
		model.addAttribute("dtslist", dtslist);
	}
	
	// -- 검사항목별 결산
	// 연도별 조회
	public void getTestSales(HttpServletRequest req, Model model) {
		System.out.println("A_service => getTestSales");
	
		// 월별 총 결산 조회
		List<Sales2DTO> ytslist = dao.getTestSales();
		System.out.println("ytslist : " + ytslist);
		// 결과값 전달
		model.addAttribute("ytslist", ytslist);
	}
	
	// 월별 조회
	public void getTestSalesMonth(HttpServletRequest req, Model model) {
		System.out.println("A_service => getTestSalesDay");
	
		int year = Integer.parseInt(req.getParameter("year"));
		
		// 특정 월별 총 결산 조회
		List<Sales2DTO> mtslist = dao.getTestSalesMonth(year);
		System.out.println("mtslist : " + mtslist);
		
		// 전체 연도 구하기
		List<Integer> years = new ArrayList<>();
		List<Sales2DTO> list = dao.getTestSales();

		for (int i=0; i<list.size() - 1; i++) {
			if (String.valueOf(list.get(i).getPaymentYear()) == null) break;
			
			if (list.get(i).getPaymentYear() != list.get(i+1).getPaymentYear())
				years.add(list.get(i).getPaymentYear());
		}
		
		// 결과값 전달
		model.addAttribute("years", years);
		model.addAttribute("mtslist", mtslist);
		
	}
	
	// 일별 조회
	public void getTestSalesDay(HttpServletRequest req, Model model) {
		System.out.println("A_service => getTestSalesDay");
		
		int year = Integer.parseInt(req.getParameter("year"));
		
		// 전체 연도 구하기
		List<Integer> years = new ArrayList<>();
		List<Sales2DTO> list = dao.getTestSales();

		// 존재하는 연도, 월 구하기
		// 전체 연도 구하기
		for (int i=0; i<list.size() - 1; i++) {
			if (String.valueOf(list.get(i).getPaymentYear()) == null) break;
			
			if (list.get(i).getPaymentYear() != list.get(i+1).getPaymentYear())
				years.add(list.get(i).getPaymentYear());
		}
		
		// 전체 월 구하기
		List<Integer> months = new ArrayList<>();
		List<Sales2DTO> list2 = dao.getTestSalesMonth(year);

		System.out.println("list2.size() : " + list2.size());
		
		for (int j=0; j<list2.size() - 1; j++) {
			
			// 첫번쨰 등장하는 월 저장
			if (j == 0) {
				System.out.println("첫번쨰 월 저장");
				months.add(list2.get(j).getPaymentMonth());
			}
			
			// 마지막 행인 경우
			if (j == list2.size() - 1) {
				// 이전 월과 현재 월이 다른 경우 현재 월 저장
				if (list2.get(j-1).getPaymentMonth() != list2.get(j).getPaymentMonth()) {
					System.out.println("마지막 행이고, 날짜 바뀜");
					months.add(list2.get(j).getPaymentMonth());	
				}
				break;
				
			} else {
		    	// 현재 월과 다음 월이 다른 경우 다음 월 저장
				if (list2.get(j).getPaymentMonth() != list2.get(j+1).getPaymentMonth()) {
					System.out.println("날짜 바뀜 : " + list2.get(j).getPaymentMonth() + " -> " + list2.get(j+1).getPaymentMonth());
					months.add(list2.get(j+1).getPaymentMonth());	
				}
		    }
		}
		
		// 기본 월 설정
		int month = 0;
		if (req.getParameter("month") != null)
			month = Integer.parseInt(req.getParameter("month"));
		else
			month = months.get(0);
			
		// 월별 총 결산 조회
		Map<String, Object> map = new HashMap<>();
		map.put("year", year);
		map.put("month", month);
		
		List<Sales2DTO> dtslist = dao.getTestSalesDay(map);

		System.out.println("dtslist : " + dtslist);
		
		// 결과값 전달
		model.addAttribute("years", years);
		model.addAttribute("months", months);
		model.addAttribute("dtslist", dtslist);
	}
	
	// 만나이 계산기
	public int age(String jumin1, String jumin2){
        String year = null;
        String jumin = jumin1;
        String backFirst = jumin2.substring(0,1);

        switch (backFirst) {
            case "1" :
                year = "19";
                break;
            case "2" :
                year = "19";
                break;
            case "3" :
                year = "20";
                break;
            case "4" :
                year = "20";
                break;
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Calendar calendar = Calendar.getInstance();
        String strToday = sdf.format(calendar.getTime());

        int birth = Integer.parseInt(year + jumin);
        int nowDay = Integer.parseInt(strToday);

        int age = (nowDay - birth) / 10000;

        System.out.println(nowDay);
        System.out.println(birth);
        System.out.println("age : " + age);

        return age;
    }
	
}