package com.teampj.physicheck.vue.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teampj.physicheck.vue.vo.MuscularEnduranceVO;

public interface MuscularEnduranceRepository extends JpaRepository<MuscularEnduranceVO, Integer>{}