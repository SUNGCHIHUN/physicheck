<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단 등록</title>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });

        const autoHyphen = (target) => {
       	 target.value = target.value
       	  	.replace(/[^0-9]/g, '')
       	  	.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
   		};
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
    <!-- 식사요법 시작 -->
			<div class="container">
	        	<!-- 테이블 데이터 내용 시작 -->
	        	<h3 class="display-4">식사요법</h3>
	        	<form action="dietAddAction" method="post" enctype="multipart/form-data">
	        		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
	        		<div class="form-group">
					    <label for="title">식단명</label>
	        			<input type="text" class="form-control" name="title" id="title" required>
					 </div>
		        	<hr>
		        	<div class="form-group">
					    <label for="image">이미지 등록</label>
					    <input type="file" class="form-control-file" name="image" id="image" required>
					 </div>
		        	<hr>
		        	<div class="form-group">
					    <label for="content1">식사요법의 필요성</label>
					    <textarea class="form-control" name="content1" id="content1" rows="3" required>
					    </textarea>
					</div>
					<hr>
		        	<div class="form-group">
					    <label for="content2">식사요법의 실제</label>
					    <textarea class="form-control" name="content2" id="content2" rows="3" required>
					    </textarea>
					</div>
					<hr>
		        	<div class="form-group">
					    <label for="content3">권장 식품</label>
					    <textarea class="form-control" name="content3" id="content3" rows="3" required>
					    </textarea>
					</div>
					<hr>
		        	<div class="form-group">
					    <label for="content4">주의 식품</label>
					    <textarea class="form-control" name="content4" id="content4" rows="3" required>
					    </textarea>
					</div>
					<hr>
		        	<div class="form-group">
					    <label for="content5">그 외 주의사항</label>
					    <textarea class="form-control" name="content5" id="content5" rows="3" required>
					    </textarea>
					</div>
					<hr>
		        	<div class="form-group">
					    <label for="image2">추천 식단</label>
					    <input type="file" class="form-control-file" name="image2" id="image2" required>
					</div>
					<div align="center" style="margin-top: 20px;">
						<button class="w-100 btn btn-primary btn-lg" type="submit">등록</button>
					</div>
				</form>
			</div>
			<!-- container 끝 -->
			
			  <!-- footer start -->	
		      <%@include file = "/WEB-INF/views/common/footer.jsp" %>
			  <!-- footer end -->	
		</main>
	   </div>
</body>
</html>