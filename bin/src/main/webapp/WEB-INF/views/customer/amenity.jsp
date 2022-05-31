<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>amenity</title>

<!-- css -->
<link rel = "stylesheet" href = "${path}/resources/css/bootstrap.min.css">
<link rel = "stylesheet" href = "${path}/resources/css/style4.css">
<link rel = "stylesheet" href = "${path}/resources/css/jquery.mCustomScrollbar.min.css">

<!-- js -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel = "stylesheet" href = "${path}/resources/js/bootstrap.min.js">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });
</script>

<style>
	ul {
	   list-style:none;
	}
</style>

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
	
	<!-- 오시는길 시작 -->
	        <div class="jumbotron">
				<div class="container">
					<h4>편의 시설</h4><!-- class="display-4" -->
				</div>
			</div>
			
			<div class="container">
				<div id="amenity" style="width:100%;height:500px;">

  				<form name="" method="post">
	 				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />					
					<table align="center" width="800px" padding="10px">
				
						<tr>
							<th colspan="2" style="padding: 2px 5px">한식당 금강산</th>
						</tr>
						<tr>
							<td rowspan="5" width="300px"><img src="https://www.amc.seoul.kr/asan/images/infor/food/sum3_big_01.jpg"></td>										
						</tr>
						<tr>
							<td>대표메뉴 : 해물순두부찌개, 사골우거지탕, 도가니탕</td>
						</tr>
						<tr>
							<td>영업 / 운영시간 : 07:30 ~ 15:30</td>
						</tr>
						<tr>
							<td>위치 : 동관 지하1층</td>							
						</tr>						
						<tr>
							<td>문의 : 02-3010-6191</td>							
						</tr>
						
						
						
						<tr>
							<th colspan="2" style="padding: 2px 5px">한식당 한강</th>
						</tr>
						
						<tr>
							<td rowspan="5" width="300px"><img src="https://www.amc.seoul.kr/asan/images/infor/food/sum4_big_01.jpg"></td>										
						</tr>
						<tr>
							<td>대표메뉴 : 설렁탕, 갈비탕</td>
						</tr>
						<tr>
							<td>영업 / 운영시간 : 07:30 ~ 15:30</td>
						</tr>
						<tr>
							<td>위치 : 동관 지하1층</td>							
						</tr>
						<tr>
							<td>문의 : 02-3010-6398</td>							
						</tr>						
						
						
						<tr>
							<th colspan="2" style="padding: 2px 5px">불교 법당</th>
						</tr>
						
						<tr>
							<td rowspan="5" width="300px"><img src="https://www.amc.seoul.kr/asan/images/infor/religion/sum2_big_01.jpg"></td>										
						</tr>
						<tr>
							<td>명상 : 04:30</td>
						</tr>
						<tr>
							<td>위치 : 서관 3층 강당</td>
						</tr>
						<tr>
							<td>법당 : 24시간 개방</td>							
						</tr>
						<tr>
							<td>문의 : 02-3010-7892</td>							
						</tr>						
						
						
						<tr>
							<th colspan="2" style="padding: 2px 5px">KEB하나은행</th>
						</tr>	
						<tr>
							<td rowspan="4" width="300px"><img src="https://www.amc.seoul.kr/asan/images/infor/conFac/sum4_big_01.jpg"></td>										
						</tr>
						<tr>
							<td>영업 / 운영시간 : 09:00 ~ 16:00 (토, 일, 공휴일 휴무)</td>
						</tr>
						<tr>
							<td>위치 : 신관 지하1층</td>
						</tr>
						<tr>
							<td>문의 : 02-3010-8647</td>							
						</tr>																							
					</table>
				</form>
					
    			</div>			
			</div>
			
	 <!-- footer start -->	
	      <%@include file = "/WEB-INF/views/common/footer.jsp" %>
	<!-- footer end -->	
	
	 </div>	<!-- content 끝 -->
</div>		<!-- wrapper 끝 -->
</body>
</html>