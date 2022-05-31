package com.teampj.physicheck.Service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.teampj.physicheck.dao.MemberInfoMapper;
import com.teampj.physicheck.dto.CustomerDTO;
import com.teampj.physicheck.dto.NoticeDTO;
import com.teampj.physicheck.dto.ReserveDTO;
import com.teampj.physicheck.dto.ReviewDTO;
import com.teampj.physicheck.util.Paging;

@Service
public class CustomerService {

    @Autowired
    MemberInfoMapper dao;
    
    

    //회원정보 - 상세 조회
    public void memberInfo(HttpServletRequest req, Model model) {
        System.out.println("C_service => memberInfo");

        String strId = (String)req.getSession().getAttribute("memberId");
        System.out.println("C_Service : " + strId);
        
        CustomerDTO dto = dao.getCustomerDetail(strId);
        System.out.println("C_Service - dto : " + dto);

        model.addAttribute("dto", dto);
    }
    
    // 의사_담당회원정보_회원정보 조회
    public void doctorMemberInfo(HttpServletRequest req, Model model) {
        System.out.println("C_service => doctorMemberInfo");

        int reserveNo = Integer.parseInt(req.getParameter("reserveNo"));
        System.out.println("reserveNo : " + reserveNo);
        
        // 예약번호로 _회원 번호통해 회원정보  가져오기 
        CustomerDTO dto = dao.docCustomerDetail(reserveNo);
       
        //CustomerDTO dto = dao.getCustomerDetail(strId);
        
        System.out.println("C_Service - dto : " + dto);

        model.addAttribute("dto", dto);
    }
    
    //회원정보 - 수정 처리
    public void memberUpdateAction(HttpServletRequest req, Model model) {
    	System.out.println("C_service => memberInfo");

		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    	CustomerDTO dto = new CustomerDTO();

		// 3-2단계 화면이나 세션으로부터 입력받은 값을 받아서 dto에 담는다.
		dto.setId((String)req.getSession().getAttribute("memberId"));

		//비밀번호 암호화
		String password = req.getParameter("password");
		System.out.println("암호화 전의 비밀번호 : " + password);
		String enctyptPassword = passwordEncoder.encode(password);
		System.out.println("암호화 후의 비밀번호 : " + enctyptPassword);

		//암호화된 비밀번호를 setter로 담는다.
		dto.setPassword(enctyptPassword);
		dto.setName(req.getParameter("name"));
		String address = req.getParameter("address") + req.getParameter("detailAddress");
		dto.setAddress(address);

		String email = "";
		String strEmail1 = req.getParameter("email1");
		String strEmail2 = req.getParameter("email2");
		if(!strEmail1.equals("") && !strEmail2.equals("")) {
			email = strEmail1 + "@" + strEmail2;
		}
		dto.setEmail(email);
		dto.setTel(req.getParameter("tel"));

		int updateCnt = dao.updateCustomer(dto);

	    System.out.println("update : " + updateCnt);

	    model.addAttribute("update", updateCnt);
    }
    
    //회원 탈퇴 처리
	public void memberDeleteAction(HttpServletRequest req, Model model) {
		System.out.println("C_service => memberDeleteAction");
		String strId = (String)req.getSession().getAttribute("memberId"); // 세션ID
		
		int deleteCnt = dao.deleteCustomer(strId);
		
		System.out.println("탈퇴 deleteCnt :" + deleteCnt);
		model.addAttribute("deleteCnt", deleteCnt);
	}
    
//---------------------------------------------------------memberInfo    

    // 예약
    // 예약 리스트
    public void reserveList(HttpServletRequest req, Model model) {
        System.out.println("C_service => reserveList");

        String pageNum = req.getParameter("pageNum");
		Paging paging = new Paging(pageNum);
		
        // 멤버번호 세션값에서 받기
        int memberNo = (int) req.getSession().getAttribute("MemberNo");
              
	     // 예약 글 갯수 카운트
		int total = dao.reserveCnt(memberNo);
		System.out.println("total : " + total);
		paging.setTotalCount(total);
		
		System.out.println("total ==> " + total);
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberNo", memberNo);	
		
		// 게시글 목록
		List<ReserveDTO> list = dao.reserveList(map);
		
		// jsp로 처리결과 전달(request나 session으로 결과 전달)
		model.addAttribute("dto", list);
		model.addAttribute("paging", paging);
     			
    }
    
    // 달력 처리
    public void timeList(HttpServletRequest req, Model model) {
        System.out.println("C_service => timeList");

        String date = req.getParameter("date");
        
        String dateTen = date + " 10:00:00";
		int date1= dao.timeList(dateTen);
		String dateEleven = date + " 11:00:00";
		int date2 = dao.timeList(dateEleven);
		String dateTwo = date + " 14:00:00";
		int date3 = dao.timeList(dateTwo);
		String dateThree = date + " 15:00:00";
		int date4 = dao.timeList(dateThree);
		
        model.addAttribute("date1", date1);
        model.addAttribute("date2", date2);
        model.addAttribute("date3", date3);
        model.addAttribute("date4", date4);
    }
    
    // 예약하기 버튼
    public void reserveBtn(HttpServletRequest req, Model model) {
        System.out.println("C_service => reserveBtn");
        
        ReserveDTO dto = new ReserveDTO();
        
        // 멤버번호 세션값에서 받기
        int memberNo = (int) req.getSession().getAttribute("MemberNo");
        System.out.println("member_no : " + memberNo);
        
        // resevePlay 에서 전달하는 날짜값 받기
        String date = req.getParameter("reservData");
        Timestamp reserveDate = Timestamp.valueOf(date);
        
        // 체력검사, 심리검사 체크박스 값 받기 
		int physical = Integer.parseInt(req.getParameter("physical"));
		int mental = Integer.parseInt(req.getParameter("mental"));
		
		dto.setReserveDate(reserveDate);
		dto.setMemberNo(memberNo);
		dto.setPhysicalNo(physical);
		dto.setMentalNo(mental);
		
		int incertCnt = 0;
		
		// 기초검사만 할시
		if(physical == 0 && mental == 0) {
			System.out.println("service : reserveBtn1");
			incertCnt = dao.reserveBtn1(dto);
		}
		
		// 기초검사, 체력검사
		if(physical == 1 && mental == 0) {
			System.out.println("service : reserveBtn2");
			incertCnt = dao.reserveBtn2(dto);
		}
		
		// 기초검사, 심리검사
		if(physical == 0 && mental == 1) {
			System.out.println("service : reserveBtn3");
			incertCnt = dao.reserveBtn3(dto);
		}
			
		// 기초검사, 체력검사, 심리검사
		if(physical == 1 && mental == 1) {
			System.out.println("service : reserveBtn4");
			incertCnt = dao.reserveBtn4(dto);
		}
		
		System.out.println("incertCnt : " + incertCnt);
    }
    
    // 예약 상세
    public void reserveInfo(HttpServletRequest req, Model model) {
        System.out.println("C_service => reserveInfo");
        
        // 화면으로부터 입력받은 값을 받는다.
  		int reserveNo = Integer.parseInt(req.getParameter("reserveNo"));
  		System.out.println("예약번호 : " + reserveNo);
  			
  		ReserveDTO dto = dao.reserveInfo(reserveNo);
  		
  		System.out.println("상세페이지 dto : " + dto);
  		// jsp로 처리결과 전달(request나 session으로 결과 전달)
  		
  		model.addAttribute("dto", dto);
    }
    
    // 예약 취소
    public void reserveCancelBtn(HttpServletRequest req, Model model) {
        System.out.println("C_service => reserveCancelBtn");
        
        // 화면으로부터 입력받은 값을 받는다.
  		int reserveNo = Integer.parseInt(req.getParameter("reserveNo"));
  		System.out.println("게시글번호 : " + reserveNo);
  			
  		int deleteCnt = 0;
  		deleteCnt = dao.reserveCancelBtn(reserveNo);
  		System.out.println("deleteCnt : " + deleteCnt);
    }
    
     // 공지사항 리스트
     public void noticeList(HttpServletRequest req, Model model) {
    	 System.out.println("C_service => noticeList");
    	 String pageNum = req.getParameter("pageNum");
			
			Paging pagingNotice = new Paging(pageNum);
			
			// 전체 게시글 갯수 카운트
			int total = dao.noticeCnt();
			System.out.println("total : " + total);
			pagingNotice.setTotalCount(total);
			
			System.out.println("total ==> " + total);
			int start = pagingNotice.getStartRow();
			int end = pagingNotice.getEndRow();
					
			// 게시글 목록
			List<NoticeDTO> list = dao.noticeList(start, end);
			
			// jsp로 처리결과 전달(request나 session으로 결과 전달)
			model.addAttribute("list", list);
			model.addAttribute("paging", pagingNotice);
    	 
     }
     
     // 공지사항 상세
     public void noticeInfo(HttpServletRequest req, Model model) {
    	 System.out.println("C_service => noticeInfo");
    	// 화면으로부터 입력받은 값을 받는다.
 		int num = Integer.parseInt(req.getParameter("num"));
 		System.out.println("게시글번호 : " + num);
 	
 		//  조회수 
 		dao.plusReadCnt(num);
 			
 		NoticeDTO dto = dao.noticeInfo(num);
 		// 글 내용 줄바꿈 처리
 		
 		  String content= dto.getContent(); 
 		  
 		  if(content != null) {
 			  content = content.replace("\n","<br>");
 		  }
 		  dto.setContent(content);
 		
 		System.out.println("상세페이지 dto : " + dto);
 		// jsp로 처리결과 전달(request나 session으로 결과 전달)
 		
 		model.addAttribute("dto", dto);
    	 
     }
     // 공지사항 검색
     public void noticeSearch(HttpServletRequest req, Model model) {
    	 System.out.println("C_service => noticeSearch");
     	// 화면으로부터 입력받은 값을 받는다.
    	String pageNum = req.getParameter("pageNum");
  		String searchContent = req.getParameter("searchContent");
  	
  		Paging pagingSearch = new Paging(pageNum);
		
		int total = dao.searchCnt(searchContent);
		pagingSearch.setTotalCount(total);
		
		int start = pagingSearch.getStartRow();	// 페이지별 시작번호
		int end = pagingSearch.getEndRow();		// 페이지별 끝번호
				
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("content", searchContent);
		
		List<NoticeDTO> list = dao.searchNoticeList(map);
						
		model.addAttribute("list", list);
		model.addAttribute("paging", pagingSearch);
		model.addAttribute("searchContent",searchContent);
      }
     
     // 리뷰 리스트
     public void reviewList(HttpServletRequest req, Model model) {
    	 System.out.println("C_service => reviewList");
     
    	 String pageNum = req.getParameter("pageNum");
			
			Paging paging = new Paging(pageNum);
			
			// 전체 게시글 갯수 카운트
			int total = dao.reviewCnt();
			System.out.println("total : " + total);
			paging.setTotalCount(total);
			
			int start = paging.getStartRow();
			int end = paging.getEndRow();
					
			// 게시글 목록
			List<ReviewDTO> list = dao.reviewList(start, end);
			
			// jsp로 처리결과 전달(request나 session으로 결과 전달)
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
     
     }
     
     // 리뷰 상세
     public void reviewInfo(HttpServletRequest req, Model model) {
    	 System.out.println("C_service => reviewInfo");
    	 String reviewNo = req.getParameter("reviewNo");
    	 
    	 ReviewDTO dto = dao.reviewInfo(reviewNo);
    	 
    	 String content= dto.getContent(); 
		  
		  if(content != null) {
			  content = content.replace("\n","<br>");
		  }
		  dto.setContent(content);
		  
		  
    	 model.addAttribute("dto", dto);
     }
     
     // 리뷰 등록 페이지
     public void reviewAddPage(HttpServletRequest req, Model model) {
    	 System.out.println("C_service => reviewAddPage");
    	 int memberNo = (int) req.getSession().getAttribute("MemberNo");
    	 
    	 List<Integer> list = dao.reviewAddPage(memberNo);
    	 System.out.println("list : " + list);
    	 model.addAttribute("dto", list);
     }
     
     // 리뷰 등록 버튼
     public void reviewAdd(HttpServletRequest req, Model model) {
    	 System.out.println("C_service => reviewAdd");
    	 
    	 int starPoint = Integer.parseInt(req.getParameter("starPointSelect"));
    	 String content = req.getParameter("content");
    	 int reserveNo = Integer.parseInt(req.getParameter("reserveNo"));
    	 int memberNo = (int) req.getSession().getAttribute("MemberNo");
    	 
    	 ReviewDTO dto = new ReviewDTO();
    	 dto.setStarPoint(starPoint);
    	 dto.setContent(content);
    	 dto.setReserveNo(reserveNo);
    	 dto.setMemberNo(memberNo);
    	 
    	 int insertCnt = dao.reviewAdd(dto);
    	 
    	 int updateCnt = dao.reviewAddUpdate(reserveNo);
    	 
    	 System.out.println("insertCnt : " + insertCnt);
    	 System.out.println("updateCnt : " + updateCnt);
     }
     
     // 리뷰 삭제
     public void reviewDelete(HttpServletRequest req, Model model) {
    	 System.out.println("C_service => reviewDelete");
    	 
    	 int reviewNo = Integer.parseInt(req.getParameter("reviewNo"));
    	 
    	 dao.reviewDelete(reviewNo);
    	 int reserveNo = Integer.parseInt(req.getParameter("reserveNo"));
    	 dao.reviewDeleteUpdate(reserveNo);
    	 
     }
     // 리뷰 수정 액션
     public void reviewModifyAction(HttpServletRequest req, Model model) {
    	 System.out.println("C_service => reviewModifyAction");
    	 
    	 int reviewNo = Integer.parseInt(req.getParameter("reviewNo"));
    	 String content = req.getParameter("content");
    	 int starPoint = Integer.parseInt(req.getParameter("starPointSelect"));
    	 
    	Map<String, Object> map = new HashMap<String, Object>();
 		map.put("reviewNo", reviewNo);
 		map.put("content", content);
 		map.put("starPoint", starPoint);
 		
    	 dao.reviewModifyAction(map);
     
     }
     
     // 리뷰 검색 리스트
     public void reviewSearchList(HttpServletRequest req, Model model) {
    	 System.out.println("C_service => reviewSearchList");
    	 
      	// 화면으로부터 입력받은 값을 받는다.
     	String pageNum = req.getParameter("pageNum");
   		String searchContent = req.getParameter("searchContent");
   	
   		Paging pagingSearch = new Paging(pageNum);
 		
 		int total = dao.searchReviewCnt(searchContent);
 		pagingSearch.setTotalCount(total);
 		
 		int start = pagingSearch.getStartRow();	// 페이지별 시작번호
 		int end = pagingSearch.getEndRow();		// 페이지별 끝번호
 				
 		Map<String, Object> map = new HashMap<String, Object>();
 		map.put("start", start);
 		map.put("end", end);
 		map.put("content", searchContent);
 		
 		List<ReviewDTO> list = dao.searchReviewList(map);
 						
 		model.addAttribute("list", list);
 		model.addAttribute("paging", pagingSearch);
 		model.addAttribute("searchContent",searchContent);
     }

     // 카카오 페이 결제 액션
     public void kakaoAction(HttpServletRequest req, Model model) {
    	 System.out.println("C_service => kakaoAction");
    	 
    	String reserveNo = req.getParameter("reserveNo");
    	String paymentCost = req.getParameter("totalCost");
    	String paymentWay = "카카오페이";
    	
    	// 예약테이블 결제상태 업데이트
    	int updateCnt = 0;
    	updateCnt = dao.paidState(reserveNo);
    	
    	Map<String, Object> map = new HashMap<String, Object>();
 		map.put("reserveNo", reserveNo);
 		map.put("paymentCost", paymentCost);
 		map.put("paymentWay", paymentWay);
 		// .
    	int insertCnt = 0;	
    	insertCnt = dao.paymentAdd(map);
    	
     }
     
     // 카드 결제 액션 cardAction
     public void cardAction(HttpServletRequest req, Model model) {
    	 System.out.println("C_service => cardAction");
    	 
    	String reserveNo = req.getParameter("reserveNo");
    	String paymentCost = req.getParameter("totalCost");
    	String paymentWay = "카드";
    	
    	// 예약테이블 결제상태 업데이트
    	int updateCnt = 0;
    	updateCnt = dao.paidState(reserveNo);
    	
    	Map<String, Object> map = new HashMap<String, Object>();
 		map.put("reserveNo", reserveNo);
 		map.put("paymentCost", paymentCost);
 		map.put("paymentWay", paymentWay);
 		
    	int insertCnt = 0;	
    	insertCnt = dao.paymentAdd(map);
    	
     }
     
     // 직접 결제 액션
     public void directPay(HttpServletRequest req, Model model) {
    	 System.out.println("C_service => directPay");
    	 
    	String reserveNo = req.getParameter("reserveNo");
     	String paymentCost = req.getParameter("totalCost");
     	String paymentWay = "현금";
     	
     	int updateCnt = 0;
    	updateCnt = dao.paidState(reserveNo);
    	
    	Map<String, Object> map = new HashMap<String, Object>();
 		map.put("reserveNo", reserveNo);
 		map.put("paymentCost", paymentCost);
 		map.put("paymentWay", paymentWay);
 		
    	int insertCnt = 0;	
    	insertCnt = dao.paymentAdd(map);
    	
     }
     
     // 환불처리
     public void paidReturn(HttpServletRequest req, Model model) {
    	 System.out.println("C_service => paidReturn");
    	 String reserveNo = req.getParameter("reserveNo");
    	 
    	 int updateCnt = 0;
    	 updateCnt = dao.paidStateRefund(reserveNo);
    	 
    	 System.out.println("환불처리 : " + updateCnt);
    	 model.addAttribute("updateCnt",updateCnt);
    	 
     }


     public void mental_2Action(HttpServletRequest req, Model model) {
        System.out.println("C_service => mental_2Action");


        // 지금은 아이디 없이 테스트중이니까 주석처리
//        String strId = (String)req.getSession().getAttribute("memberId");
//        System.out.println("C_Service : " + strId);
//      
//        Survey1DTO dto = new Survey1DTO();
//	      dto.setAnswer1(Integer.parseInt(req.getParameter("q1")));
//		  dto.setAnswer2(Integer.parseInt(req.getParameter("q2")));
//		  dto.setAnswer3(Integer.parseInt(req.getParameter("q3")));
//		  dto.setAnswer4(Integer.parseInt(req.getParameter("q4")));
//		  dto.setAnswer5(Integer.parseInt(req.getParameter("q5"))); // passed
//		  
//		  System.out.println(dto.getAnswer1()+" "+dto.getAnswer2()+" "+dto.getAnswer3()+" "+dto.getAnswer4()+" "+dto.getAnswer5());
//		  // passed
//		  
//	      int insertCnt = dao.setMentalInsert1(dto); // 반드시 들어가야돼 그래야 데이터에 입력 가능
//	      model.addAttribute("dto", dto);
//	      System.out.println("insertCnt : "+insertCnt);
    }
   
}