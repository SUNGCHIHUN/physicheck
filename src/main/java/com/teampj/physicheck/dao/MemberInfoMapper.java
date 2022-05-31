package com.teampj.physicheck.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teampj.physicheck.dto.CustomerDTO;
import com.teampj.physicheck.dto.NoticeDTO;
import com.teampj.physicheck.dto.ReserveDTO;
import com.teampj.physicheck.dto.ReviewDTO;

@Mapper
public interface MemberInfoMapper {

	// 고객정보 불러오기
    CustomerDTO getCustomerDetail(String strId);

    // 고객정보 수정처리
    int updateCustomer(CustomerDTO dto);
    
    // 고객정보 삭제 처리
    int deleteCustomer(String strId);

    // 예약하기 > 달력 가져오기
    int timeList(String date);
    
    // 예약하기 버튼
    // 기초검사만
    int reserveBtn1(ReserveDTO dto);
    
    // 예약하기 버튼
    // 기초검사, 운동검사
    int reserveBtn2(ReserveDTO dto);
    
    // 예약하기 버튼
    // 기초검사, 심리검사
    int reserveBtn3(ReserveDTO dto);
    
    // 예약하기 버튼
    // 기초검사, 운동검사, 심리검사
    int reserveBtn4(ReserveDTO dto);
    
    // 예약리스트
    List<ReserveDTO> reserveList(Map map);
    
    // 예약 상세
    ReserveDTO reserveInfo(int reserveNo);
    
    // 예약리스트 갯수
    int reserveCnt(int memberNo);
    
    // 예약 취소
    int reserveCancelBtn(int reserveNo);
    
    // 게시판 갯수
    int noticeCnt();
    
    // 게시판 리스트
    List<NoticeDTO> noticeList(int start, int end);
    
    // 게시판 상세
    NoticeDTO noticeInfo(int num);
    
    // 게시판 조회수 증가
    void plusReadCnt(int num);
    
    // 게시판 검색 갯수
    int searchCnt(String content);
    
    // 게시판 검색 리스트
    List<NoticeDTO> searchNoticeList(Map map);
    
    // 리뷰 갯수
    int reviewCnt();
    
    // 리뷰 리스트
    List<ReviewDTO> reviewList(int start, int end);
    
    // 리뷰 상세
    ReviewDTO reviewInfo(String reviewNo);
    
    // 리뷰 등록 버튼
    int reviewAdd(ReviewDTO dto);
    
    // 리뷰 등록 페이지
    List<Integer> reviewAddPage(int memberNo);
    
    // 리뷰 등록 후 reviewState 1로 변경
    int reviewAddUpdate(int reserveNo);
    
    // 리뷰 삭제
    int reviewDelete(int reviewNo);
    
    // 리뷰 삭제 후 reviewState 0로 변경
    int reviewDeleteUpdate(int reserveNo);
    
    // 리뷰 수정 액션
    int reviewModifyAction(Map map);
    
    // 리뷰 검색 갯수
    int searchReviewCnt(String content);
    
    // 리뷰 검색 리스트
    List<ReviewDTO> searchReviewList(Map map);

    // kakaoPay 액션 예약테이블 결제 state 변경
    int paidState(String reserveNo);
    
    // 결제 테이블 생성
    int paymentAdd(Map map);
    
    // 환불 액션
    int paidStateRefund(String reserveNo);
    
    // 의사_담당 고객정보
    CustomerDTO docCustomerDetail(int reserveNo);
    
}