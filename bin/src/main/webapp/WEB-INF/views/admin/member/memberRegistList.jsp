<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 요청 리스트</title>
<!-- css -->
<link rel = "stylesheet" href = "${path}/resources/css/adminCSS/admin.css">
<link rel = "stylesheet" href = "${path}/resources/css/bootstrap.min.css">

<!-- script -->
<script src="${path}/resources/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/63d3d77b59.js" crossorigin="anonymous"></script>
<script>
jQuery(function ($) {
	  $(".sidebar-dropdown > a").click(function() {
	  $(".sidebar-submenu").slideUp(200);
	  if (
	    $(this)
	      .parent()
	      .hasClass("active")
	  ) {
	    $(".sidebar-dropdown").removeClass("active");
	    $(this)
	      .parent()
	      .removeClass("active");
	  } else {
	    $(".sidebar-dropdown").removeClass("active");
	    $(this)
	      .next(".sidebar-submenu")
	      .slideDown(200);
	    $(this)
	      .parent()
	      .addClass("active");
	  }
	});
	
	$("#close-sidebar").click(function() {
	  $(".page-wrapper").removeClass("toggled");
	});
	$("#show-sidebar").click(function() {
	  $(".page-wrapper").addClass("toggled");
	});
});
</script>
<script type="text/javascript">

	//선택한 회원들의 번호 배열
	var memberArr = new Array();
	
	// 제이쿼리 사용
	$(function() {
		
		// 전체 체크박스를 누른 경우
		$("#basket").click(function() {

			// 체크상태로 설정되면
			if ($("#basket").is(":checked")) {
				console.log('전체 선택됨');
				console.log(memberArr);
				
				// 모든 체크박스 선택 처리
				$("input[name='m_checkbox']").each(function(i, e) {
					if (!$(e).is(":disabled")) {
						$(e).prop("checked", true);
						memberArr.push($(e).val());
					}	
				});
				
				console.log(memberArr);
				
			// 체크 해제된 상태로 설정되면
			} else {
				console.log('전체 해제됨');
				
				// 모든 체크박스 해제 처리
				$("input[name='m_checkbox']").each(function(i, e) {
					$(e).prop("checked", false);
					memberArr = [];
					console.log(memberArr);
				});
			}
		});
		
		// 개별 체크박스
		$("input[name='m_checkbox']").each(function(i, e) {
			
			// 체크박스를 클릭한 경우
			$(e).click(function() {
				
				// 처음부터 다시 확인
				memberArr = [];
				$("input[name='m_checkbox']").each(function(i, e) {
					
					// disabled가 아닌 경우
					if (!$(e).is(":disabled")) {
						// 체크상태이면
						if($(this).is(":checked")) {
							memberArr.push($(this).val());
						}	
					}
				});
				
				// 모두 체크 해제인 경우 false 처리
				if (memberArr.length == 0) {
					$("#basket").prop("checked", false);
				}
				
				// 모두 체크 선택인 경우 true 처리
				if (memberArr.length != 0) {
					$("#basket").prop("checked", true);
				}
				
				console.log(memberArr);
				
			});
			
		});
	});
	
	// 회원 요청 승인
	function confirmRegist(no) {
		
		// 선택된 회원 수
		var selected = memberArr.length;
		console.log(selected);
		// 하나라도 선택하지 않은 경우
		if (selected == 0) {
			alert('승인할 회원을 선택하세요.');
			
		// 하나라도 선택한 경우
		} else {
			if(confirm(selected + '명의 회원 요청을 승인하겠습니까?')) {
				window.location='/admin/memberRegistConfirm?memberArr=' + memberArr + '&pageNum=${paging.currentPage}';
			};	
		}
	}
	
	// 회원 요청 검색
	function searchMemberRegist() {
		var keyword = $("input[name=keyword]").val();
		window.location='/admin/memberRegistList?keyword=' + keyword;
	}
	
	// 엔터키를 눌렀을 때
	function enterkey() {
		if (window.event.keyCode == 13) {
			searchMemberRegist();
	    }
	}
	
</script>
</head>
<body>
<header class="header">
	<%@include file = "/WEB-INF/views/admin/common/header.jsp" %>
</header>
<div class="page-wrapper chiller-theme toggled">
  <a id="show-sidebar" class="btn btn-sm" href="#" style="background:#606ea8;">
    <i class="fas fa-bars"></i>
  </a>
  <%@include file = "/WEB-INF/views/admin/common/leftbar.jsp" %>
  <!-- sidebar-wrapper  -->
  <main class="page-content">
    <div class="container-fluid">
      <h2>회원요청목록</h2>
      <hr>
      <div class="row">
	</div>
	
	<!-- 테이블 내용 시작 -->
       	<div class="row">
			<table width="100%">
				<tr>
					<td align="left">
						<div class="input-group sm-3">
						  <input type="text" class="form-control" name="keyword" placeholder="Search..." style="width:30px;" onkeyup="enterkey()">
						  <div class="input-group-append">
						  	<input type="button" name="button" id="search" class="btn btn-primary" value="검색" onclick="searchMemberRegist()">
						  </div>
						</div>
					</td>
					<td align="right">
						<input type="button" style="visibility: hidden">
						<input type="button" style="visibility: hidden">
						<input type="button" name="button" id="confirm" class="btn btn-success" value="승인" onclick="confirmRegist()">
					</td>
				</tr>
			</table>
		</div>
		
       	<!-- 테이블 내용 시작 -->					
		<div style="padding-top: 50px">
			<table class="table table-hover">
					<tr class="info">
						<th class="text-center">
							<input type="checkbox" name="basket" id="basket">
						</th>
						<th class="text-center">번호</th>
						<th class="text-center">이름</th>
						<th class="text-center">성별</th>
						<th class="text-center">주민등록번호</th>
						<th class="text-center">연락처</th>
						<th class="text-center">주소</th>
						<th class="text-center">이메일</th>
						<th class="text-center">가입요청일</th>
						<th class="text-center">상태</th>
					</tr>
					<c:forEach var="m" items="${mlist}">
						<tr>
							<td align="center" id="td_info">
								<input type = "checkbox" id="m_checkbox" name="m_checkbox" value="${m.memberNo}" <c:if test="${m.enabled == 1}">disabled</c:if>>
							</td>
							<td align="center">${m.memberNo}</td>
							<td align="center">${m.name}</td>
							<td align="center">${m.gender}</td>
							<td align="center">
								${m.jumin1} - 
								<c:if test="${m.gender eq '남성'}">1xxxxxx</c:if>
								<c:if test="${m.gender eq '여성'}">2xxxxxx</c:if>
							</td>
							<td align="center">${m.tel}</td>
							<td align="center">${m.address}</td>
							<td align="center">${m.email}</td>
							<td align="center">${m.inDate}</td>
							<td align="center">
								<c:if test="${m.enabled == 1}"><span style="color: blue;">승인</span></c:if>
								<c:if test="${m.enabled == 0}">대기</c:if>
							</td>
						</tr>
					</c:forEach>
					
					<tr>
						<td align="center" colspan="10">
					    	<%-- 이전버튼 활성화 여부 --%>
							<c:if test="${paging.startPage > 10}">
							    <a href="/admin/memberRegistList?pageNum=${paging.prev}">[이전]</a>
							</c:if>
							
							<%-- 페이지 번호 처리 --%>
							<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
							    <%-- 현재 페이지 번호는 눌리지 않게 처리 --%>
							    <c:if test="${num == paging.currentPage}">
							        <span style="font-weight: bold;">${num}</span>
							    </c:if>
							    
							    <c:if test="${num != paging.currentPage}">
							        <a href="/admin/memberRegistList?pageNum=${num}">${num}</a>
							    </c:if>
							</c:forEach>
							
							<%-- 다음버튼 활성화 여부 --%>
							<c:if test="${paging.endPage < paging.pageCount}">
							    <a href="/admin/memberRegistList?pageNum=${paging.next}">[다음]</a>
							</c:if>
						</td>
    			  </tr>
			</table>
     	</div>					
	<!-- 테이블 내용 끝 -->
	<hr>
    </div>
   <%@include file = "/WEB-INF/views/common/footer.jsp" %>
   </main>
   </div>
  <!-- page-content" -->
</body>
</html>