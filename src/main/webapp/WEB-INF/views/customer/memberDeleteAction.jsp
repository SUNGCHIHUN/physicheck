<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보확인</title>

<!-- css -->
<link rel = "stylesheet" href = "${path}/resources/css/bootstrap.min.css">
<link rel = "stylesheet" href = "${path}/resources/css/style4.css">
<link rel = "stylesheet" href = "${path}/resources/css/jquery.mCustomScrollbar.min.css">

<!-- js -->
<script src="${path}/resources/js/customerJS/join.js"></script>
<script src="https://kit.fontawesome.com/63d3d77b59.js" crossorigin="anonymous"></script>
<link rel = "stylesheet" href = "${path}/resources/js/bootstrap.min.js">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<script type="text/javascript">

	$(document).ready(function () {
      $('#sidebarCollapse').on('click', function () {
          $('#sidebar').toggleClass('active');
      });
  	});
</script>
</head>
<body>
    <div class="wrapper">
        <!-- laftbar start -->
			<%@include file = "/WEB-INF/views/common/leftbar.jsp" %>
		<!-- laftbar end -->

        <!-- Page Content  -->
        <div id="content">


			<!-- 탈퇴실패 -->
			<c:if test="${deleteCnt ==0}">
				<script type="text/javascript">
					errorAlert(deleteError);
				</script>
			</c:if>
			
			<!-- 탈퇴성공 - 세션 삭제, main.jsp로 이동 -->
			<c:if test="${deleteCnt != 0}">
				<% 			
					request.getSession().invalidate();
				%>
				<script type="text/javascript">
					setTimeout(function(){
						alert("탈퇴처리되었습니다.");
						window.location="main";
					}, 1000);
				</script>
			</c:if>	<!-- 탈퇴성공 -->
		</div> <!-- ./container -->
		    <!-- 회원정보 확인 끝 -->
		     
     		<hr class="featurette-divider">
     
    </div>
</body>
</html>