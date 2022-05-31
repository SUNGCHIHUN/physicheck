package com.teampj.physicheck.common.repository;

import java.util.Optional;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.teampj.physicheck.common.entity.Member;

@Repository
public interface MemberRepository extends JpaRepository<Member, String> {
	Optional<Member> findByAbleTrueAndId(String id);

	@Query("select count(m) from Member m where m.id=:id")
	int idCheck(@Param("id") String id);

	@Query("select m.password from Member m where m.id=:id")
	String pwdChk(@Param("id") String id);

}