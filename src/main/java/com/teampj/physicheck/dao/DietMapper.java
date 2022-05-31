package com.teampj.physicheck.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teampj.physicheck.dto.DietDTO;
import com.teampj.physicheck.dto.MedicineDTO;

@Mapper
public interface DietMapper {

	// 식단 총 개수 (페이징용)
	public int getDietTotal();
	
	// 식단 조회
	public List<DietDTO> getDietList(Map<String, Object> map);
	
	// 식단 등록
	public int insertDiet(DietDTO dto);
	
	// 식단 수정
	public int updateDiet(DietDTO dto);
	
	// 식단 삭제
	public int deleteDiet(int dietNo);
	
	// 식단 상세조회
	public DietDTO getDietDetail(int dietNo);
	
	// 식단 조회수 증가
	public void countUp(int dietNo);
	
	//--------------------------------------------------
		
	// 의약품 리스트
	public List<MedicineDTO> getMedicineList(Map<String, Object> map);
	
	// 의약품 등록
	public int insertMedic(MedicineDTO dto);

	// 의약품 수정 get
	public MedicineDTO getMedicInfo(int medicineNo);	
	
	// 의약품 수정 set
	public int setMedicInfo(MedicineDTO dto);
	
	// 의약품 삭제
	public int deleteMedic(int medicineNo);
	
	// 의약품 조회수 증가
	public void countMedUp(int medicineNo);

	// 의약품 total page count
	public int getMedicTotal();




			
}