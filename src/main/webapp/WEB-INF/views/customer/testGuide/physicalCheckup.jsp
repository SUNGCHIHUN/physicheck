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
		        <h2 class="featurette-heading"><span class="text-muted">Physical Checkup</span></h2>
		        <p class="lead">
					<pre>
						<h3><담당의 소개></h3>
						<h4>최도균 원장</h4>
(现)PhysiCheck 운동검사 담당의
(前)서울대병원 정형외과장
서울대학교병원 전공의 수료
서울대학교 의과대학 졸업
						<hr>
						
						<h3><운동검사란?></h3>
검사항목: 심폐지구력검사, 유연성검사, 순발력검사, 근력검사, 

근지구력검사, 민첩성검사 등

회원의 운동 능력을 측정하여 신체 밸런스, 

각 운동 능력의 발달 정도 등을 분석합니다.

분석 자료를 토대로 향후 부족한 부분과 

그에 알맞는 트레이닝 솔루션을 제시하기 위해 필요한 검사입니다.
						<hr>
					</pre>		        
		        </p>	        
		      </div>
		      <div class="col-md-5">
				<img src="${path}/resources/images/guide/sports_doctor.jpg" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" style="width:700px; height:500px;">
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