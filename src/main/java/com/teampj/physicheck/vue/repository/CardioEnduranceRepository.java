package com.teampj.physicheck.vue.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teampj.physicheck.vue.vo.CardioEnduranceVO;

public interface CardioEnduranceRepository extends JpaRepository<CardioEnduranceVO, Integer>{}