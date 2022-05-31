package com.teampj.physicheck.vue.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.teampj.physicheck.dto.MemberDTO;
import com.teampj.physicheck.vue.dao.MypageVueMapper;

@Service
public class MypageService {

	@Autowired
	MypageVueMapper dao;
	
    @Autowired
    BCryptPasswordEncoder passwordEncoder;

	// 마이페이지 조회
	public MemberDTO vueGetMemberInfo(String id) {
		System.out.println("MypageService - vueGetMemberInfo()");
		
		return dao.vueGetMemberInfo(id);
	}

	// 마이페이지 수정
	public int vueSetMemberInfo(MemberDTO dto) {
		System.out.println("MypageService - vueSetMemberInfo()");
		System.out.println("dto : " + dto);
		
		String password = null;
		System.out.println("인크 전 비번 : "+dto.getPassword());
		password = passwordEncoder.encode(dto.getPassword());		
		System.out.println("인크 후 비번 : "+password);
		
		dto.setPassword(password);		
		return dao.vueSetMemberInfo(dto);
	}

	// 마이페이지 탈퇴
	public int vueMemberDelete(String id) {
		System.out.println("MypageService - vueMemberDelete()");

		return dao.vueMemberDelete(id);
	}


}
