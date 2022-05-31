package com.teampj.physicheck.Service;

import java.io.IOException;
import java.util.Optional;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.teampj.physicheck.common.dto.MemberResponse;
import com.teampj.physicheck.common.entity.Member;
import com.teampj.physicheck.common.repository.MemberRepository;


// 로그인 성공 시 작동
public class UserLoginSuccessHandler implements AuthenticationSuccessHandler {

	MemberRepository memberRepository;

	public UserLoginSuccessHandler(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		System.out.println("<<< UserLoginSuccessHandler - onAuthenticationSuccess 진입 >>>");
		String id = authentication.getName();
		Optional<Member> memberEntityWrapper = memberRepository.findByAbleTrueAndId(id);
		Member memberEntity = memberEntityWrapper.orElse(null);

		MemberResponse memberResponse = new MemberResponse();
		memberResponse.setMemberno(memberEntity.getMemberno());

		memberResponse.setId(memberEntity.getId());
		memberResponse.setName(memberEntity.getName());
		memberResponse.setAuthority(memberEntity.getAuthority());
		memberResponse.setExamination(memberEntity.getExamination());

		request.getSession().setAttribute("memberInfo", memberResponse);	// 세션추가
		request.getSession().setAttribute("memberId", memberResponse.getId());
		System.out.println("memberResponse : " +  memberResponse.getMemberno());
		request.getSession().setAttribute("MemberNo", memberResponse.getMemberno()); // 회원정보 추가
		
		if("ROLE_MEMBER".equals(memberEntity.getAuthority())) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/main");
			dispatcher.forward(request, response);
			
		} else if("ROLE_DOCTOR".equals(memberEntity.getAuthority())) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/doctor/main");
			dispatcher.forward(request, response);
			
		} else if("ROLE_ADMIN".equals(memberEntity.getAuthority())) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/notice");
			dispatcher.forward(request, response);
		}
	}
}