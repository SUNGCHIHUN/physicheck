package com.teampj.physicheck.Service;

import com.teampj.physicheck.dao.NoticeMapper;
import com.teampj.physicheck.dao.ReviewMapper;
import com.teampj.physicheck.dto.*;
import com.teampj.physicheck.util.Paging;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {

	@Autowired
	NoticeMapper dao1;
	
	@Autowired
	ReviewMapper dao2;
	
	// ------------------------ 공지사항 ---------------------------
	//공지사항 - 목록
	public void notice(HttpServletRequest req, Model model) {
		System.out.println("A_service => notice");
		String pageNum = req.getParameter("pageNum");
		Paging paging = new Paging(pageNum);
		int total=dao1.readCnt();
		paging.setTotalCount(total);
		int start= paging.getStartRow();
		int end= paging.getEndRow();
		List<NoticeDTO> list=null;
		
		/* if(total>0) { */
	      Map<String, Object>map = new HashMap<String,Object>();
	      map.put("start", start);
	      map.put("end", end);
		  list = dao1.notice(map);
		/* } */
		System.out.println("list : " + list);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
	
	//공지사항 - 상세
	public void noticeDetail(HttpServletRequest req, Model model) {
		System.out.println("A_service => noticeDetail");
		int noticeNo =Integer.parseInt(req.getParameter("noticeNo"));
		System.out.println("게시글 번호 : "+noticeNo);
		dao1.plusReadCnt(noticeNo);
		
		NoticeDTO dto = dao1.getNoticeDetail(noticeNo);
		String content = dto.getContent();
		if(content!=null) {
		content= content.replace("\n","<br>");
		}
		dto.setContent(content);
		
		System.out.println("상세페이지 dto : " + dto);
		model.addAttribute("items", dto);
	}
	
	//공지사항 - 수정 페이지
	public void noticeEdit(HttpServletRequest req, Model model) {
		System.out.println("A_service => noticeEdit");
		int noticeNo =Integer.parseInt(req.getParameter("hiddenNoticeNo"));
		NoticeDTO dto = dao1.getNoticeDetail(noticeNo);
		String content = dto.getContent();
		if(content!=null) {
		content= content.replace("\n","<br>");
		}
		dto.setContent(content);
		
		System.out.println("상세페이지 dto : " + dto);
		model.addAttribute("items", dto);
	}
	
	//공지사항 - 수정 처리
	public void noticeEditAction(HttpServletRequest req, Model model) {
		System.out.println("A_service => noticeEditAction");
		
		NoticeDTO dto = new NoticeDTO();
		
		dto.setNoticeNo(Integer.parseInt(req.getParameter("hiddenNoticeNo")));
		dto.setWriter(req.getParameter("writer"));
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		
		int updateCnt=dao1.noticeEdit(dto);
		
		System.out.println("updateCnt" + updateCnt);
		model.addAttribute("updateCnt", updateCnt);
	}
	
	//공지사항 - 등록
	public void noticeInsert(HttpServletRequest req, Model model) {
		System.out.println("A_service => noticeInsert");
		
		NoticeDTO dto = new NoticeDTO();
		
		dto.setWriter(req.getParameter("writer"));
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		
		System.out.println("dto : " + dto);
		int insertCnt = dao1.noticeInsert(dto);
		
		System.out.println("insertCnt : " + insertCnt);
		
		model.addAttribute("insertCnt", insertCnt);
	}
	
	//공지사항 - 삭제
	public void noticeDelete(HttpServletRequest req, Model model) {
		System.out.println("A_service => noticeDelete");
		
		String[] notice = req.getParameter("noticeArr").split(",");
 		for(int i=0; i<notice.length; i++) {
 			System.out.println("notice : " + i);
 		}
 		
 		int deleteCnt=0;
 		for(int i=0; i<notice.length; i++) {
 			deleteCnt = dao1.noticeDelete(Integer.parseInt(notice[i]));
 		}
 	    
 		model.addAttribute("deleteCnt", deleteCnt);
	}
	
	
	//공지사항 - 검색목록
	public void noticeSearch(HttpServletRequest req, Model model) {
		System.out.println("A_service => noticeSearch");
		String pageNum = req.getParameter("pageNum");
		String searchContent = req.getParameter("searchContent");
		Paging paging = new Paging(pageNum);
		int total=dao1.searchCnt(searchContent);
		paging.setTotalCount(total);
		int start= paging.getStartRow();
		int end= paging.getEndRow();
		List<NoticeDTO> list=null;
		
		/* if(total>0) { */
	      Map<String, Object>map = new HashMap<String,Object>();
	      map.put("start", start);
	      map.put("end", end);
	      map.put("content", searchContent);
	      
		  list = dao1.noticeSearch(map);
		/* } */
		System.out.println("list : " + list);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("searchContent",searchContent);
	}
	
	

	// ------------------------ 리뷰 ---------------------------
	//리뷰 - 목록
	public void review(HttpServletRequest req, Model model) {
		System.out.println("A_service => review");
		
		String pageNum = req.getParameter("pageNum");
		Paging paging = new Paging(pageNum);
		
		int total=dao2.reviewCnt();
		paging.setTotalCount(total);
		int start= paging.getStartRow();
		int end= paging.getEndRow();
		
		List<ReviewDTO> list=null;
		
	    Map<String, Object>map = new HashMap<String,Object>();
	    map.put("start", start);
	    map.put("end", end);
		list = dao2.review(map);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
	}
	
	//리뷰 - 삭제
	public void reviewDelete(HttpServletRequest req, Model model) {
		System.out.println("A_service => reviewDelete");
		
		String[] review = req.getParameter("reviewArr").split(",");
 		for(int i=0; i<review.length; i++) {
 			System.out.println("review : " + i);
 		}
 		
 		int deleteCnt=0;
 		for(int i=0; i<review.length; i++) {
 			deleteCnt = dao2.reviewDelete(Integer.parseInt(review[i]));
 		}
 	    
 		model.addAttribute("deleteCnt", deleteCnt);
	}
	
	//리뷰 - 별점
	public void starPoint(HttpServletRequest req, Model model) {
		System.out.println("A_service => starPoint");
		ReviewDTO dto = new ReviewDTO();
		
		dto.setStarPoint(Integer.parseInt(req.getParameter("starPoint")));
		
		int insertCnt = dao2.starPoint(dto);
		
		System.out.println("insertCnt : " + insertCnt);
		
		model.addAttribute("insertCnt", insertCnt);
	}
	
	//리뷰 - 검색목록
	public void reviewSearch(HttpServletRequest req, Model model) {
		System.out.println("A_service => reviewSearch");
		String pageNum = req.getParameter("pageNum");
		String searchContent = req.getParameter("searchContent");
		Paging paging = new Paging(pageNum);
		int total=dao2.searchCnt(searchContent);
		paging.setTotalCount(total);
		int start= paging.getStartRow();
		int end= paging.getEndRow();
		List<ReviewDTO> list=null;
		
        Map<String, Object>map = new HashMap<String,Object>();
        map.put("start", start);
        map.put("end", end);
        map.put("content", searchContent);
      
	    list = dao2.reviewSearch(map);
		  
		System.out.println("list : " + list);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("searchContent",searchContent);
	}
}