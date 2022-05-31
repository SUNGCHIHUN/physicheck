package com.teampj.physicheck.common.service;
import org.hibernate.mapping.Any;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.teampj.physicheck.common.dto.JoinRequest;
import com.teampj.physicheck.common.dto.LoginRequest;

import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public interface MemberService extends UserDetailsService {
    boolean save(JoinRequest request);

    void confirmIdAction(HttpServletRequest req, Model model);

    Map<String, Object> vueLogin(LoginRequest loginRequest);
}