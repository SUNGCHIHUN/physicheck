package com.teampj.physicheck.Service;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// 접근 권한이 없는 경우 작동
public class UserDeniedHandler implements AccessDeniedHandler{

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		
		System.out.println("<<<< UserDeniedHandler - handle 진입 >>>>");
		System.out.println("sessionId : " + request.getSession().getAttribute("memberId"));
		
		request.setAttribute("errMsg", "권한이 없습니다. 계정을 확인하여 주세요.");
		
		RequestDispatcher dispather = request.getRequestDispatcher("/WEB-INF/views/common/accessDenied.jsp");
		dispather.forward(request, response);
	}
	
}
