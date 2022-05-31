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
<link rel = "stylesheet" href = "${path}/resources/css/bootstrap.min.css">

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
$(function() {
	$("#edit").click(function() {
			alert("edit");
			document.noticeEdit.action="/admin/noticeEdit";
			document.noticeEdit.submit();
	});
	
	$("#list").click(function() {
			location.href="notice";
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
      		<h2>공지사항 상세</h2>
      		<hr>
	
     		<form name="test"></form>
	 		<div class="container">
				<form action="#" method="post" name="noticeEdit">
					<div class="row">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="hiddenNoticeNo" value="${items.noticeNo}">
						<table width="100%">
							<tr>
								<td align="right">
									<input type="button" name="edit" id="edit" class="btn btn-primary" value="수정">
									<input type="button" name="list" id="list" class="btn btn-danger" value="목록">
								</td>
							</tr>
						</table>
					</div>
					<!-- 테이블 내용 시작 -->
	            	<div style="padding-top: 50px">
						<table class="table table-hover">
							<tr class="info">
		                 		<th style="width:150px">작성일</th>
		                 		<td style="width:150px; text-align:left">
		                    		<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${items.inDate}" />
		                 		</td>
		                 
		                 		<th style="width:150px">조회수</th>
		                 		<td style="width:150px; text-align:left">${items.readCnt}</td>
		              		</tr>
		              		<tr>
		                 		<th style="width:150px">작성자</th>
		                 		<td colspan="3" style="width:150px; text-align:left">${items.writer}</td>
		              		</tr>
		              
			              	<tr>
				                <th>글 제목</th>
				                <td colspan="3" style="text-align:left">${items.title}</td>
			              	</tr>
		              
			                <tr>
				                <th>글 내용</th>
				                <td  colspan="3" style="text-align:left">${items.content}</td>
			                </tr>
						</table>
					</div>
	           </form>
		   </div> <!-- ./container -->
		    <!-- 회원가입 끝 -->
		  </div> 
     		 <!-- footer start -->	
		<hr class="featurette-divider">
			<%@include file = "/WEB-INF/views/common/footer.jsp" %>
			<!-- footer end -->	
	</main>
</div>
  <!-- page-content -->
</body>
</html>