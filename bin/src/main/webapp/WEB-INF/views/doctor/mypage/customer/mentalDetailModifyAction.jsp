<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기초검사등록Action</title>

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
  <main class="page-content">
	  <div class="container-fluid">
	  	<!-- InsertCnt -->
	    <c:if test="${insertCnt == 0}">
			<script type="text/javascript">
				alert("insert 실패(InsertCnt)");
			</script>
		</c:if>
		<c:if test="${insertCnt != 0}">
			<script type="text/javascript">
				setTimeout(function() {
					alert("심리검사comment결과 등록 완료.");
					self.close();
				},1000);
			</script>
		</c:if>
	  </div>
  </main>
  <!-- page-content -->
</body>
</html>