package com.teampj.physicheck.common.entity;

import java.util.Date;

import javax.persistence.*;

import org.hibernate.annotations.Type;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Entity // DB 테이블 매핑
@Data // lombok(getter, setter, toString, @NotNull 지정된 변수만 매개변수 생성자 자동 생성)
@NoArgsConstructor
public class Member {

    @Id // pk 선언
    @SequenceGenerator(sequenceName = "member_seq", name = "member_seq_generator", initialValue = 1, allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "member_seq_generator")
    private int memberno;

    @NonNull
    private String id;

    @NonNull
    private String password;

    @Type(type="yes_no")
    private boolean able = true;

    @NonNull
    private String name;

    private String email;

    private Date indate = new Date();

    private Date outdate;

    private String authority;

    private String tel;

    private String gender;

    private String jumin1;

    private String jumin2;

    private String address;

    private int enabled;

    private String examination;

    private Integer age;

}