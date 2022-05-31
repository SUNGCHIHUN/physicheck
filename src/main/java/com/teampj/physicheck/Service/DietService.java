package com.teampj.physicheck.Service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.teampj.physicheck.dao.DietMapper;
import com.teampj.physicheck.dto.DietDTO;
import com.teampj.physicheck.dto.MedicineDTO;
import com.teampj.physicheck.util.Paging;

@Service
public class DietService {

	@Autowired
	DietMapper dao;
	
	// 식단 조회
	public void getDietList(HttpServletRequest req, Model model) {
		System.out.println("getDietList() 수행");
		
		// 페이징처리 --------------------------------------
		String pageNum = req.getParameter("pageNum");
		Paging paging = new Paging(pageNum);
		int total = dao.getDietTotal();
		paging.setTotalCount(total);
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		// ----------------------------------------------
		
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);

		// dao에서 회원리스트 조회
		List<DietDTO> dlist = dao.getDietList(map);
		System.out.println("dlist : " + dlist);
		
		model.addAttribute("dlist", dlist);
		model.addAttribute("paging", paging);
	}
	
	// 식단 등록 처리
	public void dietAddAction(MultipartHttpServletRequest req,  Model model) {
		System.out.println("dietAddAction() 수행");
		
		// 파일처리 추가Start ------------------------------------------------------------------------------------
		MultipartFile file = req.getFile("image");
		System.out.println("file : " + file);
		
		// 파일을 저장할 위치
		// C:/sch/workspace/psysicheck/src/main/resources/static/resources/images/diet/
		String saveDir = "D:/teamspace/psysicheckboot/src/main/resources/static/resources/images/diet/";
		System.out.println("saveDir : " + saveDir);
		
		// 실제 파일위치
		// C:/Users/KOSMO/Downloads/
		String realDir = "C:/Users/clgns/Downloads/";
		System.out.println("realDir : " + realDir);
		if (file.getOriginalFilename() != "") {
			System.out.println("등록할 파일이 존재 : " + file.getOriginalFilename());
			try {
				file.transferTo(new File(saveDir + file.getOriginalFilename()));

				// 파일 IO Stream 생성 
				// 파일 복사 할 대상의 파일
				FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
				
				// 새로운 파일의 대상
				FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename()); // 저장
				
				int data = 0;
				
				// 파일이 존재하는 동안 데이터 쓰기
				while((data = fis.read()) != -1) {
					fos.write(data);
				}
				
				fis.close();
				fos.close();
				
			} catch(IOException e) {
				e.printStackTrace();
			}
		}
		
		// 파일처리2 추가Start ------------------------------------------------------------------------------------
		MultipartFile file2 = req.getFile("image2");
		System.out.println("file2 : " + file2);
		
		// 파일을 저장할 위치
		String saveDir2 = "D:/teamspace/psysicheckboot/src/main/resources/static/resources/images/main_diet/";
		System.out.println("saveDir2 : " + saveDir2);
		
		// 실제 파일위치
		String realDir2 = "C:/Users/clgns/Downloads/";
		System.out.println("realDir2 : " + realDir2);
		if (file2.getOriginalFilename() != "") {
			System.out.println("등록할 파일이 존재 : " + file2.getOriginalFilename());
			try {
				file2.transferTo(new File(saveDir2 + file2.getOriginalFilename()));

				// 파일 IO Stream 생성 
				FileInputStream fis = new FileInputStream(saveDir2 + file2.getOriginalFilename()); // 읽기
				FileOutputStream fos = new FileOutputStream(realDir2 + file2.getOriginalFilename()); // 저장
				
				int data = 0;
				
				// 파일이 존재하는 동안 데이터 쓰기
				while((data = fis.read()) != -1) {
					fos.write(data);
				}
				
				fis.close();
				fos.close();
				
			} catch(IOException e) {
				e.printStackTrace();
			}
		}
		
		// 파일처리 추가End ---------------------------------------------------------------------------
		
		DietDTO dto = new DietDTO();
		
		String fileName = file.getOriginalFilename();
		String fileName2 = file2.getOriginalFilename();
		String img_name = "/resources/images/diet/" + fileName;
		String img_name2 = "/resources/images/main_diet/" + fileName2;
		
		System.out.println("img_name : " + img_name);
		System.out.println("img_name2 : " + img_name2);
		
        dto.setTitle(req.getParameter("title"));
        dto.setContent1(req.getParameter("content1"));
        dto.setContent2(req.getParameter("content2"));
        dto.setContent3(req.getParameter("content3"));
        dto.setContent4(req.getParameter("content4"));
        dto.setContent5(req.getParameter("content5"));
        dto.setImage(img_name);
        dto.setImage2(img_name2);
        dto.setMemberNo((Integer)req.getSession().getAttribute("MemberNo"));
        
        System.out.println("dto : " + dto);
        int insertCount = dao.insertDiet(dto);
        model.addAttribute("insertCount", insertCount);
        
	}

	// 식단 삭제
	public void dietDeleteAction(HttpServletRequest req, Model model) {
		System.out.println("dietDeleteAction() 수행");

		int deleteCount = dao.deleteDiet(Integer.parseInt(req.getParameter("dietNo")));
		model.addAttribute("deleteCount", deleteCount);
	}

	// 식단 상세조회
	public void getDietDetail(HttpServletRequest req, Model model) {
		System.out.println("getDietDetail() 수행");
		
		DietDTO dto = dao.getDietDetail(Integer.parseInt(req.getParameter("dietNo")));
		
		// 조회수 증가
		dao.countUp(dto.getDietNo());
		
		System.out.println(" diet : " + dto);
		model.addAttribute("diet", dto);
	}

	
//-------------------------------------------------------------------		
	// 의약품 리스트
		public void getMedicineList(HttpServletRequest req, Model model) {
			
			System.out.println("getMedicineList() 수행");
			
			// 페이징처리 --------------------------------------
			String pageNum = req.getParameter("pageNum");
			Paging paging = new Paging(pageNum);
			int total = dao.getMedicTotal();
			System.out.println("dao.getMedicTotal() "+total);
			
			paging.setTotalCount(total);
			int start = paging.getStartRow();
			int end = paging.getEndRow();
			
			System.out.println("start : "+start+"end : "+end);
			// ----------------------------------------------
			
			Map<String, Object> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);

			// dao에서 리스트 조회
			List<MedicineDTO> mlist = dao.getMedicineList(map);
			System.out.println("mlist : " + mlist);
			
			model.addAttribute("mlist", mlist);
			model.addAttribute("paging", paging);		
		}	
		
	// 의약품 등록 처리
	public void medicAddAction(MultipartHttpServletRequest req,  Model model) {
		System.out.println("medicAddAction() 수행");
		
		// 파일처리 추가Start ------------------------------------------------------------------------------------
		MultipartFile file = req.getFile("img");
		System.out.println("file : " + file);
		
		// 파일 저장 위치
		// D:/workspace/220512_2/src/main/resources/static/resources/images/diet/
		String saveDir = "D:/workspace/220512_2/src/main/resources/static/resources/images/medicine/";
		System.out.println("saveDir : " + saveDir);
		
		// 파일이 저장될 경로
		String realDir = "C:/Users/KOSMO/Downloads/";
		System.out.println("realDir : " + realDir);
		if (file.getOriginalFilename() != "") {
			System.out.println("등록할 파일이 존재 : " + file.getOriginalFilename());
			try {
				file.transferTo(new File(saveDir + file.getOriginalFilename()));

				// 파일 IO Stream 생성 
				FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename()); // 읽기
				FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename()); // 저장
				
				int data = 0;
				
				// 파일이 존재하는 동안 데이터 쓰기
				while((data = fis.read()) != -1) {
					fos.write(data);
				}
				
				fis.close();
				fos.close();
				
			} catch(IOException e) {
				e.printStackTrace();
			}
		}
		
		// 파일처리 추가End ---------------------------------------------------------------------------
		
		MedicineDTO dto = new MedicineDTO();
		
		String fileName = file.getOriginalFilename();
		String img_name = "/resources/images/medicine/" + fileName;
		
		System.out.println("img_name : " + img_name);
		
        dto.setName(req.getParameter("name"));
        dto.setImg(img_name);
        dto.setContent1(req.getParameter("content1"));
        dto.setContent2(req.getParameter("content2"));
        dto.setMemberNo((Integer)req.getSession().getAttribute("MemberNo"));
        
        System.out.println("dto : " + dto);
        int insertCount = dao.insertMedic(dto);
        model.addAttribute("insertCount", insertCount);
        
	}

	
	// 의약품 수정 정보 가져오기
	public void getMedicUpdate(HttpServletRequest req, Model model) {
		System.out.println("getMedicUpdate() 수행");

		MedicineDTO dto = dao.getMedicInfo(Integer.parseInt(req.getParameter("medicineNo")));
		
		System.out.println("medicine dto : " + dto);
		model.addAttribute("medicine", dto);
	}	
	
	// 의약품 수정 정보 보내기
	public void setMedicUpdate(MultipartHttpServletRequest req, Model model) {
		System.out.println("setMedicUpdate() 수행");
		
		// 파일처리 추가Start ------------------------------------------------------------------------------------
		MultipartFile file = req.getFile("image");
		System.out.println("file : " + file);
		
		// 파일을 열 경로
		// D:/workspace/220512_2/src/main/resources/static/resources/images/diet/
		String saveDir = "D:/workspace/220512_2/src/main/resources/static/resources/images/medicine/";
		System.out.println("saveDir : " + saveDir);
		
		// 파일이 저장될 경로
		String realDir = "C:/Users/KOSMO/Downloads/";
		System.out.println("realDir : " + realDir);
		if (file.getOriginalFilename() != "") {
			System.out.println("등록할 파일이 존재 : " + file.getOriginalFilename());
			try {
				file.transferTo(new File(saveDir + file.getOriginalFilename()));

				// 파일 IO Stream 생성 
				FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename()); // 읽기
				FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename()); // 저장
				
				int data = 0;
				
				// 파일이 존재하는 동안 데이터 쓰기
				while((data = fis.read()) != -1) {
					fos.write(data);
				}
				
				fis.close();
				fos.close();
				
			} catch(IOException e) {
				e.printStackTrace();
			}
		}	
		// 파일처리 추가End ---------------------------------------------------------------------------
		
		String fileName = file.getOriginalFilename();
		System.out.println("fileName : " + fileName);
		
		String img_name = "/resources/images/medicine/" + fileName;
		System.out.println("img_name : " + img_name);
		
		MedicineDTO dto = new MedicineDTO();
		System.out.println(req.getParameter("name"));
		System.out.println(Integer.parseInt(req.getParameter("medicineNo")));
		
		dto.setMedicineNo(Integer.parseInt(req.getParameter("medicineNo")));
		dto.setName(req.getParameter("name"));
		dto.setImg(img_name);
		dto.setContent1(req.getParameter("content1"));
		dto.setContent2(req.getParameter("content2"));
        System.out.println("dto : " + dto);
        
        int updateCount = dao.setMedicInfo(dto);
        
        System.out.println("updateCount : "+updateCount);        
        model.addAttribute("updateCount", updateCount);
       
	}
	
	// 의약품 삭제
	public void medicDeleteAction(HttpServletRequest req, Model model) {
		System.out.println("medicDeleteAction() 수행");

		int deleteCount = dao.deleteMedic(Integer.parseInt(req.getParameter("medicineNo")));
		model.addAttribute("deleteCount", deleteCount);
	}		
}