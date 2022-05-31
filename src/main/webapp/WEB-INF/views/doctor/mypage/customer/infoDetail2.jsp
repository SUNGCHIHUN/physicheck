<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>담당회원정보상세</title>
<!-- css -->
<link rel = "stylesheet" href = "${path}/resources/css/adminCSS/admin.css">
<link rel = "stylesheet" href = "${path}/resources/css/bootstrap.min.css">

<!-- js -->
<script src="${path}/resources/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/63d3d77b59.js" crossorigin="anonymous"></script>

<!-- chart -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

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
	
	$("#phsicBtn").click(function() {
		  // var param = getParam("reserveNo");
		 //  window.open("customerDetailPhysical?reserveNo=${param.reserveNo}", '운동검사상세','width=800px,height=900px' );
		  location.href="doctorCustomerDetail2Modify?reserveNo=${param.reserveNo}"
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
      <h2>담당회원정보상세</h2>
      <hr>
      <div class="row">
	</div>
	
	<!-- 테이블 내용 시작 -->					
	   <div class="container">
	        	<div class="row">
					<table width="100%">
						<tr>
							<th style="" align="left" width="150px"><h5>운동검사 번호  </h5></th>
							<th align="left"><h5>${mdto.reserveNo}</h5></th>
							<td align="right">
								<input type="button" name="button" id="phsicBtn" class="btn btn-primary" value="수정">
							</td>
						</tr>
					</table>
				</div>
	        </div>

	        <!-- 여기부터 내용 넣으면 됩니다! -->
	        <div class="container">
	        	<!-- 테이블 내용 시작 -->					
				<div style="padding-top: 50px">
					<h5>회원정보</h5>
					<table class="table table-bordered">
						    <tr>
						      <th scope="col">번호</th>
						      <td>${mdto.memberNo}</td>
						      <th scope="col">예약번호</th>
						      <td>${mdto.reserveNo}</td>
						    </tr>
						    <tr>
						      <th scope="col">이름</th>
						      <td>${mdto.name}</td>
						      <th scope="col">나이</th>
						      <td>
						      <c:set var="jumin" value="${mdto.jumin1}"/>
							  <!-- 현재년도 가져오기 -->
							  <c:set var="now" value="<%=new java.util.Date()%>" />
							  <c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
							  <c:set var="year" value="${fn:substring(sysYear,2,4)}"/>
							  
							  <!-- 나이 구하기 -->
							  <c:set value="${fn:substring(jumin,0,2)}" var="frontJumin"/>
							  <c:set var = "age1" value="${100-frontJumin+1}"/>
							  <!-- 계산한나이-->
   							  <c:set var = "age" value="${age1+year}" />
   							  <c:set var = "age2" value="${age-1}" />
   							  ${age}세(만 ${age2}세)
								
						      </td>
						      </tr>
						    <tr>
						      <th scope="col">주민번호</th>
						      <td>${mdto.jumin1} - *******</td>
						      <th scope="col">성별</th>
						      <td>${mdto.gender}</td>
						    </tr>
					 </table>
				</div>
				
				<c:set var="result1" value="${dto1.run3kmResult + dto1.balkeProtocolResult}"/>
				<c:set var="result2" value="${dto2.forwardBendingResult + dto2.bridgeResult}"/>
				<c:set var="result3" value="${dto3.longJumpResult + dto3.run50Result}"/>
				<c:set var="result4" value="${dto4.squirtResult + dto4.benchPressResult}"/>
				<c:set var="result5" value="${dto5.sitUpResult + dto5.pushUpResult}"/>
				<c:set var="result6" value="${dto6.sideStepResult + dto6.burpeeTestResult}"/>
				
				<!-- 표 -->
				<table class="table table-bordered">
				<tr align="center">  						      
					<td width="600px">
						<!-- canvas에 그리는 거라 없으면 안됨-->
						<canvas id="myChartTwo" style="width:700px; height:800px"></canvas>
							<!-- Chart를 위한 최소 내용-->
							<script>
							const ctx = document.getElementById('myChartTwo').getContext('2d'); 
							const myChartTwo = new Chart( ctx, {
							    type: 'radar', 
							    data: {
						        labels: [
						            '심폐지구력',
						            '유연성',
						            '순발력',
						            '근력',
						            '근지구력',
						            '민첩성'
						          ],// x축의 이름
						        datasets: [{
						            label: '회원의 정보',
						            data: [${result1}, ${result2}, ${result3}, ${result4}, ${result5}, ${result6}],
						            fill: true,
						            backgroundColor: 'rgba(255, 99, 132, 0.2)',
						            borderColor: 'rgb(255, 99, 132)',
						            pointBackgroundColor: 'rgb(255, 99, 132)',
						            pointBorderColor: '#fff',
						            pointHoverBackgroundColor: '#fff',
						            pointHoverBorderColor: 'rgb(255, 99, 132)'
						        }, {
						            label: '최소값',
						            data: [1, 1, 1, 1, 1, 1],
						            fill: false,
						            backgroundColor: 'rgba(54, 162, 235, 0.2)',
						            borderColor: 'rgb(54, 162, 235)',
						            pointBackgroundColor: 'rgb(54, 162, 235)',
						            pointBorderColor: '#fff',
						            pointHoverBackgroundColor: '#fff',
						            pointHoverBorderColor: 'rgb(54, 162, 235)'
						          },
						          {		label: '최대값',
							            data: [10, 10, 10, 10, 10, 10],
							            fill: false,
							            backgroundColor: 'rgb(0, 0, 0, 0)',
							            borderColor: 'rgb(0, 0, 0)',
							            pointBackgroundColor: 'rgb(0, 0, 0)',
							            pointBorderColor: '#fff',
							            pointHoverBackgroundColor: '#fff',
							            pointHoverBorderColor: 'rgb(0, 0, 0)'
							          }]            
							    },
							    options: {
							    	responsive: false
							    	
							    }
							});
							</script>
						</td>
						</tr>
					 </table>
				</div>
			<%@include file = "/WEB-INF/views/common/footer.jsp" %>
		</div>
   </main>
</div>
</body>
</html>