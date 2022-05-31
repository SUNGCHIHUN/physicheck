package com.teampj.physicheck.vue.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teampj.physicheck.dto.AgilityDTO;
import com.teampj.physicheck.dto.CardioEnduranceDTO;
import com.teampj.physicheck.dto.FlexibilityDTO;
import com.teampj.physicheck.dto.MuscularEnduranceDTO;
import com.teampj.physicheck.dto.MuscularPowerDTO;
import com.teampj.physicheck.dto.PhysicalDTO;
import com.teampj.physicheck.dto.QuicknessDTO;
import com.teampj.physicheck.dto.ReserveDTO;
import com.teampj.physicheck.vue.vo.PhysicalMemberVO;

@Mapper
public interface PhysicalMapper {
	
	// 운동검사 등록 대기목록 가져오기
    public List<ReserveDTO> getVueReserveList();

    // 운동검사 회원정보 불러오기
    public PhysicalMemberVO getVueMemberInfo(int reserveNo);
    
	// 심페지구력 등록
    public int CardioEnduranceResultVueInsert(CardioEnduranceDTO dto);
    
    // 유연성 등록
    public int FlexibilityResultVueInsert(FlexibilityDTO dto);

    // 순발력 등록
    public int AgilityResultVueInsert(AgilityDTO dto);
    
    // 근력 등록
    public int MuscularPowerResultVueInsert(MuscularPowerDTO dto);
    
    // 근지구력 등록
    public int MuscularEnduranceResultVueInsert(MuscularEnduranceDTO dto);
    
    // 민첩성 등록
    public int QuicknessResultVueInsert(QuicknessDTO dto);

    // 운동검사 등록
    public int PhysicalVueInsert(PhysicalDTO dto);
    
    // 운동검사 등록 확인 시 목록에서 가리기
    public int showUpdateVue1(int reserveNo);
    
    //담당회원정보 목록 운동
    public List<ReserveDTO> vueGetReserveInfoList2();
    
    // --------------------------- 회원 상세 운동검사 정보
    public CardioEnduranceDTO vueGetPhysicalCardio(int reserveNo);
    
    public FlexibilityDTO vueGetPhysicalFlexibility(int reserveNo);
    
    public AgilityDTO vueGetPhysicalAgility(int reserveNo);
    
    public MuscularPowerDTO vueGetPhysicalMuscularPower(int reserveNo);
    
    public MuscularEnduranceDTO vueGetPhysicalMuscularEndurance(int reserveNo); 
    
    public QuicknessDTO vueGetPhysicalQuickness(int reserveNo);
    
}