package com.teampj.physicheck.common.dto;

import lombok.Data;

@Data // lombok(getter, setter, toString, @NotNull 지정된 변수만 생성자 자동 생성)
public class MemberResponse {

    private int memberno;

    private String id;

    private String name;

    // private String email;

    private String authority;

    private String examination;

}