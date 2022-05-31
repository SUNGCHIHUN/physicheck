package com.teampj.physicheck.vue.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.teampj.physicheck.dto.MentalDTO;
import com.teampj.physicheck.dto.ReserveDTO;
import com.teampj.physicheck.vue.dao.MentalMapper;
import com.teampj.physicheck.vue.vo.BasicVO;
import com.teampj.physicheck.vue.vo.MentalCommentVO;
import com.teampj.physicheck.vue.vo.MentalVO;

@Service
public class MentalService {
	
	@Autowired
	MentalMapper dao;
	
	// 검사리스트 조회
	public List<ReserveDTO> getVueReserveList2() {
		return dao.getVueReserveList2();
	}
	
	// 심리검사결과 조회
	public MentalVO getMentalInfo(int reserveNo) {
		return dao.getVueMentalInfo(reserveNo);
	}
	
	// 소견서 등록
	public int mentalResultInsert(int reserveNo, MentalVO vo) {
		System.out.println("mentalResultInsert()");
		System.out.println("reserveNo : " + reserveNo);
		System.out.println("vo : " + vo);
		
		MentalVO dto = new MentalVO();
		dto.setReserveNo(reserveNo);
		String comments = vo.getComments();
		System.out.println("comments : " + comments);
		dto.setComments(comments);
		
		System.out.println("소견서 dto : " + dto);
		
		int insertCnt = dao.mentalVueResultInsert(dto);
		System.out.println("insertCnt : " + insertCnt);
		
		int updateCnt = 0;
		if (insertCnt == 1) {
			updateCnt = dao.showUpdateVue2(reserveNo);
			System.out.println("update : " + updateCnt);
			
		}else{
			System.out.println("show='n'으로 못 바꿈");
		}
		
		return updateCnt;
	}

	public List<ReserveDTO> getMemberResultInfo2() {
		return dao.getVueMemberResultInfo2();
	}
}
