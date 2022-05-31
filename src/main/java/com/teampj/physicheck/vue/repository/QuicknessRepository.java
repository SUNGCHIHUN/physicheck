package com.teampj.physicheck.vue.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teampj.physicheck.vue.vo.QuicknessVO;

public interface QuicknessRepository extends JpaRepository<QuicknessVO, Integer>{}