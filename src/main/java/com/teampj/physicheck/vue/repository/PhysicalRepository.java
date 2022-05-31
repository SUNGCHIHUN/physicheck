package com.teampj.physicheck.vue.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teampj.physicheck.vue.vo.PhysicalVO;

public interface PhysicalRepository extends JpaRepository<PhysicalVO, Integer>{}