package com.teampj.physicheck.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.teampj.physicheck.dao.DoctorInfoMapper;
import com.teampj.physicheck.dao.TestMapper;
import com.teampj.physicheck.dto.AgilityDTO;
import com.teampj.physicheck.dto.CardioEnduranceDTO;
import com.teampj.physicheck.dto.CustomerDTO;
import com.teampj.physicheck.dto.FlexibilityDTO;
import com.teampj.physicheck.dto.MentalDTO;
import com.teampj.physicheck.dto.MuscularEnduranceDTO;
import com.teampj.physicheck.dto.MuscularPowerDTO;
import com.teampj.physicheck.dto.QuicknessDTO;
import com.teampj.physicheck.dto.ReserveDTO;
import com.teampj.physicheck.dto.Survey1DTO;
import com.teampj.physicheck.dto.Survey2DTO;
import com.teampj.physicheck.dto.Survey3DTO;
import com.teampj.physicheck.dto.Survey4DTO;
import com.teampj.physicheck.util.Paging;

@Service
public class TestService {

    @Autowired
    TestMapper dao;
    
    public void mental_Action(HttpServletRequest req, Model model) {
    	System.out.println("C_service => mental_Action");
    	
    	int memberNo = (Integer)req.getSession().getAttribute("MemberNo");
        System.out.println("C_Service : " + memberNo);
        
        CustomerDTO dto = dao.getMemberNo(memberNo);
		System.out.println("dto : " + dto);
		
        model.addAttribute("dto", dto);
    }
   
    @Autowired
    DoctorInfoMapper dao1;
    
    public void mental_1Action(HttpServletRequest req, Model model) {
        System.out.println("C_service => mental_1Action");

        int servey1No = Integer.parseInt(req.getParameter("reserveNo"));
        System.out.println("servey1No : " + servey1No );
        
        Survey1DTO dto = new Survey1DTO();
        dto.setSurvey1No(servey1No);
        dto.setAnswer1(Integer.parseInt(req.getParameter("q1")));
	    dto.setAnswer2(Integer.parseInt(req.getParameter("q2")));
	    dto.setAnswer3(Integer.parseInt(req.getParameter("q3")));
	    dto.setAnswer4(Integer.parseInt(req.getParameter("q4")));
	    dto.setAnswer5(Integer.parseInt(req.getParameter("q5")));		  
	  
        int insertCnt = dao.setMentalInsert1(dto); // ????????? ??????????????? ????????? ???????????? ?????? ??????
        model.addAttribute("dto", dto);
      
        System.out.println("insertCnt : "+insertCnt);
    }
    
    public void mental_2Action(HttpServletRequest req, Model model) {
       System.out.println("C_service => mental_2Action");

        int servey2No = Integer.parseInt(req.getParameter("survey1No"));
        System.out.println("servey2No : " + servey2No );
        
        Survey2DTO dto = new Survey2DTO();
        dto.setSurvey2No(servey2No);
        dto.setAnswer1(Integer.parseInt(req.getParameter("q1")));
		dto.setAnswer2(Integer.parseInt(req.getParameter("q2")));
		dto.setAnswer3(Integer.parseInt(req.getParameter("q3")));
		dto.setAnswer4(Integer.parseInt(req.getParameter("q4")));
		dto.setAnswer5(Integer.parseInt(req.getParameter("q5")));

	    int insertCnt = dao.setMentalInsert2(dto); // ????????? ??????????????? ????????? ???????????? ?????? ??????
	    model.addAttribute("dto", dto);
	    System.out.println("insertCnt : "+insertCnt);
    }
   
    public void mental_3Action(HttpServletRequest req, Model model) {
       System.out.println("C_service => mental_3Action");

       int servey3No = Integer.parseInt(req.getParameter("suervey2No"));
       System.out.println("servey3No : " + servey3No );
       
       Survey3DTO dto = new Survey3DTO();
       dto.setSurvey3No(servey3No);
       dto.setAnswer1(Integer.parseInt(req.getParameter("q1")));
       dto.setAnswer2(Integer.parseInt(req.getParameter("q2")));
       dto.setAnswer3(Integer.parseInt(req.getParameter("q3")));
       dto.setAnswer4(Integer.parseInt(req.getParameter("q4")));
       dto.setAnswer5(Integer.parseInt(req.getParameter("q5")));	  

       int insertCnt = dao.setMentalInsert3(dto); // ????????? ??????????????? ????????? ???????????? ?????? ??????
	   model.addAttribute("dto", dto);
	   System.out.println("insertCnt : "+insertCnt);
   }
   
   public void mental_4Action(HttpServletRequest req, Model model) {
       System.out.println("C_service => mental_4Action");

       int servey4No = Integer.parseInt(req.getParameter("survey3No"));
       System.out.println("servey4No : " + servey4No );
       
       Survey4DTO dto4 = new Survey4DTO();
       dto4.setSurvey4No(servey4No);
       dto4.setAnswer1(Integer.parseInt(req.getParameter("q1")));
       dto4.setAnswer2(Integer.parseInt(req.getParameter("q2")));  
       dto4.setAnswer3(Integer.parseInt(req.getParameter("q3")));
       dto4.setAnswer4(Integer.parseInt(req.getParameter("q4")));
       dto4.setAnswer5(Integer.parseInt(req.getParameter("q5"))); 
	  
       int insertCnt = dao.setMentalInsert4(dto4); // ????????? ??????????????? ????????? ???????????? ?????? ??????
       model.addAttribute("dto4", dto4);
       System.out.println("insertCnt : "+insertCnt);
   } 
   
   
   // ???????????????(??????)??? ????????? ??????
   public void mentalInsertAction(HttpServletRequest req, Model model){
      System.out.println("C_service => mentalInsertAction");
	  
      String strId =(String)req.getSession().getAttribute("memberId");
      System.out.println("C_Service strId : " + strId);

	  // 2-1. dao ?????? ??????
	  MentalDTO dto = new MentalDTO();
	  
      // 1. dao??? sql ???????????? ????????????
	  //int surveyNo = dao.mentalSelectAction(strId);
	  int surveyNo = Integer.parseInt(req.getParameter("reserveNo"));
	  System.out.println("reserveNo : "+surveyNo); // clear
	  	  
	  // 2-2. dao??? ????????? ?????? dto??? ?????? ????????????
	  dto.setSurveyNo(surveyNo);	
	  dto.setId(strId);
	  System.out.println("set complete"); // clear
	  		  
	  int insertCnt = dao.mentalInsertAction(dto);
	  // comments??? ??????????????? ${dto.comments} >> #{comments}??? ????????????.
      //model.addAttribute("dto", dto);
	  System.out.println("insertCnt : "+insertCnt);	  
	  }
   
//---------------------------------------------------------mental test    
   // << - - - - Result - - - - >>  
   public void physicalResultAction(HttpServletRequest req, Model model) {
	   System.out.println("T_service => physicalResultAction");
		
		int reserveNo = Integer.parseInt(req.getParameter("reserveNo"));
		// ??????????????? ????????????
		CardioEnduranceDTO dto1 = dao1.getPhysicalCardio(reserveNo);
		
		// ????????? ????????????
		FlexibilityDTO dto2 = dao1.getPhysicalFlexibility(reserveNo);
		
		// ?????????
		AgilityDTO dto3 = dao1.getPhysicalAgility(reserveNo);
		System.out.println("dto3 " + dto3);
		// ??????
		MuscularPowerDTO dto4 = dao1.getPhysicalMuscularPower(reserveNo);
		
		// ????????????
		MuscularEnduranceDTO dto5 = dao1.getPhysicalMuscularEndurance(reserveNo);
		
		// ?????????
		QuicknessDTO dto6 = dao1.getPhysicalQuickness(reserveNo);
		
		model.addAttribute("dto1", dto1);
		model.addAttribute("dto2", dto2);
		model.addAttribute("dto3", dto3);
		model.addAttribute("dto4", dto4);
		model.addAttribute("dto5", dto5);
		model.addAttribute("dto6", dto6);
		model.addAttribute("reserveNo",reserveNo);
    }    
    
   // ???????????? ?????????
   public void physicalResultList(HttpServletRequest req, Model model) {
	   System.out.println("C_service => physicalResultList");
	   
	   String pageNum = req.getParameter("pageNum");
	   Paging paging = new Paging(pageNum);
		
	   
	// ???????????? ??????????????? ??????
    int memberNo = (int) req.getSession().getAttribute("MemberNo");
    
    // ???????????? ??? ?????? ?????????
	int total = dao.physicalResultListCnt(memberNo);
	System.out.println("total : " + total);
	paging.setTotalCount(total);
    
	int start = paging.getStartRow();
	int end = paging.getEndRow();
	
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("start", start);
	map.put("end", end);
	map.put("memberNo", memberNo);	
	
    List<ReserveDTO> list = dao.physicalResultList(map);
    
    model.addAttribute("list",list);
    model.addAttribute("paging", paging);
    
    
   }
}