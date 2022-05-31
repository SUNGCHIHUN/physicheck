package com.teampj.physicheck.common.service;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import com.teampj.physicheck.common.dto.LoginRequest;
import org.hibernate.mapping.Any;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.teampj.physicheck.common.dto.JoinRequest;
import com.teampj.physicheck.common.entity.Member;
import com.teampj.physicheck.common.repository.MemberRepository;
import org.springframework.ui.Model;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberRepository memberRepository;

    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
        System.out.println("memberServiceImpl_loadUserByUsername");
        System.out.println("------" + id);
        Optional<Member> memberEntityWrapper = memberRepository.findByAbleTrueAndId(id);
        System.out.println("memberEntityWrapper : " + memberEntityWrapper);
        Member memberEntity = memberEntityWrapper.orElse(null);
        List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(memberEntity.getAuthority()));
        System.out.println("memberEntity.getAuthority() : " + memberEntity.getAuthority());
        return new User(memberEntity.getId(), memberEntity.getPassword(), authorities);
    }

    @Transactional  // jpa 사용 시 넣어줘야함(insert, update, delete)
    @Override
    public boolean save(JoinRequest request) {
        Member member = new Member();
        BeanUtils.copyProperties(request, member);

        String email = request.getEmail1() + "@" + request.getEmail2();

        String address = null;
        if(request.getDetailAddress() != null) {
            address = request.getAddress() + " " + request.getDetailAddress();
        } else {
            address = request.getAddress();
        }

        String jumin1 = request.getJumin1();
        String jumin2 = request.getJumin2();

        member.setEmail(email);
        member.setAddress(address);
        member.setAuthority("ROLE_MEMBER");
        member.setAge(age(jumin1, jumin2));

        // 비밀번호 암호화
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        member.setPassword(passwordEncoder.encode(member.getPassword()));
        Member result = memberRepository.save(member);

        if(result != null) {
            return true;
        } else {
            return false;
        }
    }

    // 중복확인 처리
    @Override
    public void confirmIdAction(HttpServletRequest req, Model model) {
        System.out.println("C_service => confirmIdAction");

        String strId = req.getParameter("id");

        int selectCnt = memberRepository.idCheck(strId);

        model.addAttribute("id", strId);
        model.addAttribute("selectCnt", selectCnt);
    }

    @Override
    public Map<String, Object> vueLogin(LoginRequest loginRequest) {
        Map<String, Object> result = new HashMap<>();
        String id = loginRequest.getId();
        String rawPassword = loginRequest.getPassword(); // 입력받은 비밀번호
        String enPassword = memberRepository.pwdChk(id); // DB 암호화된 비밀번호

        if(enPassword == null) {
            result.put("success", false);
            result.put("message", "존재하지 않는 계정입니다.");
            return result;
        }
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        boolean isPwd = passwordEncoder.matches(rawPassword, enPassword);   // 입력받은 비밀번호와 DB에서 가져온 암호화된 비밀번호를 비교

        if (isPwd) {
            UserDetails userInfo = loadUserByUsername(id);

            result.put("success", true);
            result.put("message", "로그인 성공");
            result.put("contents", userInfo.getAuthorities());
            result.put("id", userInfo.getUsername());
        } else {
            result.put("success", false);
            result.put("message", "비밀번호 틀림.");
        }
        return result;
    }

    public int age(String jumin1, String jumin2){
        String year = null;
        String jumin = jumin1;
        String backFirst = jumin2.substring(0,1);

        switch (backFirst) {
            case "1" :
                year = "19";
                break;
            case "2" :
                year = "19";
                break;
            case "3" :
                year = "20";
                break;
            case "4" :
                year = "20";
                break;
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Calendar calendar = Calendar.getInstance();
        String strToday = sdf.format(calendar.getTime());

        int birth = Integer.parseInt(year + jumin);
        int nowDay = Integer.parseInt(strToday);

        int age = (nowDay - birth) / 10000;

        System.out.println(nowDay);
        System.out.println(birth);
        System.out.println("age : " + age);

        return age;
    }
}