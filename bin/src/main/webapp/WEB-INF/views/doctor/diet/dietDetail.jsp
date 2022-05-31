<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식사요법 목록</title>
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
   		
   		// 식단 삭제
   		function deleteDiet(no) {
   			if(confirm('삭제하시겠습니까?')) {
   				window.location="dietDeleteAction?dietNo=" + no;
   			}
   		}
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
        	<h3 class="display-4">식사요법 - ${diet.title}</h3>
		    <div align="center">
		    	<img src="${diet.image}" alt="식단 이미지 - ${diet.image}" width="400" height="400">
		    </div>
        	<hr>
	        	<h4>식사요법의 필요성</h4>	
        		<p>${diet.content1}</p>
        		
       		<hr>
	       		<h4>식사요법의 실제</h4>	
        		<p>${diet.content2}</p>
        		
        	<hr>
        		<h4>권장 식품</h4>	
        		<p>${diet.content3}</p>
			
        	<hr>
        		<h4>주의 식품</h4>
        		<p>${diet.content4}</p>
        		
        	<hr>
        		<h4>그 외 주의사항</h4>
        		<p>${diet.content5}</p>
        		
        	<hr>
        		<h4>추천 식단</h4>
        		<div align="center">
		    		<img src="${diet.image2}" alt="식단 이미지 - ${diet.image2}" width="400" height="400">
		    	</div>
        	<div align="center" style="margin-top: 20px;">
   		        <button class="w-100 btn btn-danger btn-lg" onclick="deleteDiet('${diet.dietNo}');">삭제</button>
			</div>
		</div>
		
		<!-- container 끝 -->
		
		  <!-- footer start -->	
	      <%@include file = "/WEB-INF/views/common/footer.jsp" %>
		  <!-- footer end -->	
	    </main>
    </div>
</body>
</html>