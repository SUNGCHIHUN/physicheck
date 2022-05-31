<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>resultInsert</title>
<!-- css -->
<link rel = "stylesheet" href = "${path}/resources/css/adminCSS/admin.css">
<link rel = "stylesheet" href = "${path}/resources/css/bootstrap.min.css">

<!-- js -->
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
</head>
<body>
<header class="header">
	<%@include file = "/WEB-INF/views/doctor/common/header.jsp" %>
</header>
<div class="page-wrapper chiller-theme toggled">
  <a id="show-sidebar" class="btn btn-sm" href="#" style="background:#606ea8;">
    <i class="fas fa-bars"></i>
  </a>
  <%@include file = "/WEB-INF/views/doctor/common/leftbar.jsp" %>
  <!-- page-content -->
  <main class="page-content">
  	<div class="container-fluid">
      <h2>운동검사등록</h2>
      <hr>
    <div class="container">
		<!-- <div class="row">
		<table width="100%">
			<tr>
				<td align="left">
					<div class="input-group sm-3">
					  <input type="text" class="form-control" placeholder="Search..." style="width:30px;">
					  <div class="input-group-append">
					  	<input type="button" name="button" id="search" class="btn btn-primary" value="검색">
					  </div>
					</div>
				</td>
			</tr>
		</table>
		</div> -->
		
		<!-- 테이블 내용 시작 -->					
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr class="info">
					<th class="text-center">예약번호</th>
					<th class="text-center">회원번호</th>
					<th class="text-center">회원명</th>
					<th class="text-center">예약날짜</th>
				</tr>
				
				<c:forEach var="dto" items="${list}">
					<c:if test="${dto.physicalNo != 0}">
					<tr>
						<td align="center">${dto.reserveNo}</td>
						<td align="center">${dto.memberNo}</td>
						<td align="center"><a href="exerciseResult?reserveNo=${dto.reserveNo}">${dto.name}</a></td>
						<td align="center">${dto.reserveDate}</td>
					</tr>
					</c:if>
				</c:forEach>
				
				<tr>
					<td colspan="4" align="center">
				    <!-- 페이징 처리 -->
					<!-- 이전버튼 활성화 여부 -->
					<c:if test="${paging.startPage > 10}">
						<a href="/doctor/resultList2?pageNum=${paging.prev}">[이전]</a>
					</c:if>
					
					<!-- 페이지번호 처리 -->
					<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
						<a href= "/doctor/resultList2?pageNum=${num}">${num}</a>
					</c:forEach>
					
					<c:if test="${paging.endPage < paging.pageCount}">
						<a href="/doctor/resultList2.pd?pageNum=${paging.next}">[다음]</a>
					</c:if>
					</td>
   			  </tr>
		  </table>
		</div>
		<!-- 테이블 내용 끝 -->
	</div>
   </div>
   <hr>
   <%@include file = "/WEB-INF/views/common/footer.jsp" %>
   </main>
  <!-- page-content -->
</div>
</body>
</html>