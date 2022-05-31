package com.teampj.physicheck.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.teampj.physicheck.dao.DoctorInfoMapper;
import com.teampj.physicheck.dto.AgilityDTO;
import com.teampj.physicheck.dto.BasicDTO;
import com.teampj.physicheck.dto.BloodDTO;
import com.teampj.physicheck.dto.BmiDTO;
import com.teampj.physicheck.dto.CardioEnduranceDTO;
import com.teampj.physicheck.dto.CustomerDTO;
import com.teampj.physicheck.dto.DoctorDTO;
import com.teampj.physicheck.dto.FlexibilityDTO;
import com.teampj.physicheck.dto.MentalDTO;
import com.teampj.physicheck.dto.MuscularEnduranceDTO;
import com.teampj.physicheck.dto.MuscularPowerDTO;
import com.teampj.physicheck.dto.PhysicalDTO;
import com.teampj.physicheck.dto.PressureDTO;
import com.teampj.physicheck.dto.QuicknessDTO;
import com.teampj.physicheck.dto.ReserveDTO;
import com.teampj.physicheck.dto.UrineDTO;
import com.teampj.physicheck.util.Paging;

@Service
public class DoctorService {
   
   @Autowired
   DoctorInfoMapper dao;
   
   @Autowired
   BCryptPasswordEncoder passwordEncoder;
   
   //===============================[개인정보수정]====================================
   //의료진정보 수정
   public void memberInfoUpdate(HttpServletRequest req, Model model) {
      System.out.println("D_service => memberInfoUpdate");
      
      DoctorDTO dto = new DoctorDTO();
      dto.setId((String)req.getSession().getAttribute("memberId"));
      //String id = req.getParameter("hiddenId");
      String name = req.getParameter("name");
      
      //비밀번호 암호화
      String password = req.getParameter("password");
      System.out.println("암호화 전의 비밀번호 : " + password);
      String enctyptPassword = passwordEncoder.encode(password);
      System.out.println("암호화 후의 비밀번호 : " + enctyptPassword);
      
      //암호화된 비밀번호를 setter로 담는다.
      dto.setPassword(enctyptPassword);
            
      String tel = req.getParameter("tel");
      String email1 = req.getParameter("email1");
      String email2 = req.getParameter("email2");
      String email = email1+"@"+email2;
      String address= req.getParameter("address");
      
      //dto.setId(id);
      dto.setName(name);
      dto.setTel(tel);
      dto.setEmail(email);
      dto.setAddress(address);
            
      System.out.println("정보수정 dto : " + dto);
      
      int updateCnt = dao.memberInfoUpdate(dto);
      System.out.println("updateCnt : " + updateCnt);
      
      model.addAttribute("updateCnt", updateCnt);
      
   }
   
   //=======================[일정관리]==============================
   //의료진_진료일정 불러오기
   public List<Map<String, Object>> schedule(HttpServletRequest req, Model model) {
      System.out.println("D_service => schedule");
      
      List<Map<String, Object>> list = dao.schduleList();
      System.out.println("여기야여기 list : " + list);
      
      JSONObject jsonObj = new JSONObject();
      JSONArray jsonArr = new JSONArray();
      //JSONObject jsonObjFin = new JSONObject();
      
      HashMap<String, Object> hash = new HashMap<String, Object>();   
      
      for(int i=0; i < list.size(); i++) {
         hash.put("title", list.get(i).get("NAME")); //환자명
         hash.put("description", list.get(i).get("RESERVENO"));//환자번호
         String date = (String) list.get(i).get("RESERVEDATE");   //날짜
         System.out.println("date : " + date);
         String time = (String) list.get(i).get("RESERVETIME");   //시간
         StringBuffer timeTest = new StringBuffer();
         timeTest.append(time);
         timeTest.replace(4, 5,"0");
         
         time = timeTest.toString();
         System.out.println("time : " + time); //왜 시간 +4야...? 장난해...?
         hash.put("start", date+"T"+time); //날짜T시간
         
         jsonObj = new JSONObject(hash); //중괄호 {key:value , key:value, key:value}
         jsonArr.add(jsonObj); // 대괄호 안에 넣어주기[{key:value , key:value, key:value},{key:value , key:value, key:value}]
         //jsonObjFin.put("jsonArr", jsonArr);
      }
      
      System.out.println("jsonArr : " + jsonArr);
      //System.out.println("jsonObjFin : " + jsonObjFin);
      model.addAttribute("jsonArr", jsonArr);
      //model.addAttribute("jsonArr", jsonObjFin);
      return jsonArr;

   }
   
   //===============================[담당회원정보]====================================
   //의료진_회원정보 (기초 + show='n')
   public void resultInfoList(HttpServletRequest req, Model model) {
      System.out.println("D_service => resultInfoList");
      
      String examination = req.getParameter("examination");
      System.out.println("진료과목 : " + examination);
      
      //페이징
      // 페이지번호 클릭시
      String pageNum = req.getParameter("pageNum");
      
      Paging paging = new Paging(pageNum);
      
      // 전체 게시글 갯수 카운트
      int total = dao.boardCnt();
      paging.setTotalCount(total);
      System.out.println("total ==> " + total);
      
      int start = paging.getStartRow();
      int end = paging.getEndRow();
      
      List<ReserveDTO> list = null;
      
      if(total>0) {
         Map<String, Object> map = new HashMap<String,Object>();
         map.put("start", start);
         map.put("end", end);
         if(examination.equals("기초검사")) {
          //System.out.println("타라타라 : " + examination);
          list = dao.getReserveInfoList(map);
          System.out.println("list : " + list);
         }else if(examination.equals("운동검사")) {
            //System.out.println("타라타라 : " + examination);
           list = dao.getReserveInfoList1(map);
           System.out.println("list : " + list);
         }else if(examination.equals("심리검사")) {
            //System.out.println("타라타라 : " + examination);
           list = dao.getReserveInfoList2(map);
           System.out.println("list : " + list);
         }else {
            System.out.println("안타");
         }
        
        model.addAttribute("paging", paging);
        model.addAttribute("list", list);
      }
    }
   
    //이전 진료 내역 List(기초)
  	public void resultBasicList(HttpServletRequest req, Model model) {
  		System.out.println("D_service => resultBasicList");
  		
  		int memberNo = Integer.parseInt(req.getParameter("memberNo"));
  		System.out.println("memberNo : " + memberNo);
  		
  		//페이징
  		// 페이지번호 클릭시
  		String pageNum = req.getParameter("pageNum");
  			
  		Paging paging = new Paging(pageNum);
  			
		// 전체 게시글 갯수 카운트
		int total = dao.boardCnt();
		paging.setTotalCount(total);
		System.out.println("total ==> " + total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		List<ReserveDTO> list = null;
		
		if(total>0) {
		      Map<String, Object> map = new HashMap<String,Object>();
		      map.put("start", start);
		      map.put("end", end);
		      map.put("memberNo", memberNo);
		      list = dao.resultBasicList(map);
		      System.out.println("list : " + list);
			}
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
  	}
    
    //이전 진료 내역 List(심리)
   	public void resultMentalList(HttpServletRequest req, Model model) {
   		System.out.println("D_service => resultMentalList");
   		
   		int memberNo = Integer.parseInt(req.getParameter("memberNo"));
   		System.out.println("memberNo : " + memberNo);
   		
   		//페이징
   		// 페이지번호 클릭시
   		String pageNum = req.getParameter("pageNum");
   			
   		Paging paging = new Paging(pageNum);
   			
		// 전체 게시글 갯수 카운트
		int total = dao.boardCnt();
		paging.setTotalCount(total);
		System.out.println("total ==> " + total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		List<ReserveDTO> list = null;
		
		if(total>0) {
		      Map<String, Object> map = new HashMap<String,Object>();
		      map.put("start", start);
		      map.put("end", end);
		      map.put("memberNo", memberNo);
		      list = dao.resultMentalList(map);
		      System.out.println("list : " + list);
			}
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
   	}
     

	//기초검사결과
	public void basicReault(HttpServletRequest req, Model model) {
		System.out.println("D_service => basicReault");
		
		int reserveNo = Integer.parseInt(req.getParameter("reserveNo"));
		System.out.println("reserveNo : " + reserveNo);
		
		//체질량검사
		BmiDTO bmi = dao.getBmiResult(reserveNo);
		System.out.println("bmi : " + bmi);
		
		model.addAttribute("bmi", bmi);
		
		//혈압검사
		PressureDTO pressure = dao.getPressureResult(reserveNo);
		System.out.println("pressure : " + pressure);
		
		model.addAttribute("pressure", pressure);
		
		//소변검사
		UrineDTO urine = dao.getUrineResult(reserveNo);
		System.out.println("urine : " + urine);
		
		model.addAttribute("urine", urine);
		
		//혈액검사
		BloodDTO blood = dao.getBloodResult(reserveNo);
		System.out.println("blood : " + blood);
		
		model.addAttribute("blood", blood);
		
	}
	
	//기초검사결과 > 수정
	public void customerDetailBasicModify(HttpServletRequest req, Model model) {
		System.out.println("D_service => customerDetailBasicModify");
		
		int reserveNo = Integer.parseInt(req.getParameter("resultNo"));
		System.out.println("reserveNo : " + reserveNo);
		
		String gender = req.getParameter("gender");
		System.out.println("gender: " + gender);
		
		//체질량 검사
		BmiDTO dto1 = new BmiDTO();
		//bmi 계산 - 성별 구분 X
		int bmiNo = reserveNo;
		float cm= Float.valueOf(req.getParameter("height"));
		cm/=100;	//cm -> m 로 변환
		float kg= Float.valueOf(req.getParameter("weight"));
		float bmi = kg / (cm*cm);
		//bmi= (float) ((bmi*100)/100.0); //소수점 2자리
		cm*=100;	//m -> cm 로 변환

		//체지방 계산
		if (gender.equals("남성")) {
			// 남자)  체지방량(kg) ->  (1.1 * 자기 체중) - {128 * (자기 체중 / 자기 키)}
			float bodyFat = (float) ((1.1 * kg) - (128 * (kg/cm)));
			//bodyFat = (float) ((bodyFat*100)/100.0);	//소수점 2자리
			dto1.setBodyFat(Math.round(bodyFat));
	    } else if (gender.equals("여성")){
	    	// 여자)  체지방량(kg) ->  (1.07 * 자기 체중) - {128 * (자기 체중 / 자기 키)}
	    	float bodyFat = (float) ((1.07 * kg) - (128 * (kg/cm)));
	    	//bodyFat = (float) ((bodyFat*100)/100.0);	//소수점 2자리
	    	dto1.setBodyFat(Math.round(bodyFat));
	    } else {
	        System.out.println("안탐");
	    }
		
		//근육량
		// 근육량(+-0.3kg) = 체중 - 체지방량 - 무기질량(2.5~3.0) -> 무기질량 남자는 3.0 여자는 2.5로 잡음
		if (gender.equals("남성")) {
			// 남자)  근육량(+-0.3kg) = 체중 - 체지방량 - 무기질량(3.0)
			float bodyMuscle = (float) (kg - dto1.getBodyFat() - 3.0);
			//bodyMuscle = (float) ((bodyMuscle*100)/100.0);	//소수점 2자리
			dto1.setBodyMuscle(Math.round(bodyMuscle));
	    } else if (gender.equals("여성")){
	    	// 여자)  근육량(+-0.3kg) = 체중 - 체지방량 - 무기질량(2.5)
	    	float bodyMuscle = (float) (kg - dto1.getBodyFat() - 2.5);
	    	//bodyMuscle = (float) ((bodyMuscle*100)/100.0);	//소수점 2자리
	    	dto1.setBodyMuscle(Math.round(bodyMuscle));
	    } else {
	        System.out.println("안탐");
	    }
		
		dto1.setBmiNo(bmiNo);
		dto1.setHeight(cm);
		dto1.setWeight(kg);
		dto1.setBmi(Math.round(bmi));
		//dto1.setBodyFat(bodyFat);
		//dto1.setBodyMuscle(Double.valueOf(req.getParameter("bodyMuscle")));
		dto1.setBodyWater(Float.valueOf(req.getParameter("bodyWater")));
		
		System.out.println("===============================================");
		System.out.println("체질량 검사 dto : " + dto1);
		
		Map<String, Object> map1 = new HashMap<String, Object>();
			map1.put("dto1", dto1);
			map1.put("reserveNo", reserveNo);
			
		int bmiUpdateCnt = dao.bmiResultUpdate(map1);
		System.out.println("bmiUpdateCnt : " + bmiUpdateCnt);
		System.out.println("===============================================");
		
		//혈압검사
		PressureDTO dto2 = new PressureDTO();
		dto2.setPressureHigh(Float.valueOf(req.getParameter("pressureHigh")));
		dto2.setPressureLow(Float.valueOf(req.getParameter("pressureLow")));
		
		System.out.println("===============================================");
		System.out.println("혈압 검사 dto : " + dto2);
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("dto2", dto2);
		map2.put("reserveNo", reserveNo);
		
		int pressureUpdateCnt = dao.pressureResultUpdate(map2);
		System.out.println("pressureUpdateCnt : " + pressureUpdateCnt);
		System.out.println("===============================================");
		
		//소변검사
		UrineDTO dto3 = new UrineDTO();
		dto3.setUrineProtein(Float.valueOf(req.getParameter("urineProtein")));
		dto3.setUrineAcid(Float.valueOf(req.getParameter("urineAcid")));
		dto3.setUrineGlucose(Float.valueOf(req.getParameter("urineGlucose")));
		
		System.out.println("===============================================");
		System.out.println("소변검사 dto : " + dto3);
		
		Map<String, Object> map3 = new HashMap<String, Object>();
		map3.put("dto3", dto3);
		map3.put("reserveNo", reserveNo);
		
		int urineUpdateCnt = dao.urineResultUpdate(map3);
		System.out.println("urineUpdateCnt : " + urineUpdateCnt);
		System.out.println("===============================================");
		
		//혈액검사
		BloodDTO dto4 = new BloodDTO();
		dto4.setRedBloodCell(Float.valueOf(req.getParameter("redBloodCell")));
		dto4.setWhiteBloodCell(Float.valueOf(req.getParameter("whiteBloodCell")));
		dto4.setBloodPlatelet(Float.valueOf(req.getParameter("bloodPlatelet")));
		dto4.setLiverFunction(Float.valueOf(req.getParameter("liverFunction")));
		dto4.setBloodGlucose(Float.valueOf(req.getParameter("bloodGlucose")));
		
		System.out.println("===============================================");
		System.out.println("혈액 검사 dto : " + dto4);
		
		Map<String, Object> map4 = new HashMap<String, Object>();
		map4.put("dto4", dto4);
		map4.put("reserveNo", reserveNo);
		
		int bloodUpdateCnt = dao.bloodResultUpdate(map4);
		System.out.println("bloodUpdateCnt : " + bloodUpdateCnt);
		System.out.println("===============================================");
		
		/*
		//시력검사
		EyesightDTO dto5 = new EyesightDTO();
		int eyesightNo = reserveNo;
		dto5.setEyesightNo(eyesightNo);
		dto5.setEyesightLeft(Float.valueOf(req.getParameter("eyesightLeft")));
		dto5.setEyesightRight(Float.valueOf(req.getParameter("eyesightRight")));
		
		System.out.println("===============================================");
		System.out.println("시력 검사 dto : " + dto5);
		
		//int eyesightInsertCnt = dao.eyesightResultInsert(dto5);
		//System.out.println("eyesightInsertCnt : " + eyesightInsertCnt);
		System.out.println("===============================================");
		
		//청력검사
		HearingDTO dto6 = new HearingDTO();
		int hearingNo = reserveNo;
		dto6.setHearingNo(hearingNo);
		dto6.setHearingLeft(Float.valueOf(req.getParameter("hearingLeft")));
		dto6.setHearingRight(Float.valueOf(req.getParameter("hearingRight")));
		
		System.out.println("===============================================");
		System.out.println("청력 검사 dto : " + dto6);
		
		//int hearingInsertCnt = dao.hearingResultInsert(dto6);
		//System.out.println("hearingInsertCnt : " + hearingInsertCnt);
		System.out.println("===============================================");
		*/
		
		model.addAttribute("bmiUpdateCnt", bmiUpdateCnt);
		model.addAttribute("pressureUpdateCnt", pressureUpdateCnt);
		model.addAttribute("urineUpdateCnt", urineUpdateCnt);
		model.addAttribute("bloodUpdateCnt", bloodUpdateCnt);
		//model.addAttribute("eyesightInsertCnt", eyesightInsertCnt);
		//model.addAttribute("hearingInsertCnt", hearingInsertCnt);
	}
	
	/*
	//심리검사소견서
	public void mentalReault(HttpServletRequest req, Model model) {
		System.out.println("D_service => mentalReault");
		
		int reserveNo = Integer.parseInt(req.getParameter("resultNo"));
		System.out.println("reserveNo : " + reserveNo);
		
		MentalDTO dto = dao.getMentalComments(reserveNo);
		System.out.println("dto : " + dto);
		
		model.addAttribute("dto", dto);
	}
	*/
	
	//=======================[검사결과등록]===========================
	//의료진_검사등록 리스트(기본)
	public void resultList(HttpServletRequest req, Model model) {
		System.out.println("D_service => resultList");
		
		//페이징
		// 페이지번호 클릭시
		String pageNum = req.getParameter("pageNum");
		
		Paging paging = new Paging(pageNum);
		
		// 전체 게시글 갯수 카운트
		int total = dao.boardCnt();
		paging.setTotalCount(total);
		System.out.println("total ==> " + total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		List<ReserveDTO> list = null;
		
		if(total>0) {
		      Map<String, Object> map = new HashMap<String,Object>();
		      map.put("start", start);
		      map.put("end", end);
		      list = dao.getReserveList(map);
		      System.out.println("list : " + list);
			}
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
	
	//의료진_검사등록 리스트(운동)
	public void resultList1(HttpServletRequest req, Model model) {
		System.out.println("D_service => resultList1");
		
		//페이징
		// 페이지번호 클릭시
		String pageNum = req.getParameter("pageNum");
		
		Paging paging = new Paging(pageNum);
		
		// 전체 게시글 갯수 카운트
		int total = dao.boardCnt();
		paging.setTotalCount(total);
		System.out.println("total ==> " + total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		List<ReserveDTO> list = null;
		
		if(total>0) {
		      Map<String, Object> map = new HashMap<String,Object>();
		      map.put("start", start);
		      map.put("end", end);
		      list = dao.getReserveList1(map);
		      System.out.println("list : " + list);
			}
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
	
	
	//의료진_검사등록 리스트(심리)
	public void resultList2(HttpServletRequest req, Model model) {
		System.out.println("D_service => resultList2");
		
		//페이징
		// 페이지번호 클릭시
		String pageNum = req.getParameter("pageNum");
		
		Paging paging = new Paging(pageNum);
		
		// 전체 게시글 갯수 카운트
		int total = dao.boardCnt();
		paging.setTotalCount(total);
		System.out.println("total ==> " + total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		List<ReserveDTO> list = null;
		
		if(total>0) {
		      Map<String, Object> map = new HashMap<String,Object>();
		      map.put("start", start);
		      map.put("end", end);
		      list = dao.getReserveList2(map);
		      System.out.println("list : " + list);
			}
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
	
	//의료진_검사등록페이지_회원정보select
	public void resultMemberInfo(HttpServletRequest req, Model model) {
		System.out.println("D_service => resultMemberInfo");
		
		int reserveNo = Integer.parseInt(req.getParameter("reserveNo"));
		System.out.println("reserveNo : " + reserveNo);
		
		//회원정보 불러오기
		CustomerDTO mdto = dao.getCustomerList(reserveNo);
		System.out.println("mdto : " + mdto);
		
		model.addAttribute("mdto", mdto);
	}
	
	//의료진_기초검사등록insert
	public void insertResult1(HttpServletRequest req, Model model) {
		System.out.println("D_service => insertResult1");

		int reserveNo = Integer.parseInt(req.getParameter("resultNo"));
		System.out.println("reserveNo : " + reserveNo);

		String gender = req.getParameter("gender");
		System.out.println("gender: " + gender);

		//체질량 검사
		BmiDTO dto1 = new BmiDTO();
		//bmi 계산 - 성별 구분 X
		int bmiNo = reserveNo;
		float cm= Float.valueOf(req.getParameter("height"));
		cm/=100;	//cm -> m 로 변환
		float kg= Float.valueOf(req.getParameter("weight"));
		float bmi = (kg / (cm*cm));
		bmi= (float) ((bmi*100)/100.0); //소수점 2자리
		cm*=100;	//m -> cm 로 변환

		//체지방 계산
		if (gender.equals("남성")) {
			// 남자)  체지방량(kg) ->  (1.1 * 자기 체중) - {128 * (자기 체중 / 자기 키)}
			double bodyFat = ((1.1 * kg) - (128 * (kg/cm)));
			bodyFat = (int) ((bodyFat*100)/100.0);	//소수점 2자리
			dto1.setBodyFat((float) bodyFat);
		} else if (gender.equals("여성")){
			// 여자)  체지방량(kg) ->  (1.07 * 자기 체중) - {128 * (자기 체중 / 자기 키)}
			double bodyFat = ((1.07 * kg) - (128 * (kg/cm)));
			bodyFat = (int) ((bodyFat*100)/100.0);	//소수점 2자리
			dto1.setBodyFat((float) bodyFat);
		} else {
			System.out.println("안탐");
		}

		//근육량
		// 근육량(+-0.3kg) = 체중 - 체지방량 - 무기질량(2.5~3.0) -> 무기질량 남자는 3.0 여자는 2.5로 잡음
		if (gender.equals("남성")) {
			// 남자)  근육량(+-0.3kg) = 체중 - 체지방량 - 무기질량(3.0)
			double bodyMuscle = (kg - dto1.getBodyFat() - 3.0);
			bodyMuscle = (int) ((bodyMuscle*100)/100.0);	//소수점 2자리
			dto1.setBodyMuscle((float) bodyMuscle);
		} else if (gender.equals("여성")){
			// 여자)  근육량(+-0.3kg) = 체중 - 체지방량 - 무기질량(2.5)
			double bodyMuscle = (kg - dto1.getBodyFat() - 2.5);
			bodyMuscle = (int) ((bodyMuscle*100)/100.0);	//소수점 2자리
			dto1.setBodyMuscle((float) bodyMuscle);
		} else {
			System.out.println("안탐");
		}

		dto1.setBmiNo(bmiNo);
		dto1.setHeight(cm);
		dto1.setWeight(kg);
		dto1.setBmi(bmi);
		//dto1.setBodyFat(bodyFat);
		//dto1.setBodyMuscle(Double.valueOf(req.getParameter("bodyMuscle")));
		dto1.setBodyWater(Float.valueOf(req.getParameter("bodyWater")));

		System.out.println("===============================================");
		System.out.println("체질량 검사 dto : " + dto1);

		int bmiInsertCnt = dao.bmiResultInsert(dto1);
		System.out.println("bmiInsertCnt : " + bmiInsertCnt);
		System.out.println("===============================================");

		//혈압검사
		PressureDTO dto2 = new PressureDTO();
		int pressure_no = reserveNo;
		dto2.setPressure_no(pressure_no);
		dto2.setPressureHigh(Float.valueOf(req.getParameter("pressureHigh")));
		dto2.setPressureLow(Float.valueOf(req.getParameter("pressureLow")));

		System.out.println("===============================================");
		System.out.println("혈압 검사 dto : " + dto2);

		int pressureInsertCnt = dao.pressureResultInsert(dto2);
		System.out.println("pressureInsertCnt : " + pressureInsertCnt);
		System.out.println("===============================================");

		//소변검사
		UrineDTO dto3 = new UrineDTO();
		int urine_no = reserveNo;
		dto3.setUrine_no(urine_no);
		dto3.setUrineProtein(Float.valueOf(req.getParameter("urineProtein")));
		dto3.setUrineAcid(Float.valueOf(req.getParameter("urineAcid")));
		dto3.setUrineGlucose(Float.valueOf(req.getParameter("urineGlucose")));

		System.out.println("===============================================");
		System.out.println("소변검사 dto : " + dto3);

		int urineInsertCnt = dao.urineResultInsert(dto3);
		System.out.println("urineResultInsert : " + urineInsertCnt);
		System.out.println("===============================================");

		//혈액검사
		BloodDTO dto4 = new BloodDTO();
		int bloodNo = reserveNo;
		dto4.setBloodNo(bloodNo);
		dto4.setRedBloodCell(Float.valueOf(req.getParameter("redBloodCell")));
		dto4.setWhiteBloodCell(Float.valueOf(req.getParameter("whiteBloodCell")));
		dto4.setBloodPlatelet(Float.valueOf(req.getParameter("bloodPlatelet")));
		dto4.setLiverFunction(Float.valueOf(req.getParameter("liverFunction")));
		dto4.setBloodGlucose(Float.valueOf(req.getParameter("bloodGlucose")));

		System.out.println("===============================================");
		System.out.println("혈액 검사 dto : " + dto4);

		int bloodInsertCnt = dao.bloodResultInsert(dto4);
		System.out.println("bloodInsertCnt : " + bloodInsertCnt);
		System.out.println("===============================================");
		
		/*
		//시력검사
		EyesightDTO dto5 = new EyesightDTO();
		int eyesightNo = reserveNo;
		dto5.setEyesightNo(eyesightNo);
		dto5.setEyesightLeft(Float.valueOf(req.getParameter("eyesightLeft")));
		dto5.setEyesightRight(Float.valueOf(req.getParameter("eyesightRight")));
		
		System.out.println("===============================================");
		System.out.println("시력 검사 dto : " + dto5);
		
		//int eyesightInsertCnt = dao.eyesightResultInsert(dto5);
		//System.out.println("eyesightInsertCnt : " + eyesightInsertCnt);
		System.out.println("===============================================");
		
		//청력검사
		HearingDTO dto6 = new HearingDTO();
		int hearingNo = reserveNo;
		dto6.setHearingNo(hearingNo);
		dto6.setHearingLeft(Float.valueOf(req.getParameter("hearingLeft")));
		dto6.setHearingRight(Float.valueOf(req.getParameter("hearingRight")));
		
		System.out.println("===============================================");
		System.out.println("청력 검사 dto : " + dto6);
		
		//int hearingInsertCnt = dao.hearingResultInsert(dto6);
		//System.out.println("hearingInsertCnt : " + hearingInsertCnt);
		System.out.println("===============================================");
		*/
		//상위테이블로 insert
		BasicDTO dto7 = new BasicDTO();
		int basicNo = reserveNo;
		dto7.setBasicNo(basicNo);
		dto7.setBmiNo(bmiNo);
		dto7.setPressureNo(pressure_no);
		dto7.setUrineNo(urine_no);
		dto7.setBloodNo(bloodNo);
		//dto7.setEyesightNo(eyesightNo);
		//dto7.setHearingNo(hearingNo);
		dto7.setTestExpense(50000);
		dto7.setId((String)req.getSession().getAttribute("memberId"));

		System.out.println("===============================================");
		System.out.println("기초검사 상위 테이블 : " + dto7);

		int BasicInsertCnt = dao.BasicInsert(dto7);
		System.out.println("BasicInsertCnt : " + BasicInsertCnt);
		System.out.println("===============================================");


		if (bmiInsertCnt == 1 && pressureInsertCnt == 1 && urineInsertCnt == 1 &&
				bloodInsertCnt == 1) {
			int updateCnt = dao.showUpdate(reserveNo);
			
			int memberNo = Integer.parseInt(req.getParameter("memberNo"));
	   		System.out.println("memberNo : " + memberNo);
			
			// 검진이력 Y로 변경
			int updateEx = dao.checksUpdate(memberNo);
			System.out.println("updateEx : " + updateEx);
			
			System.out.println("update : " + updateCnt);
			
			model.addAttribute("updateCnt", updateCnt);
		}else{
			System.out.println("show='n'으로 못 바꿈"); }

		model.addAttribute("bmiInsertCnt", bmiInsertCnt);
		model.addAttribute("pressureInsertCnt", pressureInsertCnt);
		model.addAttribute("urineInsertCnt", urineInsertCnt);
		model.addAttribute("bloodInsertCnt", bloodInsertCnt);
		//model.addAttribute("eyesightInsertCnt", eyesightInsertCnt);
		//model.addAttribute("hearingInsertCnt", hearingInsertCnt);

	}
	
   //의료진_운동검사등록insert
   public void insertResult2(HttpServletRequest req, Model model) {
      System.out.println("D_service => insertResult2");
      
      int reserveNo = Integer.parseInt(req.getParameter("resultNo"));
      System.out.println("reserveNo : " + reserveNo);
      
      //심페지구력
      CardioEnduranceDTO dto1 = new CardioEnduranceDTO();
      dto1.setCardioEnduranceNo(reserveNo);
      
      float minute = Float.valueOf(req.getParameter("run3km1"));
      float second = Float.valueOf(req.getParameter("run3km2"));
      float run3km = (minute * 60) + second;
      dto1.setRun3km(run3km);
      
      float balke = Float.valueOf(req.getParameter("balkeProtocol"));
      dto1.setBalkeProtocol(Float.valueOf(req.getParameter("balkeProtocol")));
      
      // 심페지구력 결과 계산
      // 3km 달리기
      String gender = req.getParameter("gender");
      
      if (gender.equals("남성")) {
         if (run3km <= 858) dto1.setRun3kmResult(5);
         else if (run3km <= 937) dto1.setRun3kmResult(4);
         else if (run3km <= 1017) dto1.setRun3kmResult(3);
         else if (run3km <= 1096) dto1.setRun3kmResult(2);
         else if (run3km > 1096) dto1.setRun3kmResult(1);
         else dto1.setRun3kmResult(-1);
         
      } else if (gender.equals("여성")){
         if (run3km <= 1030) dto1.setRun3kmResult(5);
         else if (run3km <= 1125) dto1.setRun3kmResult(4);
         else if (run3km <= 1220) dto1.setRun3kmResult(3);
         else if (run3km <= 1315) dto1.setRun3kmResult(2);
         else if (run3km > 1315) dto1.setRun3kmResult(1);
         else dto1.setRun3kmResult(-1);
         
      } else {
         System.out.println("성별 알 수 없음...");
      }
      
      // Balke 프로토콜
      if (gender.equals("남성")) {
         if (balke >= 20) dto1.setBalkeProtocolResult(5);
         else if (balke >= 18) dto1.setBalkeProtocolResult(4);
         else if (balke >= 16) dto1.setBalkeProtocolResult(3);
         else if (balke >= 13) dto1.setBalkeProtocolResult(2);
         else if (balke < 13) dto1.setBalkeProtocolResult(1);
         else dto1.setBalkeProtocolResult(-1);
         
      } else if (gender.equals("여성")){
         if (balke >= 18) dto1.setBalkeProtocolResult(5);
         else if (balke >= 16) dto1.setBalkeProtocolResult(4);
         else if (balke >= 14) dto1.setBalkeProtocolResult(3);
         else if (balke >= 12) dto1.setBalkeProtocolResult(2);
         else if (balke < 12) dto1.setBalkeProtocolResult(1);
         else dto1.setBalkeProtocolResult(-1);
         
      } else {
         System.out.println("성별 알 수 없음...");
      }
      
      System.out.println("===============================================");
      System.out.println("심페지구력 dto : " + dto1);
      
      int CardioEnduranceInsertCnt = dao.CardioEnduranceResultInsert(dto1);
      System.out.println("CardioEnduranceInsertCnt : " + CardioEnduranceInsertCnt);
      System.out.println("===============================================");
      
      //유연성
      FlexibilityDTO dto2 = new FlexibilityDTO();
      dto2.setFlexibilityNo(reserveNo);
      dto2.setForwardBending(Float.valueOf(req.getParameter("forwardBending")));
      dto2.setBridge(Float.valueOf(req.getParameter("bridge")));
      
      // 유연성 결과 계산
      // 앞으로 굽히기
      int forward = Integer.parseInt(req.getParameter("forwardBending"));
      
      if (gender.equals("남성")) {
         if (forward >= 30) dto2.setForwardBendingResult(5);
         else if (forward >= 27) dto2.setForwardBendingResult(4);
         else if (forward >= 24) dto2.setForwardBendingResult(3);
         else if (forward >= 21) dto2.setForwardBendingResult(2);
         else if (forward < 21) dto2.setForwardBendingResult(1);
         else dto2.setForwardBendingResult(-1);
         
      } else if (gender.equals("여성")){
         if (forward >= 32) dto2.setForwardBendingResult(5);
         else if (forward >= 29) dto2.setForwardBendingResult(4);
         else if (forward >= 26) dto2.setForwardBendingResult(3);
         else if (forward >= 23) dto2.setForwardBendingResult(2);
         else if (forward < 23) dto2.setForwardBendingResult(1);
         else dto2.setForwardBendingResult(-1);
      
      } else {
          System.out.println("성별 알 수 없음...");
       }
      
      // 브릿지 테스트
      int bridge = Integer.parseInt(req.getParameter("bridge"));
      
      if (gender.equals("남성")) {
         if (bridge >= 58) dto2.setBridgeResult(5);
         else if (bridge >= 52) dto2.setBridgeResult(4);
         else if (bridge >= 44) dto2.setBridgeResult(3);
         else if (bridge >= 37) dto2.setBridgeResult(2);
         else if (bridge < 37) dto2.setBridgeResult(1);
         else dto2.setBridgeResult(-1);
         
      } else if (gender.equals("여성")){
         if (bridge >= 61) dto2.setBridgeResult(5);
         else if (bridge >= 55) dto2.setBridgeResult(4);
         else if (bridge >= 48) dto2.setBridgeResult(3);
         else if (bridge >= 42) dto2.setBridgeResult(2);
         else if (bridge < 42) dto2.setBridgeResult(1);
         else dto2.setBridgeResult(-1);
      
      } else {
          System.out.println("성별 알 수 없음...");
       }
      
      System.out.println("===============================================");
      System.out.println("유연성 dto : " + dto2);
      
      int FlexibilityInsertCnt = dao.FlexibilityResultInsert(dto2);
      System.out.println("FlexibilityInsertCnt : " + FlexibilityInsertCnt);
      System.out.println("===============================================");
      
      //순발력
      AgilityDTO dto3 = new AgilityDTO();
      dto3.setAgilityNo(reserveNo);
      dto3.setLongJump(Float.valueOf(req.getParameter("longJump")));
      dto3.setRun50(Float.valueOf(req.getParameter("run50")));
      
      // 순발력 결과 계산
      // 제자리 멀리 뛰기
      int longJump = Integer.parseInt(req.getParameter("longJump"));
      
      if (gender.equals("남성")) {
         if (longJump >= 58) dto3.setLongJumpResult(5);
         else if (longJump >= 52) dto3.setLongJumpResult(4);
         else if (longJump >= 44) dto3.setLongJumpResult(3);
         else if (longJump >= 37) dto3.setLongJumpResult(2);
         else if (longJump < 37) dto3.setLongJumpResult(1);
         else dto3.setLongJumpResult(-1);
         
      } else if (gender.equals("여성")){
         if (longJump >= 61) dto3.setLongJumpResult(5);
         else if (longJump >= 55) dto3.setLongJumpResult(4);
         else if (longJump >= 48) dto3.setLongJumpResult(3);
         else if (longJump >= 42) dto3.setLongJumpResult(2);
         else if (longJump < 42) dto3.setLongJumpResult(1);
         else dto3.setLongJumpResult(-1);
      
      } else {
          System.out.println("성별 알 수 없음...");
      }
      
      // 50m 달리기
      float run50 = Float.valueOf(req.getParameter("run50"));
      
      if (gender.equals("남성")) {
         if (run50 <= 6.7) dto3.setRun50Result(5);
         else if (run50 <= 7.5) dto3.setRun50Result(4);
         else if (run50 <= 7.9) dto3.setRun50Result(3);
         else if (run50 <= 8.7) dto3.setRun50Result(2);
         else if (run50 > 8.7) dto3.setRun50Result(1);
         else dto3.setRun50Result(-1);
         
      } else if (gender.equals("여성")){
         if (run50 <= 8.8) dto3.setRun50Result(5);
         else if (run50 <= 9.5) dto3.setRun50Result(4);
         else if (run50 <= 10.5) dto3.setRun50Result(3);
         else if (run50 <= 12.2) dto3.setRun50Result(2);
         else if (run50 > 12.2) dto3.setRun50Result(1);
         else dto3.setRun50Result(-1);
      
      } else {
          System.out.println("성별 알 수 없음...");
       }
      
      System.out.println("===============================================");
      System.out.println("순발력 dto : " + dto3);
      
      int AgilityInsertCnt = dao.AgilityResultInsert(dto3);
      System.out.println("AgilityInsertCnt : " + AgilityInsertCnt);
      System.out.println("===============================================");
      
      //근력
      MuscularPowerDTO dto4 = new MuscularPowerDTO();
      dto4.setMuscularPower_no(reserveNo);
      dto4.setSquirt(Float.valueOf(req.getParameter("squirt")));
      dto4.setBenchPress(Float.valueOf(req.getParameter("benchPress")));
      
      // 근력 결과 계산
      float weight1 = Float.valueOf(req.getParameter("weight1"));
      float squirt = Float.valueOf(req.getParameter("squirt"));
      System.out.println("squirt : " + squirt);
      
      if (gender.equals("남성")) {
         if (squirt <= (weight1 * 0.6)) dto4.setSquirtResult(5);
         else if (squirt <= (weight1 * 1.2)) dto4.setSquirtResult(4);
         else if (squirt <= (weight1 * 1.5)) dto4.setSquirtResult(3);
         else if (squirt <= (weight1 * 2.0)) dto4.setSquirtResult(2);
         else if (squirt > (weight1 * 2.0)) dto4.setSquirtResult(1);
         else dto4.setSquirtResult(-1);
         
      } else if (gender.equals("여성")){
         if (squirt <= 0.5) dto4.setSquirtResult(5);
         else if (squirt <= (weight1 * 0.8)) dto4.setSquirtResult(4);
         else if (squirt <= (weight1 * 1.0)) dto4.setSquirtResult(3);
         else if (squirt <= (weight1 * 1.3)) dto4.setSquirtResult(2);
         else if (squirt > (weight1 * 1.3)) dto4.setSquirtResult(1);
         else dto4.setSquirtResult(-1);
      
      } else {
          System.out.println("성별 알 수 없음...");
       }
      
      // 벤치 프레스
      float weight2 = Float.valueOf(req.getParameter("weight2"));
      float bench = Float.valueOf(req.getParameter("benchPress"));
      
      if (gender.equals("남성")) {
         if (bench <= (weight2 * 0.7)) dto4.setBenchPressResult(1);
         else if (bench <= (weight2 * 0.9)) dto4.setBenchPressResult(2);
         else if (bench <= (weight2 * 1.1)) dto4.setBenchPressResult(3);
         else if (bench <= (weight2 * 1.5)) dto4.setBenchPressResult(4);
         else if (bench > (weight2 * 1.5)) dto4.setBenchPressResult(5);
         else dto4.setBenchPressResult(-1);
         
      } else if (gender.equals("여성")){
         if (bench <=(weight2 * 0.5)) dto4.setBenchPressResult(1);
         else if (bench <= (weight2 * 0.7)) dto4.setBenchPressResult(2);
         else if (bench <= (weight2 * 0.8)) dto4.setBenchPressResult(3);
         else if (bench <= (weight2 * 1.0)) dto4.setBenchPressResult(4);
         else if (bench > (weight2 * 1.0)) dto4.setBenchPressResult(5);
         else dto4.setBenchPressResult(-1);
      
      } else {
          System.out.println("성별 알 수 없음...");
       }
      
      System.out.println("===============================================");
      System.out.println("근력 dto : " + dto4);
      
      int MuscularPowerInsertCnt = dao.MuscularPowerResultInsert(dto4);
      System.out.println("MuscularPowerInsertCnt : " + MuscularPowerInsertCnt);
      System.out.println("===============================================");
      
      //근지구력
      MuscularEnduranceDTO dto5 = new MuscularEnduranceDTO();
      dto5.setMuscularEndurance_no(reserveNo);
      dto5.setSitUp(Float.valueOf(req.getParameter("sitUp")));
      dto5.setPushUp(Float.valueOf(req.getParameter("pushUp")));
      
      // 근지구력 결과 계산
      // 윗몸 일으키기
      int sitUp = Integer.parseInt(req.getParameter("sitUp"));
      
      if (gender.equals("남성")) {
         if (sitUp >= 52) dto5.setSitUpResult(5);
         else if (sitUp >= 50) dto5.setSitUpResult(4);
         else if (sitUp >= 48) dto5.setSitUpResult(3);
         else if (sitUp >= 46) dto5.setSitUpResult(2);
         else if (sitUp < 46) dto5.setSitUpResult(1);
         else dto5.setSitUpResult(-1);
         
      } else if (gender.equals("여성")){
         if (sitUp >= 42) dto5.setSitUpResult(5);
         else if (sitUp >= 40) dto5.setSitUpResult(4);
         else if (sitUp >= 38) dto5.setSitUpResult(3);
         else if (sitUp >= 36) dto5.setSitUpResult(2);
         else if (sitUp < 36) dto5.setSitUpResult(1);
         else dto5.setSitUpResult(-1);
      
      } else {
          System.out.println("성별 알 수 없음...");
       }
      
      // 팔굽혀펴기
      int pushUp = Integer.parseInt(req.getParameter("pushUp"));
      
      if (gender.equals("남성")) {
         if (pushUp >= 65) dto5.setPushUpResult(5);
         else if (pushUp >= 57) dto5.setPushUpResult(4);
         else if (pushUp >= 49) dto5.setPushUpResult(3);
         else if (pushUp >= 41) dto5.setPushUpResult(2);
         else if (pushUp < 41) dto5.setPushUpResult(1);
         else dto5.setPushUpResult(-1);
         
      } else if (gender.equals("여성")){
         if (pushUp >= 55) dto5.setPushUpResult(5);
         else if (pushUp >= 47) dto5.setPushUpResult(4);
         else if (pushUp >= 39) dto5.setPushUpResult(3);
         else if (pushUp >= 31) dto5.setPushUpResult(2);
         else if (pushUp < 31) dto5.setPushUpResult(1);
         else dto5.setPushUpResult(-1);
      
      } else {
          System.out.println("성별 알 수 없음...");
       }
      
      System.out.println("===============================================");
      System.out.println("근지구력 dto : " + dto5);
      
      int MuscularEnduranceInsertCnt = dao.MuscularEnduranceResultInsert(dto5);
      System.out.println("MuscularEnduranceInsertCnt : " + MuscularEnduranceInsertCnt);
      System.out.println("===============================================");
      
      //민첩성
      QuicknessDTO dto6 = new QuicknessDTO();
      dto6.setQuickness_no(reserveNo);
      dto6.setSideStep(Float.valueOf(req.getParameter("sideStep")));
      dto6.setBurpeeTest(Float.valueOf(req.getParameter("burpeeTest")));
      
      // 민첩성 결과 계산
      // 사이드 스텝
      int sideStep = Integer.parseInt(req.getParameter("sideStep"));
      
      if (gender.equals("남성")) {
         if (sideStep >= 45) dto6.setSideStepResult(5);
         else if (sideStep >= 43) dto6.setSideStepResult(4);
         else if (sideStep >= 41) dto6.setSideStepResult(3);
         else if (sideStep >= 39) dto6.setSideStepResult(2);
         else if (sideStep < 39) dto6.setSideStepResult(1);
         else dto6.setSideStepResult(-1);
         
      } else if (gender.equals("여성")){
         if (sideStep >= 40) dto6.setSideStepResult(5);
         else if (sideStep >= 38) dto6.setSideStepResult(4);
         else if (sideStep >= 36) dto6.setSideStepResult(3);
         else if (sideStep >= 34) dto6.setSideStepResult(2);
         else if (sideStep < 34) dto6.setSideStepResult(1);
         else dto6.setSideStepResult(-1);
      
      } else {
          System.out.println("성별 알 수 없음...");
       }
      
      // 버피 테스트
      int burpeeTest = Integer.parseInt(req.getParameter("burpeeTest"));
      
      if (gender.equals("남성")) {
         if (burpeeTest >= 16) dto6.setBurpeeTestResult(5);
         else if (burpeeTest >= 15) dto6.setBurpeeTestResult(4);
         else if (burpeeTest >= 14) dto6.setBurpeeTestResult(3);
         else if (burpeeTest >= 13) dto6.setBurpeeTestResult(2);
         else if (burpeeTest < 13) dto6.setBurpeeTestResult(1);
         else dto6.setBurpeeTestResult(-1);
         
      } else if (gender.equals("여성")){
         if (burpeeTest >= 12) dto6.setBurpeeTestResult(5);
         else if (burpeeTest >= 11) dto6.setBurpeeTestResult(4);
         else if (burpeeTest >= 10) dto6.setBurpeeTestResult(3);
         else if (burpeeTest >= 9) dto6.setBurpeeTestResult(2);
         else if (burpeeTest < 9) dto6.setBurpeeTestResult(1);
         else dto6.setBurpeeTestResult(-1);
      
      } else {
          System.out.println("성별 알 수 없음...");
       }
      
      System.out.println("===============================================");
      System.out.println("민첩성 dto : " + dto6);
      
      int QuicknessInsertCnt = dao.QuicknessResultInsert(dto6);
      System.out.println("QuicknessInsertCnt : " + QuicknessInsertCnt);
      System.out.println("===============================================");
      
      // 운동검사 테이블에 데이터 추가
      PhysicalDTO dto7 = new PhysicalDTO();
      dto7.setPhysicalNo(reserveNo);
      dto7.setCardioEnduranceNo(reserveNo);
      dto7.setFlexibilityNo(reserveNo);
      dto7.setAgilityNo(reserveNo);
      dto7.setMuscularPowerNo(reserveNo);
      dto7.setMuscularEnduranceNo(reserveNo);
      dto7.setQuicknessNo(reserveNo);
      dto7.setTestExpense(250000);
      dto7.setId((String)req.getSession().getAttribute("memberId"));
      
      System.out.println("===============================================");
      System.out.println("운동검사 dto : " + dto7);
      
      int PhysicalInsertCnt = dao.PhysicalInsert(dto7);
      System.out.println("PhysicalInsertCnt : " + PhysicalInsertCnt);
      System.out.println("===============================================");
      
      if (CardioEnduranceInsertCnt == 1 && FlexibilityInsertCnt == 1 && AgilityInsertCnt == 1 
            && MuscularPowerInsertCnt == 1 && MuscularEnduranceInsertCnt == 1 && QuicknessInsertCnt == 1
            && PhysicalInsertCnt == 1) {
         int updateCnt = dao.showUpdate1(reserveNo);
         System.out.println("update : " + updateCnt);
         
        int memberNo = Integer.parseInt(req.getParameter("memberNo"));
		System.out.println("memberNo : " + memberNo);
        
		// 검진이력 Y로 변경
		int updateEx = dao.checksUpdate(memberNo);
		System.out.println("updateEx : " + updateEx);
         
         model.addAttribute("updateCnt", updateCnt);
      } else{
         System.out.println("show='n'으로 못 바꿈");
      }
      
      model.addAttribute("CardioEnduranceInsertCnt", CardioEnduranceInsertCnt);
      model.addAttribute("FlexibilityInsertCnt", FlexibilityInsertCnt);
      model.addAttribute("AgilityInsertCnt", AgilityInsertCnt);
      model.addAttribute("MuscularPowerDTO", MuscularPowerInsertCnt);
      model.addAttribute("MuscularEnduranceInsertCnt", MuscularEnduranceInsertCnt);
      model.addAttribute("QuicknessInsertCnt", QuicknessInsertCnt);
   }

	//의료진_심리검사설문지 불러오기 select
	public void surveyResult(HttpServletRequest req, Model model) {
		System.out.println("D_service => surveyResult");
		
		int mentalNo = Integer.parseInt(req.getParameter("reserveNo"));
		System.out.println("mentalNo : " + mentalNo);
		
		MentalDTO dto = dao.getMentalSurveyResult(mentalNo);

		System.out.println("설문결과 dto : " + dto);
		
		model.addAttribute("dto1", dto);
	}
	
	
	//의료진_심리검사설문지 불러오기 select > 차트용
	public void surveyResult2(HttpServletRequest req, Model model) {
		System.out.println("D_service => surveyResult2");
		
		int mentalNo = Integer.parseInt(req.getParameter("reserveNo"));
		System.out.println("mentalNo : " + mentalNo);
		
		MentalDTO dto2 	= dao.getMentalSurveyResult2(mentalNo);

		System.out.println("설문결과 list : " + dto2);
		
		model.addAttribute("dto2", dto2);
	}
	
	//의료진_심리검사등록 페이지 insert
	public void mentalResultInsert(HttpServletRequest req, Model model) {
		System.out.println("D_service => mentalResultInsert");
		

		int reserveNo = Integer.parseInt(req.getParameter("reserveNo"));
		System.out.println("reserveNo : " + reserveNo);
		
		String comments = req.getParameter("comments");
		System.out.println("comments : " + comments);
		
		MentalDTO dto = new MentalDTO();
		dto.setMentalNo(reserveNo);

		dto.setComments(comments);
		
		System.out.println("소견서 dto : " + dto);
		
		int insertCnt = dao.mentalResultInsert(dto);
		
		if (insertCnt == 1) {
			int updateCnt = dao.showUpdate2(reserveNo);
			System.out.println("update : " + updateCnt);
			
			int memberNo = Integer.parseInt(req.getParameter("reserveNo"));
	   		System.out.println("memberNo : " + memberNo);
			
			// 검진이력 Y로 변경
			int updateEx = dao.checksUpdate(memberNo);
			System.out.println("updateEx : " + updateEx);
			
			model.addAttribute("updateCnt", updateCnt);
		}else{
			System.out.println("show='n'으로 못 바꿈");
		}
		
		model.addAttribute("insertCnt", insertCnt);
		
	}
		

	
	// 운동검사 정보 가져오기
	public void getPhysicalResult(HttpServletRequest req, Model model) {
		System.out.println("D_service => getPhysicalResult");
		
		int reserveNo = Integer.parseInt(req.getParameter("reserveNo"));
		// 심폐지구력 가져오기
		CardioEnduranceDTO dto1 = dao.getPhysicalCardio(reserveNo);
		
		// 유연성 가져오기
		FlexibilityDTO dto2 = dao.getPhysicalFlexibility(reserveNo);
		
		// 순발력
		AgilityDTO dto3 = dao.getPhysicalAgility(reserveNo);
		System.out.println("dto3 : " + dto3);
		// 근력
		MuscularPowerDTO dto4 = dao.getPhysicalMuscularPower(reserveNo);
		
		// 근지구력
		MuscularEnduranceDTO dto5 = dao.getPhysicalMuscularEndurance(reserveNo);
		
		// 민첩성
		QuicknessDTO dto6 = dao.getPhysicalQuickness(reserveNo);
		
		model.addAttribute("dto1", dto1);
		model.addAttribute("dto2", dto2);
		model.addAttribute("dto3", dto3);
		model.addAttribute("dto4", dto4);
		model.addAttribute("dto5", dto5);
		model.addAttribute("dto6", dto6);
		model.addAttribute("reserveNo",reserveNo);
	}
	
	// 담당회원정보 > 운동검사 상세 수정 액션
	public void customerDetailPhysicalModify(HttpServletRequest req, Model model) {
		System.out.println("D_service => customerDetailPhysicalModify");
		
		int reserveNo = Integer.parseInt(req.getParameter("reserveNo"));
		
	      System.out.println("reserveNo : " + reserveNo);
	      
	      //심페지구력
	      CardioEnduranceDTO dto1 = new CardioEnduranceDTO();
	      dto1.setCardioEnduranceNo(reserveNo);
	      
	      float minute = Integer.parseInt(req.getParameter("run3km1"));
	      float second = Integer.parseInt(req.getParameter("run3km2"));
	      float run3km = (minute * 60) + second;
	      dto1.setRun3km(run3km);
	      
	      float balke = Integer.parseInt(req.getParameter("balkeProtocol"));
	      dto1.setBalkeProtocol(Integer.parseInt(req.getParameter("balkeProtocol")));
	      
	      // 심페지구력 결과 계산
	      // 3km 달리기
	      String gender = req.getParameter("gender");
	      // String gender = "남성";
	      
	      if (gender.equals("남성")) {
	         if (run3km <= 858) dto1.setRun3kmResult(5);
	         else if (run3km <= 937) dto1.setRun3kmResult(4);
	         else if (run3km <= 1017) dto1.setRun3kmResult(3);
	         else if (run3km <= 1096) dto1.setRun3kmResult(2);
	         else if (run3km > 1096) dto1.setRun3kmResult(1);
	         else dto1.setRun3kmResult(-1);
	         
	      } else if (gender.equals("여성")){
	         if (run3km <= 1030) dto1.setRun3kmResult(5);
	         else if (run3km <= 1125) dto1.setRun3kmResult(4);
	         else if (run3km <= 1220) dto1.setRun3kmResult(3);
	         else if (run3km <= 1315) dto1.setRun3kmResult(2);
	         else if (run3km > 1315) dto1.setRun3kmResult(1);
	         else dto1.setRun3kmResult(-1);
	         
	      } else {
	         System.out.println("성별 알 수 없음...");
	      }
	      
	      // Balke 프로토콜
	      if (gender.equals("남성")) {
	         if (balke >= 20) dto1.setBalkeProtocolResult(5);
	         else if (balke >= 18) dto1.setBalkeProtocolResult(4);
	         else if (balke >= 16) dto1.setBalkeProtocolResult(3);
	         else if (balke >= 13) dto1.setBalkeProtocolResult(2);
	         else if (balke < 13) dto1.setBalkeProtocolResult(1);
	         else dto1.setBalkeProtocolResult(-1);
	         
	      } else if (gender.equals("여성")){
	         if (balke >= 18) dto1.setBalkeProtocolResult(5);
	         else if (balke >= 16) dto1.setBalkeProtocolResult(4);
	         else if (balke >= 14) dto1.setBalkeProtocolResult(3);
	         else if (balke >= 12) dto1.setBalkeProtocolResult(2);
	         else if (balke < 12) dto1.setBalkeProtocolResult(1);
	         else dto1.setBalkeProtocolResult(-1);
	         
	      } else {
	         System.out.println("성별 알 수 없음...");
	      }
	      
	      System.out.println("===============================================");
	      System.out.println("심페지구력 dto : " + dto1);
	      Map<String, Object> map1 = new HashMap<String, Object>();
			map1.put("dto1", dto1);
			map1.put("reserveNo", reserveNo);	
			
	      int CardioEnduranceUpdateCnt = dao.CardioEnduranceResultUpdate(map1);
	      System.out.println("CardioEnduranceUpdateCnt : " + CardioEnduranceUpdateCnt);
	      System.out.println("===============================================");
	      
	      //유연성
	      FlexibilityDTO dto2 = new FlexibilityDTO();
	      dto2.setFlexibilityNo(reserveNo);
	      dto2.setForwardBending(Integer.parseInt(req.getParameter("forwardBending")));
	      dto2.setBridge(Integer.parseInt(req.getParameter("bridge")));
	      
	      // 유연성 결과 계산
	      // 앞으로 굽히기
	      int forward = Integer.parseInt(req.getParameter("forwardBending"));
	      
	      if (gender.equals("남성")) {
	         if (forward >= 30) dto2.setForwardBendingResult(5);
	         else if (forward >= 27) dto2.setForwardBendingResult(4);
	         else if (forward >= 24) dto2.setForwardBendingResult(3);
	         else if (forward >= 21) dto2.setForwardBendingResult(2);
	         else if (forward < 21) dto2.setForwardBendingResult(1);
	         else dto2.setForwardBendingResult(-1);
	         
	      } else if (gender.equals("여성")){
	         if (forward >= 32) dto2.setForwardBendingResult(5);
	         else if (forward >= 29) dto2.setForwardBendingResult(4);
	         else if (forward >= 26) dto2.setForwardBendingResult(3);
	         else if (forward >= 23) dto2.setForwardBendingResult(2);
	         else if (forward < 23) dto2.setForwardBendingResult(1);
	         else dto2.setForwardBendingResult(-1);
	      
	      }
	      
	      // 브릿지 테스트
	      int bridge = Integer.parseInt(req.getParameter("bridge"));
	      
	      if (gender.equals("남성")) {
	         if (bridge >= 58) dto2.setBridgeResult(5);
	         else if (bridge >= 52) dto2.setBridgeResult(4);
	         else if (bridge >= 44) dto2.setBridgeResult(3);
	         else if (bridge >= 37) dto2.setBridgeResult(2);
	         else if (bridge < 37) dto2.setBridgeResult(1);
	         else dto2.setBridgeResult(-1);
	         
	      } else if (gender.equals("여성")){
	         if (bridge >= 61) dto2.setBridgeResult(5);
	         else if (bridge >= 55) dto2.setBridgeResult(4);
	         else if (bridge >= 48) dto2.setBridgeResult(3);
	         else if (bridge >= 42) dto2.setBridgeResult(2);
	         else if (bridge < 42) dto2.setBridgeResult(1);
	         else dto2.setBridgeResult(-1);
	      
	      }
	      
	      System.out.println("===============================================");
	      System.out.println("유연성 dto : " + dto2);
	      
	      Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("dto2", dto2);
			map2.put("reserveNo", reserveNo);	
			
	      int FlexibilityUpdateCnt = dao.FlexibilityResultUpdate(map2);
	      System.out.println("FlexibilityUpdateCnt : " + FlexibilityUpdateCnt);
	      System.out.println("===============================================");
	      
	      //순발력
	      AgilityDTO dto3 = new AgilityDTO();
	      dto3.setAgilityNo(reserveNo);
	      dto3.setLongJump(Integer.parseInt(req.getParameter("longJump")));
	      dto3.setRun50(Integer.parseInt(req.getParameter("run50")));
	      
	      // 순발력 결과 계산
	      // 제자리 멀리 뛰기
	      int longJump = Integer.parseInt(req.getParameter("longJump"));
	      
	      if (gender.equals("남성")) {
	         if (longJump >= 58) dto3.setLongJumpResult(5);
	         else if (longJump >= 52) dto3.setLongJumpResult(4);
	         else if (longJump >= 44) dto3.setLongJumpResult(3);
	         else if (longJump >= 37) dto3.setLongJumpResult(2);
	         else if (longJump < 37) dto3.setLongJumpResult(1);
	         else dto3.setLongJumpResult(-1);
	         
	      } else if (gender.equals("여성")){
	         if (longJump >= 61) dto3.setLongJumpResult(5);
	         else if (longJump >= 55) dto3.setLongJumpResult(4);
	         else if (longJump >= 48) dto3.setLongJumpResult(3);
	         else if (longJump >= 42) dto3.setLongJumpResult(2);
	         else if (longJump < 42) dto3.setLongJumpResult(1);
	         else dto3.setLongJumpResult(-1);
	      
	      }
	      
	      // 50m 달리기
	      float run50 = Integer.parseInt(req.getParameter("run50"));
	      
	      if (gender.equals("남성")) {
	         if (run50 <= 6.7) dto3.setRun50Result(5);
	         else if (run50 <= 7.5) dto3.setRun50Result(4);
	         else if (run50 <= 7.9) dto3.setRun50Result(3);
	         else if (run50 <= 8.7) dto3.setRun50Result(2);
	         else if (run50 > 8.7) dto3.setRun50Result(1);
	         else dto3.setRun50Result(-1);
	         
	      } else if (gender.equals("여성")){
	         if (run50 <= 8.8) dto3.setRun50Result(5);
	         else if (run50 <= 9.5) dto3.setRun50Result(4);
	         else if (run50 <= 10.5) dto3.setRun50Result(3);
	         else if (run50 <= 12.2) dto3.setRun50Result(2);
	         else if (run50 > 12.2) dto3.setRun50Result(1);
	         else dto3.setRun50Result(-1);
	      
	      }
	      
	      
	      System.out.println("===============================================");
	      System.out.println("순발력 dto : " + dto3);
	      Map<String, Object> map3 = new HashMap<String, Object>();
			map3.put("dto3", dto3);
			map3.put("reserveNo", reserveNo);	
			
	      int AgilityInsertCnt = dao.AgilityResultUpdate(map3);
	      System.out.println("AgilityInsertCnt : " + AgilityInsertCnt);
	      System.out.println("===============================================");
	      
	      //근력
	      MuscularPowerDTO dto4 = new MuscularPowerDTO();
	      dto4.setMuscularPower_no(reserveNo);
	      dto4.setSquirt(Integer.parseInt(req.getParameter("squirt")));
	      dto4.setBenchPress(Integer.parseInt(req.getParameter("benchPress")));
	      
	      // 근력 결과 계산
	      float weight1 = Integer.parseInt(req.getParameter("weight1"));
	      float squirt = Float.valueOf(req.getParameter("squirt"));
	      System.out.println("스쿼트 : " + squirt);
	      System.out.println("gender : " + gender);
	      
	      if (gender.equals("남성")) {
	         if (squirt <= (weight1 * 0.6)) dto4.setSquirtResult(5);
	         else if (squirt <= (weight1 * 1.2)) dto4.setSquirtResult(4);
	         else if (squirt <= (weight1 * 1.5)) dto4.setSquirtResult(3);
	         else if (squirt <= (weight1 * 2.0)) dto4.setSquirtResult(2);
	         else if (squirt > (weight1 * 2.0)) dto4.setSquirtResult(1);
	         else dto4.setSquirtResult(-1);
	        
	      } else if (gender.equals("여성")){
	         if (squirt <= 0.5) dto4.setSquirtResult(5);
	         else if (squirt <= (weight1 * 0.8)) dto4.setSquirtResult(4);
	         else if (squirt <= (weight1 * 1.0)) dto4.setSquirtResult(3);
	         else if (squirt <= (weight1 * 1.3)) dto4.setSquirtResult(2);
	         else if (squirt > (weight1 * 1.3)) dto4.setSquirtResult(1);
	         else dto4.setSquirtResult(-1);
	         
	      }
	      System.out.println("squirtResult : " + dto4.getSquirtResult());
	      // 벤치 프레스
	      float weight2 = Integer.parseInt(req.getParameter("weight2"));
	      float bench = Integer.parseInt(req.getParameter("benchPress"));
	      
	      if (gender.equals("남성")) {
	         if (bench <= (weight2 * 0.7)) dto4.setBenchPressResult(5);
	         else if (bench <= (weight2 * 0.9)) dto4.setBenchPressResult(4);
	         else if (bench <= (weight2 * 1.1)) dto4.setBenchPressResult(3);
	         else if (bench <= (weight2 * 1.5)) dto4.setBenchPressResult(2);
	         else if (bench > (weight2 * 1.5)) dto4.setBenchPressResult(1);
	         else dto4.setBenchPressResult(-1);
	         
	      } else if (gender.equals("여성")){
	         if (bench <=(weight2 * 0.5)) dto4.setBenchPressResult(5);
	         else if (bench <= (weight2 * 0.7)) dto4.setBenchPressResult(4);
	         else if (bench <= (weight2 * 0.8)) dto4.setBenchPressResult(3);
	         else if (bench <= (weight2 * 1.0)) dto4.setBenchPressResult(2);
	         else if (bench > (weight2 * 1.0)) dto4.setBenchPressResult(1);
	         else dto4.setBenchPressResult(-1);
	      
	      }
	      
	      System.out.println("===============================================");
	      System.out.println("근력 dto : " + dto4);
	      
	      Map<String, Object> map4 = new HashMap<String, Object>();
			map4.put("dto4", dto4);
			map4.put("reserveNo", reserveNo);	
			
	      int MuscularPowerInsertCnt = dao.MuscularPowerResultUpdate(map4);
	      System.out.println("MuscularPowerInsertCnt : " + MuscularPowerInsertCnt);
	      System.out.println("===============================================");
	      
	      //근지구력
	      MuscularEnduranceDTO dto5 = new MuscularEnduranceDTO();
	      dto5.setMuscularEndurance_no(reserveNo);
	      dto5.setSitUp(Integer.parseInt(req.getParameter("sitUp")));
	      dto5.setPushUp(Integer.parseInt(req.getParameter("pushUp")));
	      
	      // 근지구력 결과 계산
	      // 윗몸 일으키기
	      int sitUp = Integer.parseInt(req.getParameter("sitUp"));
	      
	      if (gender.equals("남성")) {
	         if (sitUp >= 52) dto5.setSitUpResult(5);
	         else if (sitUp >= 50) dto5.setSitUpResult(4);
	         else if (sitUp >= 48) dto5.setSitUpResult(3);
	         else if (sitUp >= 46) dto5.setSitUpResult(2);
	         else if (sitUp < 46) dto5.setSitUpResult(1);
	         else dto5.setSitUpResult(-1);
	         
	      } else if (gender.equals("여성")){
	         if (sitUp >= 42) dto5.setSitUpResult(5);
	         else if (sitUp >= 40) dto5.setSitUpResult(4);
	         else if (sitUp >= 38) dto5.setSitUpResult(3);
	         else if (sitUp >= 36) dto5.setSitUpResult(2);
	         else if (sitUp < 36) dto5.setSitUpResult(1);
	         else dto5.setSitUpResult(-1);
	      
	      }
	      
	      // 팔굽혀펴기
	      int pushUp = Integer.parseInt(req.getParameter("pushUp"));
	      
	      if (gender.equals("남성")) {
	         if (pushUp >= 65) dto5.setPushUpResult(5);
	         else if (pushUp >= 57) dto5.setPushUpResult(4);
	         else if (pushUp >= 49) dto5.setPushUpResult(3);
	         else if (pushUp >= 41) dto5.setPushUpResult(2);
	         else if (pushUp < 41) dto5.setPushUpResult(1);
	         else dto5.setPushUpResult(-1);
	         
	      } else if (gender.equals("여성")){
	         if (pushUp >= 55) dto5.setPushUpResult(5);
	         else if (pushUp >= 47) dto5.setPushUpResult(4);
	         else if (pushUp >= 39) dto5.setPushUpResult(3);
	         else if (pushUp >= 31) dto5.setPushUpResult(2);
	         else if (pushUp < 31) dto5.setPushUpResult(1);
	         else dto5.setPushUpResult(-1);
	      
	      }
	      
	      
	      
	      System.out.println("===============================================");
	      System.out.println("근지구력 dto : " + dto5);
	      
	      Map<String, Object> map5 = new HashMap<String, Object>();
			map5.put("dto5", dto5);
			map5.put("reserveNo", reserveNo);	
			
	      int MuscularEnduranceInsertCnt = dao.MuscularEnduranceResultUpdate(map5);
	      System.out.println("MuscularEnduranceInsertCnt : " + MuscularEnduranceInsertCnt);
	      System.out.println("===============================================");
	      
	      //민첩성
	      QuicknessDTO dto6 = new QuicknessDTO();
	      dto6.setQuickness_no(reserveNo);
	      dto6.setSideStep(Integer.parseInt(req.getParameter("sideStep")));
	      dto6.setBurpeeTest(Integer.parseInt(req.getParameter("burpeeTest")));
	      
	      // 민첩성 결과 계산
	      // 사이드 스텝
	      int sideStep = Integer.parseInt(req.getParameter("sideStep"));
	      
	      if (gender.equals("남성")) {
	         if (sideStep >= 45) dto6.setSideStepResult(5);
	         else if (sideStep >= 43) dto6.setSideStepResult(4);
	         else if (sideStep >= 41) dto6.setSideStepResult(3);
	         else if (sideStep >= 39) dto6.setSideStepResult(2);
	         else if (sideStep < 39) dto6.setSideStepResult(1);
	         else dto6.setSideStepResult(-1);
	         
	      } else if (gender.equals("여성")){
	         if (sideStep >= 40) dto5.setSitUpResult(5);
	         else if (sideStep >= 38) dto6.setSideStepResult(4);
	         else if (sideStep >= 36) dto6.setSideStepResult(3);
	         else if (sideStep >= 34) dto6.setSideStepResult(2);
	         else if (sideStep < 34) dto6.setSideStepResult(1);
	         else dto6.setSideStepResult(-1);
	      
	      }
	      
	      // 버피 테스트
	      int burpeeTest = Integer.parseInt(req.getParameter("burpeeTest"));
	      
	      if (gender.equals("남성")) {
	         if (burpeeTest >= 16) dto6.setBurpeeTestResult(5);
	         else if (burpeeTest >= 15) dto6.setBurpeeTestResult(4);
	         else if (burpeeTest >= 14) dto6.setBurpeeTestResult(3);
	         else if (burpeeTest >= 13) dto6.setBurpeeTestResult(2);
	         else if (burpeeTest < 13) dto6.setBurpeeTestResult(1);
	         else dto6.setBurpeeTestResult(-1);
	         
	      } else if (gender.equals("여성")){
	         if (burpeeTest >= 12) dto6.setBurpeeTestResult(5);
	         else if (burpeeTest >= 11) dto6.setBurpeeTestResult(4);
	         else if (burpeeTest >= 10) dto6.setBurpeeTestResult(3);
	         else if (burpeeTest >= 9) dto6.setBurpeeTestResult(2);
	         else if (burpeeTest < 9) dto6.setBurpeeTestResult(1);
	         else dto6.setBurpeeTestResult(-1);
	      
	      }
	      
	      System.out.println("===============================================");
	      System.out.println("민첩성 dto : " + dto6);
	      
	      Map<String, Object> map6 = new HashMap<String, Object>();
			map6.put("dto6", dto6);
			map6.put("reserveNo", reserveNo);
			
	      int QuicknessInsertCnt = dao.QuicknessResultUpdate(map6);
	      System.out.println("QuicknessInsertCnt : " + QuicknessInsertCnt);
	      System.out.println("===============================================");
	      
	      model.addAttribute("CardioEnduranceInsertCnt", CardioEnduranceUpdateCnt);
	      model.addAttribute("FlexibilityInsertCnt", FlexibilityUpdateCnt);
	      model.addAttribute("AgilityInsertCnt", AgilityInsertCnt);
	      model.addAttribute("MuscularPowerDTO", MuscularPowerInsertCnt);
	      model.addAttribute("MuscularEnduranceInsertCnt", MuscularEnduranceInsertCnt);
	      model.addAttribute("QuicknessInsertCnt", QuicknessInsertCnt);
		
	}
	
}