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
	  	<!-- InsertCnt -->
	    <c:if test="${bmiInsertCnt == 0}">
			<c:if test="${pressureInsertCnt == 0}">
				<c:if test="${urineInsertCnt == 0}">
					<c:if test="${bloodInsertCnt == 0}">
						<script type="text/javascript">
							alert("insert 실패(InsertCnt)");
						</script>
					</c:if>
				</c:if>
			</c:if>
		</c:if>
		<c:if test="${bmiInsertCnt != 0}">
			<c:if test="${pressureInsertCnt != 0}">
				<c:if test="${urineInsertCnt != 0}">
					<c:if test="${bloodInsertCnt != 0}">
						<script type="text/javascript">
							setTimeout(function() {
								alert("기본검사결과 등록 완료.");
								window.location="/doctor/resultList1";
							},1000);
						</script>
					</c:if>
				</c:if>
			</c:if>
		</c:if>
	  </div>
  </main>
  <!-- page-content -->
</div>
</body>
</html>