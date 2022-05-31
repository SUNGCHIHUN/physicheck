package com.teampj.physicheck.Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.teampj.physicheck.dao.StaticsMapper;
import com.teampj.physicheck.dto.Statics1DTO;
import com.teampj.physicheck.dto.Statics2DTO;

@Service
public class StaticService {
	@Autowired
	StaticsMapper dao;
	
	// ------------------------ 통계 ---------------------------
	//통계 - 성별
	public void statics1(HttpServletRequest req, Model model) {
			
		List<Statics1DTO> list=dao.statics1();
		System.out.println("list : " + list);
	
		model.addAttribute("list", list);
	}
	
	//통계 - 연령별
	public void statics2(HttpServletRequest req, Model model) {
		List<Statics2DTO> list=dao.statics2();
		System.out.println("list : " + list);

		model.addAttribute("list", list);
	}
	
}