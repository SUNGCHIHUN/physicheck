package com.teampj.physicheck.vue.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teampj.physicheck.vue.vo.MuscularPowerVO;

public interface MuscularPowerRepository extends JpaRepository<MuscularPowerVO, Integer>{}