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
			document.noticeEdit.action="/admin/noticeEditAction";
			document.noticeEdit.submit();
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
	 <form action="#" method="post" name="noticeEdit">
		<div style="padding-top: 50px">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="hiddenNoticeNo" value="${items.noticeNo}">
		<table class="table table-hover">
			<tr class="info">
                <th>작성자</th>
                <td><input type="text" class="input" name="writer" id="writer" size="97" value="${items.writer}"></td>
             </tr>
             <tr>
                <th>글 제목</th>
                <td><input type="text" class="input" name="title" id="title" size="97" value="${items.title}"></td>
             </tr>
             
             <tr>
                <th>글 내용</th>
                <td><textarea rows="10" cols="100" name="content" id="content">${items.content}</textarea></td>
             </tr>
         </table>
	</div>
	    <!-- 회원가입 끝 -->
	  <div align="center">
          <hr class="my-4">
          <input type="button" class="w-100 btn btn-primary btn-lg" id="edit" value="수정" style ="width:100px !important">
          <!-- <button class="w-100 btn btn-primary btn-lg" type="submit" style ="width:100px !important">수정</button> -->
	  </div>
	  <hr>
	  <%@include file = "/WEB-INF/views/common/footer.jsp" %>
       <!-- 여기부터 내용 넣으면 됩니다! 끗! -->
       </form>
      </div>
     </div>
	<!-- 테이블 내용 끝 -->
    </main>
      </div>
  <!-- page-content -->
</body>
</html>