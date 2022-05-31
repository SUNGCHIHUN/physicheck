<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식사요법</title>

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
            
            $('#search').click(function(){
        		location.href = '/noticeSearch?searchContent='+$('#searchContent').val();
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
			
			<!-- 식사요법 시작 -->
			<div class="container">
	        	<!-- 테이블 데이터 내용 시작 -->
	        	<h3 class="display-4">식사요법 - ${diet.title}</h3>
			    <img src="${diet.image}" alt="식단 이미지 - ${diet.image}" width="400" height="400">
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
	        		<p><img src="${diet.image2}" alt="추천식단 이미지 - ${diet.image2}"  width="400" height="400"></p>
			</div>
			<!-- container 끝 -->
			
			  <!-- footer start -->	
		      <%@include file = "/WEB-INF/views/common/footer.jsp" %>
			  <!-- footer end -->	
     
        </div>
    </div>
</body>
</html>