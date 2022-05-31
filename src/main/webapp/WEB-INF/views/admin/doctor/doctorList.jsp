<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의료진 관리</title>
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
<script>

//선택한 의료진들의 번호 배열
var doctorArr = new Array();

	// 제이쿼리 사용
	$(function() {
		
		// 전체 체크박스를 누른 경우
		$("#basket").click(function() {
			// disabled가 아닌 경우만
			if (!$(this).is(":disabled")) {
				// 체크상태로 설정되면
				if ($("#basket").is(":checked")) {
					console.log('전체 선택됨');
					console.log(doctorArr);
					
					// 모든 체크박스 선택 처리
					$("input[name='d_checkbox']").each(function(i, e) {
						// disabled가 아닌 경우만
						if (!$(this).is(":disabled")) {
							$(e).prop("checked", true);
							doctorArr.push($(e).val());
							console.log(doctorArr);
						};
					});
					
				// 체크 해제된 상태로 설정되면
				} else {
					console.log('전체 해제됨');
					
					// 모든 체크박스 해제 처리
					$("input[name='d_checkbox']").each(function(i, e) {
						// disabled가 아닌 경우만
						if (!$(this).is(":disabled")) {
							$(e).prop("checked", false);
							doctorArr = [];
							console.log(doctorArr);
						}
					});
				}
				
			}
		});
		
		
		// 개별 체크박스
		$("input[name='d_checkbox']").each(function(i, e) {
			
			// 체크박스를 클릭한 경우
			$(e).click(function() {
				
				// 처음부터 다시 확인
				doctorArr = [];
				$("input[name='d_checkbox']").each(function(i, e) {
					// disabled가 아닌 경우만
					if (!$(this).is(":disabled")) {
						// 체크상태이면
						if($(this).is(":checked")) {
							doctorArr.push($(this).val());	
						};
					};
				});
				
				// 모두 체크 해제인 경우 false 처리
				if (doctorArr.length == 0) {
					$("#basket").prop("checked", false);
				}
				
				// 모두 체크 선택인 경우 true 처리
				if (doctorArr.length != 0) {
					$("#basket").prop("checked", true);
				}
				
				console.log(doctorArr);
				
			});
		});
	});
	
	// 의료진 등록 페이지 이동
	function addDoctor() {
		window.location='/admin/doctorRegistForm';
	}
	
	// 의료진 삭제
	function deleteDoctor() {
		
		// 선택된 의료진 수
		var selected = doctorArr.length;
		console.log(selected);
		
		// 하나라도 선택하지 않은 경우
		if (selected == 0) {
			alert('삭제할 의료진을 선택하세요.');
			
		// 하나라도 선택한 경우
		} else {
			if(confirm(selected + '명의 의료진을 삭제하시겠습니까?')) {
				window.location='/admin/doctorDeleteAction?doctorArr=' + doctorArr + '&pageNum=${paging.currentPage}';
			};	
		}
	}

	// 의료진 검색
	function searchDoctor() {
		var keyword = $("input[name=keyword]").val();
		window.location='/admin/doctorList?keyword=' + keyword;
	}
	
	// 엔터키로 검색
	function enterkey() {
		if (window.event.keyCode == 13) {
			searchDoctor();
	    }
	}

</script>
</head>
<body>
	<div id="test"></div>
	
<header class="header">
	<%@include file = "/WEB-INF/views/admin/common/header.jsp" %>
</header>
<div class="page-wrapper chiller-theme toggled">
  <a id="show-sidebar" class="btn btn-sm" href="#" style="background:#606ea8;">
    <i class="fas fa-bars"></i>
  </a>
  <%@include file = "/WEB-INF/views/admin/common/leftbar.jsp" %>
  <!-- page-content -->
  <main class="page-content">
    <div class="container-fluid">
      <h2>의료진 관리</h2>
      <hr>
      
      
      
	  <!-- 테이블 내용 시작 -->		
      <div class="row">
      	<table width="100%">
			<tr>
				<td align="left">
					<div class="input-group sm-3">
					  <input type="text" class="form-control" name="keyword" placeholder="Search..." style="width:30px;" onkeyup="enterkey()">
					  <div class="input-group-append">
					  	<input type="button" name="button" id="search" class="btn btn-primary" value="검색" onclick="searchDoctor()">
					  </div>
					</div>
				</td>
				<td align="right">
					<input type="button" name="button" id="insert" class="btn btn-primary" value="등록" onclick="addDoctor()">
					<input type="button" name="button" id="delete" class="btn btn-danger" value="삭제" onclick="deleteDoctor()">
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
					<th class="text-center">입사일</th>
					<th class="text-center">퇴사일</th>
					<th class="text-center">검진과목</th>
				</tr>
				<c:forEach var="d" items="${dlist}">
					<tr>
						<td align="center">
							<input type = "checkbox" id="checkbox" name="d_checkbox" value="${d.memberNo}" <c:if test="${d.outDate != null}">disabled</c:if>>
						</td>
						<td align="center">${d.memberNo}</td>
						<td align="center"><a href="/admin/doctorModifyForm?doctorNo=${d.memberNo}&pageNum=${paging.currentPage}">${d.name}</a></td>
						<td align="center">${d.gender}</td>
						<td align="center">
							${d.jumin1}-
							<c:if test="${d.gender eq '남성'}">1xxxxxx</c:if>
							<c:if test="${d.gender eq '여성'}">2xxxxxx</c:if>
						</td>
						<td align="center">${d.tel}</td>
						<td align="center">${d.address}</td>
						<td align="center">${d.email}</td>
						<td align="center">${d.inDate}</td>
						<c:if test="${d.outDate == null}">
							<td align="center"">-</td>
						</c:if>
						<c:if test="${d.outDate != null}">
							<td align="center" style="color: red;">${d.outDate}</td>
						</c:if>
						
						<td align="center">${d.examination}</td>
					</tr>
				</c:forEach>
				<tr>
					<td align="center" colspan="11">
				    	<%-- 이전버튼 활성화 여부 --%>
						<c:if test="${paging.startPage > 10}">
						    <a href="/admin/doctorList?pageNum=${paging.prev}">[이전]</a>
						</c:if>
						
						<%-- 페이지 번호 처리 --%>
						<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
						    <%-- 현재 페이지 번호는 눌리지 않게 처리 --%>
						    <c:if test="${num == paging.currentPage}">
						        <span style="font-weight: bold;">${num}</span>
						    </c:if>
						    
						    <c:if test="${num != paging.currentPage}">
						        <a href="/admin/doctorList?pageNum=${num}">${num}</a>
						    </c:if>
						    
						</c:forEach>
						
						<%-- 다음버튼 활성화 여부 --%>
						<c:if test="${paging.endPage < paging.pageCount}">
						    <a href="/admin/doctorList?pageNum=${paging.next}">[다음]</a>
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
  <!-- page-content -->
</div>
</body>
</html>