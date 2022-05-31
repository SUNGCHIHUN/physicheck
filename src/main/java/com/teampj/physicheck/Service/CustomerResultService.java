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

import com.teampj.physicheck.dao.CustomerResultMapper;
import com.teampj.physicheck.dao.DoctorInfoMapper;
import com.teampj.physicheck.dao.TestMapper;
import com.teampj.physicheck.dto.AgilityDTO;
import com.teampj.physicheck.dto.BloodDTO;
import com.teampj.physicheck.dto.BmiDTO;
import com.teampj.physicheck.dto.CardioEnduranceDTO;
import com.teampj.physicheck.dto.FlexibilityDTO;
import com.teampj.physicheck.dto.MentalDTO;
import com.teampj.physicheck.dto.MuscularEnduranceDTO;
import com.teampj.physicheck.dto.MuscularPowerDTO;
import com.teampj.physicheck.dto.PressureDTO;
import com.teampj.physicheck.dto.QuicknessDTO;
import com.teampj.physicheck.dto.ReserveDTO;
import com.teampj.physicheck.dto.UrineDTO;
import com.teampj.physicheck.util.Paging;

@Service
public class CustomerResultService {

    @Autowired
    CustomerResultMapper dao;
    
    @Autowired
    DoctorInfoMapper dao1;

    @Autowired
    TestMapper dao2;
    
    //검사결과  - 기초검사결과 리스트
    public void basicResultList(HttpServletRequest req, Model model) {
        System.out.println("C_service => basicResultList");

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
		List<ReserveDTO> list = dao.getBasicResultList(map);
		System.out.println("list : " + list);
		
		// jsp로 처리결과 전달(request나 session으로 결과 전달)
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
    }
    
    //검사결과  - 기초검사결과
    public void basicResult(HttpServletRequest req, Model model) {
        System.out.println("C_service => basicResult");
        
        int reserveNo = Integer.parseInt(req.getParameter("reserveNo"));
        System.out.println("reserveNo : " + reserveNo);
        
        //체질량검사
		BmiDTO bmi = dao1.getBmiResult(reserveNo);
		System.out.println("bmi : " + bmi);
		
		model.addAttribute("bmi", bmi);
		
		//혈압검사
		PressureDTO pressure = dao1.getPressureResult(reserveNo);
		System.out.println("pressure : " + pressure);
		
		model.addAttribute("pressure", pressure);
		
		//소변검사
		UrineDTO urine = dao1.getUrineResult(reserveNo);
		System.out.println("urine : " + urine);
		
		model.addAttribute("urine", urine);
		
		//혈액검사
		BloodDTO blood = dao1.getBloodResult(reserveNo);
		System.out.println("blood : " + blood);
		
		model.addAttribute("blood", blood);
    }
    
    //심리결과  - 심리검사결과 리스트
    public void mentalResultList(HttpServletRequest req, Model model) {
        System.out.println("C_service => mentalResultList");

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
		List<ReserveDTO> list = dao.getMentalResultList(map);
		System.out.println("list : " + list);
		
		// jsp로 처리결과 전달(request나 session으로 결과 전달)
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
    }
    
    // 종합검사 결과 - 리스트
    public void totalResultList(HttpServletRequest req, Model model) {
        System.out.println("C_service => totalResultList");

        String pageNum = req.getParameter("pageNum");
		Paging paging = new Paging(pageNum);
		
		 // 멤버번호 세션값에서 받기
        int memberNo = (int) req.getSession().getAttribute("MemberNo");
        
	     // 종합검사 갯수 카운트
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
		List<ReserveDTO> list = dao.getTotalResultList(map);
		System.out.println("list : " + list);
		
		// jsp로 처리결과 전달(request나 session으로 결과 전달)
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
    }
    
    // 종합검사결과 상세
    public void totalResult(HttpServletRequest req, Model model) {
        System.out.println("C_service => totalResult");
        
        String strId = (String)req.getSession().getAttribute("memberId");
        
        int reserveNo = Integer.parseInt(req.getParameter("reserveNo"));
        // String basiclNo = req.getParameter("basicNo");
        int physicalNo = Integer.parseInt(req.getParameter("physicalNo"));
        int mentalNo = Integer.parseInt(req.getParameter("mentalNo"));
               
        // 기초검사 등록 여부
       int basicChk = dao2.totalBasicChk(reserveNo);
       int physicalChk = dao2.totalPhysicalChk(reserveNo);
       int mentalChk = dao2.totalMentalChk(reserveNo);
            
       if(basicChk != 0) {
    	   
         //체질량검사
   		BmiDTO bmi = dao1.getBmiResult(reserveNo);
   		System.out.println("bmi : " + bmi);
   		
   		model.addAttribute("bmi", bmi);
   		
   		//혈압검사
   		PressureDTO pressure = dao1.getPressureResult(reserveNo);
   		System.out.println("pressure : " + pressure);
   		
   		model.addAttribute("pressure", pressure);
   		
   		//소변검사
   		UrineDTO urine = dao1.getUrineResult(reserveNo);
   		System.out.println("urine : " + urine);
   		
   		model.addAttribute("urine", urine);
   		
   		//혈액검사
   		BloodDTO blood = dao1.getBloodResult(reserveNo);
   		System.out.println("blood : " + blood);
   		
   		model.addAttribute("blood", blood);
   		
   		
       }
               
        // 운동검사 상세 가져오기
        if(physicalNo != 0) {
      
        	 // 운동검사 등록 여부
        	if(physicalChk != 0) {
        		CardioEnduranceDTO dto1 = dao1.getPhysicalCardio(reserveNo);
        		
        		// 유연성 가져오기
        		FlexibilityDTO dto2 = dao1.getPhysicalFlexibility(reserveNo);
        		
        		// 순발력
        		AgilityDTO dto3 = dao1.getPhysicalAgility(reserveNo);
        		
        		// 근력
        		MuscularPowerDTO dto4 = dao1.getPhysicalMuscularPower(reserveNo);
        		
        		// 근지구력
        		MuscularEnduranceDTO dto5 = dao1.getPhysicalMuscularEndurance(reserveNo);
        		
        		// 민첩성
        		QuicknessDTO dto6 = dao1.getPhysicalQuickness(reserveNo);
        		
        		model.addAttribute("dto1", dto1);
        		model.addAttribute("dto2", dto2);
        		model.addAttribute("dto3", dto3);
        		model.addAttribute("dto4", dto4);
        		model.addAttribute("dto5", dto5);
        		model.addAttribute("dto6", dto6);
        	}
        	       	
        }
        
        // 종합검사결과_심리검사 결과
        if(mentalNo != 0) {
        	 // 심리검사 등록 여부
        	if(mentalChk != 0) {
                
                MentalDTO dto = dao1.getMentalSurveyResult(mentalNo);
          		System.out.println("설문결과 dto : " + dto);
          		
          		model.addAttribute("dto10", dto);
        	}
        	
        }
        model.addAttribute("basicChk",basicChk);
        model.addAttribute("physicalChk",physicalChk);
        model.addAttribute("mentalChk",mentalChk);
        
        model.addAttribute("reserveNo",reserveNo);
    }
    
    //의료진_심리검사설문지 불러오기 select
  	public void mentalResult(HttpServletRequest req, Model model) {
  		System.out.println("D_service => mentalResult");
  		
  		int mentalNo = Integer.parseInt(req.getParameter("reserveNo"));
  		System.out.println("mentalNo : " + mentalNo);
  		
  		MentalDTO dto = dao1.getMentalSurveyResult(mentalNo);
  		System.out.println("설문결과 dto : " + dto);
  		
  		model.addAttribute("dto1", dto);
  	}
}