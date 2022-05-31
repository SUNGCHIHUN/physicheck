package com.teampj.physicheck.vue.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.teampj.physicheck.dto.AgilityDTO;
import com.teampj.physicheck.dto.CardioEnduranceDTO;
import com.teampj.physicheck.dto.FlexibilityDTO;
import com.teampj.physicheck.dto.MuscularEnduranceDTO;
import com.teampj.physicheck.dto.MuscularPowerDTO;
import com.teampj.physicheck.dto.QuicknessDTO;
import com.teampj.physicheck.dto.ReserveDTO;
import com.teampj.physicheck.vue.dao.PhysicalMapper;
import com.teampj.physicheck.vue.repository.AgilityRepository;
import com.teampj.physicheck.vue.repository.CardioEnduranceRepository;
import com.teampj.physicheck.vue.repository.FlexibilityRepository;
import com.teampj.physicheck.vue.repository.MuscularEnduranceRepository;
import com.teampj.physicheck.vue.repository.MuscularPowerRepository;
import com.teampj.physicheck.vue.repository.PhysicalRepository;
import com.teampj.physicheck.vue.repository.QuicknessRepository;
import com.teampj.physicheck.vue.repository.ReserveRepository;
import com.teampj.physicheck.vue.vo.AgilityVO;
import com.teampj.physicheck.vue.vo.CardioEnduranceVO;
import com.teampj.physicheck.vue.vo.ExerciseVO;
import com.teampj.physicheck.vue.vo.FlexibilityVO;
import com.teampj.physicheck.vue.vo.MuscularEnduranceVO;
import com.teampj.physicheck.vue.vo.MuscularPowerVO;
import com.teampj.physicheck.vue.vo.PhysicalMemberVO;
import com.teampj.physicheck.vue.vo.PhysicalVO;
import com.teampj.physicheck.vue.vo.QuicknessVO;
import com.teampj.physicheck.vue.vo.ReserveVO;

@Service
public class PhysicalService {
	
	@Autowired
	PhysicalMapper dao;
	
	// 운동검사
	@Autowired
	PhysicalRepository physicalRepo;
	
	// 심폐지구력
	@Autowired
	CardioEnduranceRepository cardioEnduranceRepo;
	
	// 유연성
	@Autowired
	FlexibilityRepository flexibilityRepo;
	
	// 민첩성
	@Autowired
	AgilityRepository agilityRepo;
	
	// 근력
	@Autowired
	MuscularPowerRepository muscularPowerRepo;
	
	// 근지구력
	@Autowired
	MuscularEnduranceRepository muscularEnduranceRepo;
	
	// 순발력
	@Autowired
	QuicknessRepository quicknessRepo;
	
	// 예약
	@Autowired
	ReserveRepository reserveRepo;
	
	// 운동검사 등록 대기목록 조회
	public List<ReserveDTO> getVueReserveList() {
		System.out.println("getVueReserveList()");

		List<ReserveDTO> list = dao.getVueReserveList();
		
		return list;
	}
	
	// 운동검사 등록 처리
	public int insertVueExerciseResult(int reserveNo, ExerciseVO vo, HttpServletRequest req) {

	      //심페지구력
	      CardioEnduranceVO vo1 = new CardioEnduranceVO();
	      vo1.setCardioenduranceno(reserveNo);
	      
	      float minute = vo.getRun3km1();
	      float second = vo.getRun3km2();
	      float run3km = (minute * 60) + second;
	      vo1.setRun3km(run3km);
	      
	      float balke = vo.getBalke();
	      vo1.setBalkeprotocol(balke);
	      
	      // 심페지구력 결과 계산
	      // 3km 달리기
	      String gender = vo.getGender();

	      if (gender.equals("남성")) {
	         if (run3km <= 858) vo1.setRun3kmresult(5);
	         else if (run3km <= 937) vo1.setRun3kmresult(4);
	         else if (run3km <= 1017) vo1.setRun3kmresult(3);
	         else if (run3km <= 1096) vo1.setRun3kmresult(2);
	         else if (run3km > 1096) vo1.setRun3kmresult(1);
	         else vo1.setRun3kmresult(-1);
	         
	      } else if (gender.equals("여성")){
	         if (run3km <= 1030) vo1.setRun3kmresult(5);
	         else if (run3km <= 1125) vo1.setRun3kmresult(4);
	         else if (run3km <= 1220) vo1.setRun3kmresult(3);
	         else if (run3km <= 1315) vo1.setRun3kmresult(2);
	         else if (run3km > 1315) vo1.setRun3kmresult(1);
	         else vo1.setRun3kmresult(-1);
	         
	      } else {
	         System.out.println("성별 알 수 없음...");
	      }
	      
	      // Balke 프로토콜
	      if (gender.equals("남성")) {
	         if (balke >= 20) vo1.setBalkeprotocolresult(5);
	         else if (balke >= 18) vo1.setBalkeprotocolresult(4);
	         else if (balke >= 16) vo1.setBalkeprotocolresult(3);
	         else if (balke >= 13) vo1.setBalkeprotocolresult(2);
	         else if (balke < 13) vo1.setBalkeprotocolresult(1);
	         else vo1.setBalkeprotocolresult(-1);
	         
	      } else if (gender.equals("여성")){
	         if (balke >= 18) vo1.setBalkeprotocolresult(5);
	         else if (balke >= 16) vo1.setBalkeprotocolresult(4);
	         else if (balke >= 14) vo1.setBalkeprotocolresult(3);
	         else if (balke >= 12) vo1.setBalkeprotocolresult(2);
	         else if (balke < 12) vo1.setBalkeprotocolresult(1);
	         else vo1.setBalkeprotocolresult(-1);
	         
	      } else {
	         System.out.println("성별 알 수 없음...");
	      }
	      
	      System.out.println("===============================================");
	      System.out.println("심페지구력 vo : " + vo1);
	      
	      CardioEnduranceVO cardioEnduranceResult = cardioEnduranceRepo.save(vo1);
	      System.out.println("cardioEnduranceResult : " + cardioEnduranceResult);
	      System.out.println("===============================================");
	      
	      //유연성
	      FlexibilityVO vo2 = new FlexibilityVO();
	      vo2.setFlexibilityno(reserveNo);
	      vo2.setForwardbending(vo.getForward());
	      vo2.setBridge(vo.getBridge());
	      
	      // 유연성 결과 계산
	      // 앞으로 굽히기
	      int forward = (int) vo.getForward();
	      
	      if (gender.equals("남성")) {
	         if (forward >= 30) vo2.setForwardbendingresult(5);
	         else if (forward >= 27) vo2.setBridgeresult(4);
	         else if (forward >= 24) vo2.setForwardbendingresult(3);
	         else if (forward >= 21) vo2.setForwardbendingresult(2);
	         else if (forward < 21) vo2.setForwardbendingresult(1);
	         else vo2.setForwardbendingresult(-1);
	         
	      } else if (gender.equals("여성")){
	         if (forward >= 32) vo2.setForwardbendingresult(5);
	         else if (forward >= 29) vo2.setForwardbendingresult(4);
	         else if (forward >= 26) vo2.setForwardbendingresult(3);
	         else if (forward >= 23) vo2.setForwardbendingresult(2);
	         else if (forward < 23) vo2.setForwardbendingresult(1);
	         else vo2.setForwardbendingresult(-1);
	      
	      } else {
	          System.out.println("성별 알 수 없음...");
	       }
	      
	      // 브릿지 테스트
	      int bridge = (int) vo.getBridge();
	      
	      if (gender.equals("남성")) {
	         if (bridge >= 58) vo2.setBridgeresult(5);
	         else if (bridge >= 52) vo2.setBridgeresult(4);
	         else if (bridge >= 44) vo2.setBridgeresult(3);
	         else if (bridge >= 37) vo2.setBridgeresult(2);
	         else if (bridge < 37) vo2.setBridgeresult(1);
	         else vo2.setBridgeresult(-1);
	         
	      } else if (gender.equals("여성")){
	         if (bridge >= 61) vo2.setBridgeresult(5);
	         else if (bridge >= 55) vo2.setBridgeresult(4);
	         else if (bridge >= 48) vo2.setBridgeresult(3);
	         else if (bridge >= 42) vo2.setBridgeresult(2);
	         else if (bridge < 42) vo2.setBridgeresult(1);
	         else vo2.setBridgeresult(-1);
	      
	      } else {
	          System.out.println("성별 알 수 없음...");
	       }
	      
	      System.out.println("===============================================");
	      System.out.println("유연성 vo : " + vo2);
	      
	      FlexibilityVO flexibilityResult = flexibilityRepo.save(vo2);
	      System.out.println("flexibilityResult : " + flexibilityResult);
	      System.out.println("===============================================");
	      
	      //순발력
	      AgilityVO vo3 = new AgilityVO();
	      vo3.setAgilityno(reserveNo);
	      vo3.setLongjump(vo.getLongJump());
	      vo3.setRun50(vo.getRun50());
	      
	      // 순발력 결과 계산
	      // 제자리 멀리 뛰기
	      int longJump = (int) vo.getLongJump();
	      
	      if (gender.equals("남성")) {
	         if (longJump >= 58) vo3.setLongjumpresult(5);
	         else if (longJump >= 52) vo3.setLongjumpresult(4);
	         else if (longJump >= 44) vo3.setLongjumpresult(3);
	         else if (longJump >= 37) vo3.setLongjumpresult(2);
	         else if (longJump < 37) vo3.setLongjumpresult(1);
	         else vo3.setLongjumpresult(-1);
	         
	      } else if (gender.equals("여성")){
	         if (longJump >= 61) vo3.setLongjumpresult(5);
	         else if (longJump >= 55) vo3.setLongjumpresult(4);
	         else if (longJump >= 48) vo3.setLongjumpresult(3);
	         else if (longJump >= 42) vo3.setLongjumpresult(2);
	         else if (longJump < 42) vo3.setLongjumpresult(1);
	         else vo3.setLongjumpresult(-1);
	      
	      } else {
	          System.out.println("성별 알 수 없음...");
	      }
	      
	      // 50m 달리기
	      float run50 = vo.getRun50();
	      
	      if (gender.equals("남성")) {
	         if (run50 <= 6.7) vo3.setRun50result(5);
	         else if (run50 <= 7.5) vo3.setRun50result(4);
	         else if (run50 <= 7.9) vo3.setRun50result(3);
	         else if (run50 <= 8.7) vo3.setRun50result(2);
	         else if (run50 > 8.7) vo3.setRun50result(1);
	         else vo3.setRun50result(-1);
	         
	      } else if (gender.equals("여성")){
	         if (run50 <= 8.8) vo3.setRun50result(5);
	         else if (run50 <= 9.5) vo3.setRun50result(4);
	         else if (run50 <= 10.5) vo3.setRun50result(3);
	         else if (run50 <= 12.2) vo3.setRun50result(2);
	         else if (run50 > 12.2) vo3.setRun50result(1);
	         else vo3.setRun50result(-1);
	      
	      } else {
	          System.out.println("성별 알 수 없음...");
	       }
	      
	      System.out.println("===============================================");
	      System.out.println("순발력 vo : " + vo3);
	      
	      AgilityVO agilityResult = agilityRepo.save(vo3);
	      System.out.println("agilityResult : " + agilityResult);
	      System.out.println("===============================================");
	      
	      //근력
	      MuscularPowerVO vo4 = new MuscularPowerVO();
	      vo4.setMuscularpowerno(reserveNo);
	      vo4.setSquirt(vo.getSquirt());
	      vo4.setBenchpress(vo.getBench());
	      
	      // 근력 결과 계산
	      float weight1 = vo.getWeight1();
	      float squirt = vo.getSquirt();
	      System.out.println("squirt : " + squirt);
	      
	      if (gender.equals("남성")) {
	         if (squirt <= (weight1 * 0.6)) vo4.setSquirtresult(5);
	         else if (squirt <= (weight1 * 1.2)) vo4.setSquirtresult(4);
	         else if (squirt <= (weight1 * 1.5)) vo4.setSquirtresult(3);
	         else if (squirt <= (weight1 * 2.0)) vo4.setSquirtresult(2);
	         else if (squirt > (weight1 * 2.0)) vo4.setSquirtresult(1);
	         else vo4.setSquirtresult(-1);
	         
	      } else if (gender.equals("여성")){
	         if (squirt <= 0.5) vo4.setSquirtresult(5);
	         else if (squirt <= (weight1 * 0.8)) vo4.setSquirtresult(4);
	         else if (squirt <= (weight1 * 1.0)) vo4.setSquirtresult(3);
	         else if (squirt <= (weight1 * 1.3)) vo4.setSquirtresult(2);
	         else if (squirt > (weight1 * 1.3)) vo4.setSquirtresult(1);
	         else vo4.setSquirtresult(-1);
	      
	      } else {
	          System.out.println("성별 알 수 없음...");
	       }
	      
	      // 벤치 프레스
	      float weight2 = vo.getWeight2();
	      float bench = vo.getBench();
	      
	      if (gender.equals("남성")) {
	         if (bench <= (weight2 * 0.7)) vo4.setBenchpressresult(1);
	         else if (bench <= (weight2 * 0.9)) vo4.setBenchpressresult(2);
	         else if (bench <= (weight2 * 1.1)) vo4.setBenchpressresult(3);
	         else if (bench <= (weight2 * 1.5)) vo4.setBenchpressresult(4);
	         else if (bench > (weight2 * 1.5)) vo4.setBenchpressresult(5);
	         else vo4.setBenchpressresult(-1);
	         
	      } else if (gender.equals("여성")){
	         if (bench <=(weight2 * 0.5)) vo4.setBenchpressresult(1);
	         else if (bench <= (weight2 * 0.7)) vo4.setBenchpressresult(2);
	         else if (bench <= (weight2 * 0.8)) vo4.setBenchpressresult(3);
	         else if (bench <= (weight2 * 1.0)) vo4.setBenchpressresult(4);
	         else if (bench > (weight2 * 1.0)) vo4.setBenchpressresult(5);
	         else vo4.setBenchpressresult(-1);
	      
	      } else {
	          System.out.println("성별 알 수 없음...");
	       }
	      
	      System.out.println("===============================================");
	      System.out.println("근력 vo : " + vo4);
	      
	      MuscularPowerVO muscularPowerResult = muscularPowerRepo.save(vo4);
	      System.out.println("muscularPowerResult : " + muscularPowerResult);
	      System.out.println("===============================================");
	      
	      //근지구력
	      MuscularEnduranceVO vo5 = new MuscularEnduranceVO();
	      vo5.setMuscularenduranceno(reserveNo);
	      vo5.setSitup(vo.getSitUp());
	      vo5.setPushup(vo.getPushUp());
	      
	      // 근지구력 결과 계산
	      // 윗몸 일으키기
	      int sitUp = (int) vo.getSitUp();
	      
	      if (gender.equals("남성")) {
	         if (sitUp >= 52) vo5.setSitupresult(5);
	         else if (sitUp >= 50) vo5.setSitupresult(4);
	         else if (sitUp >= 48) vo5.setSitupresult(3);
	         else if (sitUp >= 46) vo5.setSitupresult(2);
	         else if (sitUp < 46) vo5.setSitupresult(1);
	         else vo5.setSitupresult(-1);
	         
	      } else if (gender.equals("여성")){
	         if (sitUp >= 42) vo5.setSitupresult(5);
	         else if (sitUp >= 40) vo5.setSitupresult(4);
	         else if (sitUp >= 38) vo5.setSitupresult(3);
	         else if (sitUp >= 36) vo5.setSitupresult(2);
	         else if (sitUp < 36) vo5.setSitupresult(1);
	         else vo5.setSitupresult(-1);
	      
	      } else {
	          System.out.println("성별 알 수 없음...");
	       }
	      
	      // 팔굽혀펴기
	      int pushUp = (int) vo.getPushUp();
	      
	      if (gender.equals("남성")) {
	         if (pushUp >= 65) vo5.setPushupresult(5);
	         else if (pushUp >= 57) vo5.setPushupresult(4);
	         else if (pushUp >= 49) vo5.setPushupresult(3);
	         else if (pushUp >= 41) vo5.setPushupresult(2);
	         else if (pushUp < 41) vo5.setPushupresult(1);
	         else vo5.setPushupresult(-1);
	         
	      } else if (gender.equals("여성")){
	         if (pushUp >= 55) vo5.setPushupresult(5);
	         else if (pushUp >= 47) vo5.setPushupresult(4);
	         else if (pushUp >= 39) vo5.setPushupresult(3);
	         else if (pushUp >= 31) vo5.setPushupresult(2);
	         else if (pushUp < 31) vo5.setPushupresult(1);
	         else vo5.setPushupresult(-1);
	      
	      } else {
	          System.out.println("성별 알 수 없음...");
	       }
	      
	      System.out.println("===============================================");
	      System.out.println("근지구력 vo : " + vo5);
	      
	      MuscularEnduranceVO muscularEnduranceResult = muscularEnduranceRepo.save(vo5);
	      System.out.println("muscularEnduranceResult : " + muscularEnduranceResult);
	      System.out.println("===============================================");
	      
	      //민첩성
	      QuicknessVO vo6 = new QuicknessVO();
	      vo6.setQuicknessno(reserveNo);
	      vo6.setSidestep(vo.getSideStep());
	      vo6.setBurpeetest(vo.getBurpeeTest());
	      
	      // 민첩성 결과 계산
	      // 사이드 스텝
	      int sideStep = (int) vo.getSideStep();
	      
	      if (gender.equals("남성")) {
	         if (sideStep >= 45) vo6.setSidestepresult(5);
	         else if (sideStep >= 43) vo6.setSidestepresult(4);
	         else if (sideStep >= 41) vo6.setSidestepresult(3);
	         else if (sideStep >= 39) vo6.setSidestepresult(2);
	         else if (sideStep < 39) vo6.setSidestepresult(1);
	         else vo6.setSidestepresult(-1);
	         
	      } else if (gender.equals("여성")){
	         if (sideStep >= 40) vo6.setSidestepresult(5);
	         else if (sideStep >= 38) vo6.setSidestepresult(4);
	         else if (sideStep >= 36) vo6.setSidestepresult(3);
	         else if (sideStep >= 34) vo6.setSidestepresult(2);
	         else if (sideStep < 34) vo6.setSidestepresult(1);
	         else vo6.setSidestepresult(-1);
	      
	      } else {
	          System.out.println("성별 알 수 없음...");
	       }
	      
	      // 버피 테스트
	      int burpeeTest = (int) vo.getBurpeeTest();
	      
	      if (gender.equals("남성")) {
	         if (burpeeTest >= 16) vo6.setBurpeetestresult(5);
	         else if (burpeeTest >= 15) vo6.setBurpeetestresult(4);
	         else if (burpeeTest >= 14) vo6.setBurpeetestresult(3);
	         else if (burpeeTest >= 13) vo6.setBurpeetestresult(2);
	         else if (burpeeTest < 13) vo6.setBurpeetestresult(1);
	         else vo6.setBurpeetestresult(-1);
	         
	      } else if (gender.equals("여성")){
	         if (burpeeTest >= 12) vo6.setBurpeetestresult(5);
	         else if (burpeeTest >= 11) vo6.setBurpeetestresult(4);
	         else if (burpeeTest >= 10) vo6.setBurpeetestresult(3);
	         else if (burpeeTest >= 9) vo6.setBurpeetestresult(2);
	         else if (burpeeTest < 9) vo6.setBurpeetestresult(1);
	         else vo6.setBurpeetestresult(-1);
	      
	      } else {
	          System.out.println("성별 알 수 없음...");
	       }
	      
	      System.out.println("===============================================");
	      System.out.println("민첩성 vo : " + vo6);
	      
	      QuicknessVO quicknessResult = quicknessRepo.save(vo6);
	      System.out.println("quicknessResult : " + quicknessResult);
	      System.out.println("===============================================");
	      
	      PhysicalVO vo7 = new PhysicalVO();
	      vo7.setPhysicalno(reserveNo);
	      vo7.setCardioenduranceno(reserveNo);
	      vo7.setFlexibilityno(reserveNo);
	      vo7.setAgilityno(reserveNo);
	      vo7.setMuscularpowerno(reserveNo);
	      vo7.setMuscularenduranceno(reserveNo);
	      vo7.setQuicknessno(reserveNo);
	      vo7.setTestexpense(250000);
	      // vo.setId((String)req.getSession().getAttribute("memberId"));
	      vo7.setId("physicaldoctor");
	      
	      System.out.println("===============================================");
	      System.out.println("운동검사 vo7 : " + vo7);
	      
	      // JPA를 이용하여 physical 테이블에 데이터 저장
	      PhysicalVO physicalResult = physicalRepo.save(vo7);
	      
	      int updateCnt = 0;
	      if (cardioEnduranceResult != null && flexibilityResult != null && agilityResult != null 
	            && muscularPowerResult != null && muscularEnduranceResult != null && quicknessResult != null
	            && physicalResult != null) {
	    	  
	         ReserveVO vo8 = reserveRepo.getById(reserveNo);
	         vo8.setPshow("n");
	         ReserveVO updateResult = reserveRepo.save(vo8);
	         if (updateResult != null) updateCnt = 1;
	         System.out.println("update : " + updateCnt);
	         
	      } else{
	         System.out.println("show='n'으로 못 바꿈");
	      }
	      
	      return updateCnt;
	}
	
	// 회원정보 조회하기
	public PhysicalMemberVO getVueMemberInfo(int reserveNo) {
		return dao.getVueMemberInfo(reserveNo);
	}
	
	//===============================[담당회원정보]====================================
    //의료진_회원정보 운동
    public List<ReserveDTO> vueResultInfoList2(HttpServletRequest req, Model model) {
       System.out.println("D_service => resultInfoList2");
                        
         return dao.vueGetReserveInfoList2();
      }

    // 의사_회원_운동검사 정보 상세 가져오기
    public List<Object> vueGetPhysicalResult2(HttpServletRequest req, Model model,int reserveNo) {
       System.out.println("D_service => getPhysicalResult");
       List<Object> list = new ArrayList<Object>();
       // 심폐지구력 가져오기
       CardioEnduranceDTO dto1 = dao.vueGetPhysicalCardio(reserveNo);
       float test = dto1.getRun3km();
       int minute = (int) (test/60);
       int second = (int) (test%60);
       String total = minute + "분" + second + "초";
       
       // 유연성 가져오기
       FlexibilityDTO dto2 = dao.vueGetPhysicalFlexibility(reserveNo);
       
       // 순발력
       AgilityDTO dto3 = dao.vueGetPhysicalAgility(reserveNo);
       System.out.println("dto3 : " + dto3);
       // 근력
       MuscularPowerDTO dto4 = dao.vueGetPhysicalMuscularPower(reserveNo);
       
       // 근지구력
       MuscularEnduranceDTO dto5 = dao.vueGetPhysicalMuscularEndurance(reserveNo);
       
       // 민첩성
       QuicknessDTO dto6 = dao.vueGetPhysicalQuickness(reserveNo);
              
       list.add(dto1);
       list.add(dto2);
       list.add(dto3);
       list.add(dto4);
       list.add(dto5);
       list.add(dto6);
       list.add(total);
       return list;
    }
    
}