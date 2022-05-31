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
		        <h2 class="featurette-heading"><span class="text-muted">Sport Mental Checkup</span></h2>
		        <p class="lead">
		        
	<pre>
			

	<h4><검사 목적></h4>


	스포츠 상황을 상상하는 능력을 시각, 청각, 운동감각, 기분상태, 조절력으로 세분화
	
	영역별로 평가하고 선수의 스포츠 상황의 상상능력의 장단점을 파악해서

	선수한테 심리 상담을 해준다.
								
								
	<h4><검사 방법></h4>
	 
	 	
	■ 검사지 문항
	
	다음 사항을 읽은 후에 그 상황을 가능한 구체적으로 상상을 해본다.	 

	그 다음 눈을 감고 심신이 이완되도록 심호흡을 한다.
	
	이 순간에 머리 속의 잡념은 모두 잊는다. 
	
	약 1분간 눈을 감고 제시된 상황을 상상한다. 
	
	상상이 끝나면 자신의 머리 속에 떠오르는 이미지와 가장 가깝다고 생각 되는 번호에 표시
	
	검사지에선 가상의 스포츠 상황이 4가지를 설명하고 
	
	각 상황마다 5가지의 검사 문항이 있다.
	
	각 영역별로 최저점은 4점이고 최고점은 20점이다. 


	</pre>		        
	
		        </p>
		      </div>
		      <div class="col-md-5">
				<img src="${path}/resources/images/guide/mental_test2.jpg" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" style="width:700px; height:500px;">
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