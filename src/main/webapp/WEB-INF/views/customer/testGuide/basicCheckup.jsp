<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검사안내</title>


<!-- css -->
<link rel = "stylesheet" href = "${path}/resources/css/bootstrap.min.css">
<link rel = "stylesheet" href = "${path}/resources/css/style4.css">
<link rel = "stylesheet" href = "${path}/resources/css/jquery.mCustomScrollbar.min.css">
<!-- web-font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300;500&display=swap" rel="stylesheet">
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

        	<!-- header start -->
			<%@include file = "/WEB-INF/views/common/header.jsp" %>
			<!-- header end -->
			
	        <!-- 회원가입 시작 -->

		    <div class="row featurette">
		      <div class="col-md-7">
		        <h1 class="featurette-heading"><span class="text-muted">Basic Checkup</span></h1>
		        <p class="lead">
					<pre>
						<h3><담당의 소개></h3>
<h4>강주현 원장</h4>
(现)PhysiCheck 기초검사 담당의
(前)서울대병원 내과장
서울대학교병원 전공의 수료
서울대학교 의과대학 졸업
						<hr>
						
						<h3><기초검사란?></h3>
검사항목: 혈액검사, 소변검사, 혈압검사, 체질량검사

기초적인 신체검사로써 검사 결과를 토대로 회원님의 

현재 영양상태, 질병유무 등을 분석하여 향후 각 운동 부위별 

최적의 운동 방법 및 추천 식단 등의 솔루션을 도출하기 위해 필요한 검사입니다.
						<hr>
					</pre>		
				</p>        
		      </div>
		      <div class="col-md-5">
				<img src="${path}/resources/images/guide/basic_doctor.jpg" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" style="width:700px; height:500px;">
		      </div>
		    </div>

		    <!-- 회원가입 끝 -->
		     
     		<hr class="featurette-divider">
     		
     		 <!-- footer start -->	
		      <%@include file = "/WEB-INF/views/common/footer.jsp" %>
			<!-- footer end -->	
     
        </div>
    </div>

</body>
</html>