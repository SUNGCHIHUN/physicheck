package com.teampj.physicheck.vue.dao;

import org.apache.ibatis.annotations.Mapper;

import com.teampj.physicheck.dto.MemberDTO;

@Mapper
public interface MypageVueMapper {

	// 마이페이지 조회
	public MemberDTO vueGetMemberInfo(String id);

	// 마이페이지 수정
	public int vueSetMemberInfo(MemberDTO dto);

	// 마이페이지 탈퇴
	public int vueMemberDelete(String id);


	
}
