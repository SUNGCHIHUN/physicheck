<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지</title>

<!-- css -->
<link rel = "stylesheet" href = "${path}/resources/css/adminCSS/admin.css">
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
$(function() {
	$("#insert").click(function() {
			window.location="/admin/noticeInsert";
	});
	
	$('#search').click(function(){
		location.href = 'noticeSearch?searchContent='+$('#searchContent').val();
	});
});
</script>
<script>

	var noticeArr = [];
	var noticeNo = "";
	
	function allCheck() {
		
		if ($("input[name=noticeChk]").is(":checked")) {
			
			$("input[name=noticeChk]:checked").each(function(index, element) {
				$(element).prop("checked", false);
				noticeArr = [];
			});
			
			noticeArr = [];
			
		} else {
			
			$("input[name=noticeChk]").each(function(index, element) {
				$(element).prop("checked", true);
				noticeArr.push($(element).val());
			});
		}
		
	}
	
	$(function(){
		
		$("#delete").click(function(){
			$("input[name=noticeChk]").each(function(index, element) {
				if ($(element).is(":checked")) {
					noticeArr.push($(element).val());
					//alert($(element).val());
				}
			});
			
			document.noticeDelete.action="noticeDelete?noticeArr=" + noticeArr;
			document.noticeDelete.submit();
		});
	});
	
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
  <!-- page-content -->
  <main class="page-content">
    <div class="container-fluid">
      <h2>공지사항</h2>
      <hr>
	
	<!-- 테이블 내용 시작 -->	
	<form name="test"></form>				
	<div class="container">
       	<div class="row">
			<table width="100%">
				<tr>
					<td align="left">
						<div class="input-group sm-3">
						  <input type="text" class="form-control" id="searchContent" placeholder="Search..." style="width:30px;">
						  <div class="input-group-append">
						  	<input type="button" name="search" id="search" class="btn btn-primary" value="검색">
						  </div>
						</div>
					</td>
					<td align="right">
						<input type="button" name="button" id="insert" class="btn btn-primary" value="등록">
						<input type="button" name="button" id="delete" class="btn btn-danger" value="삭제">
					</td>
				</tr>
			</table>
		</div>
				
		<!-- 테이블 내용 시작 -->
		<div style="padding-top: 50px">
		  <form action="noticeDelete" method="post" name="noticeDelete">
		  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			  <table class="table table-hover">
			  	<tr class="info">
					<th class="text-center">
						<input type="checkbox" name="chk" id="chk" checked onclick="allCheck();">
					</th>
					<th class="text-center">번호</th>
					<th class="text-center">제목</th>
					<th class="text-center">작성자</th>
					<th class="text-center">날짜</th>
					<th class="text-center">조회수</th>
				</tr>

				<c:forEach var="dto" items="${list}">
				<tr>
					<td align="center">
						<input type = "checkbox" id="noticeChk" name="noticeChk" value = "${dto.noticeNo}" checked="">
					</td>
					<td align="center">${dto.noticeNo}</td>
					<td align="center"><a href="/admin/noticeDetail?noticeNo=${dto.noticeNo}">${dto.title}</a></td>
					<td align="center">${dto.writer}</td>
					<td align="center">${dto.inDate}</td>
					<td align="center">${dto.readCnt}</td>
				</tr>
				</c:forEach>

				<tr>
					<td colspan=6 align="center">
						<c:if test="${paging.startPage>10}">
							<a href="notice?pageNum=${paging.prev}">[이전]</a>
						</c:if>

						<c:forEach var="noticeNo" begin="${paging.startPage}" end="${paging.endPage}">
							<a href="notice?pageNum=${noticeNo}">${noticeNo}</a>
						</c:forEach>

						<c:if test="${paging.endPage<paging.pageCount}">
							<a href="notice?pageNum=${paging.next}">[다음]</a>
						</c:if>
					</td>
				</tr>
			  </table>
			</form>
		</div>
		<!-- 테이블 내용 끝 -->
	</div>
   	</div>
		<!-- 여기부터 내용 넣으면 됩니다! 끗! -->
		<hr class="featurette-divider">
		<%@include file = "/WEB-INF/views/common/footer.jsp" %>
	</main>
</div>
</body>
</html>