package com.teampj.physicheck.vue.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.teampj.physicheck.vue.vo.ReserveVO;

public interface ReserveRepository extends JpaRepository<ReserveVO, Integer>{}