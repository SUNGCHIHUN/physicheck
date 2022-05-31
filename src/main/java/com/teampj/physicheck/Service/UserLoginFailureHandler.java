package com.teampj.physicheck.Service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.teampj.physicheck.common.repository.MemberRepository;

// 로그인 실패 시 작동
public class UserLoginFailureHandler implements AuthenticationFailureHandler {
	
	MemberRepository memberRepository;

	PasswordEncoder passwordEncoder;	// 비밀번호 암호화 클래스
	
	public UserLoginFailureHandler(MemberRepository memberRepository, PasswordEncoder passwordEncoder) {
		this.memberRepository = memberRepository;
		this.passwordEncoder = passwordEncoder;
	}
	// 로그인이 실패할 경우 자동으로 실행하는 코드
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		System.out.println("<<< UserLoginFailureHandler - onAuthenticationFailure 진입 >>>");
		
		String strId = request.getParameter("id");
		String strPw = request.getParameter("password");
		
		int cnt = memberRepository.idCheck(strId);
		System.out.println("--- cnt ---" + cnt);
		if(cnt != 0) {
			// 암호화된 비밀번호 가져오기
			String encryptPassword = memberRepository.pwdChk(strId);
			System.out.println("암호화된 비밀번호 : " + encryptPassword);
			System.out.println("암호화 되지않은(화면에서 입력받은) 비밀번호 : " + strPw);
			
			// 입력한 비밀번호와 가입된 비밀번호(암호화된 비밀번호)가 일치하는지 여부 
			if(passwordEncoder.matches(strPw,encryptPassword)) {
				System.out.println("<<< 승인 미완료 >>>");
				request.setAttribute("errorMsg", "기다려!!");
			} else {
				System.out.println("<<< 비밀번호 불일치 >>>");
				request.setAttribute("errorMsg", "비밀번호가 일치하지 않습니다.!!");
			}
			
		} else {
			System.out.println("<<< 아이디 불일치 >>>");
			request.setAttribute("errorMsg", "아이디가 일치하지 않습니다.!!");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/common/login.jsp");
		dispatcher.forward(request, response);
	}
	
}
