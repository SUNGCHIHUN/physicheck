package com.teampj.physicheck.es.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.teampj.physicheck.es.vo.SalesVO;

@Repository
public interface SalesRepository extends JpaRepository<SalesVO, String>{
	@Query("select COUNT(*) from totalsalesyear t where t.paymentway is not null")
	long getSalesCount();
}