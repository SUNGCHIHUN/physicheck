<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의약품 등록</title>
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
	    <!-- 시작 -->
	    
			<div class="container">
	        	<!-- 테이블 내용 시작 -->
	        	<h3 class="display-4">의약품 정보</h3>
	        	<form action="medicAddAction" method="post" enctype="multipart/form-data">
	        		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
	        		
	        		<div class="form-group">
					    <label for="name">의약품 명</label>
	        			<input type="text" class="form-control" name="name" id="name" required>
					 </div>
		        	<hr>
		        	<div class="form-group">
					    <label for="img">이미지 등록</label>
					    <input type="file" class="form-control-file" name="img" id="img" required>
					 </div>
		        	<hr>
		        	<div class="form-group">
					    <label for="content1">요약 정보</label>
					    <textarea class="form-control" name="content1" id="content1" rows="2" required>
					    </textarea>
					</div>
		        	<hr>
		        	<div class="form-group">
					    <label for="content2">상세 내용</label>
					    <textarea class="form-control" name="content2" id="content2" rows="12" required>
					    </textarea>
					</div>

					<div align="center" style="margin-top: 20px;">
						<button class="w-100 btn btn-primary btn-lg" type="submit">등록</button>
					</div>
				</form>
			</div>
			<!-- container 끝 -->
			
			  <!-- footer start -->	
		      <%@include file = "/WEB-INF/views/doctor/common/footer.jsp" %>
			  <!-- footer end -->	
		</main>
	   </div>
</body>
</html>