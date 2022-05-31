<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InfoDetail</title>
<!-- css -->
<link rel = "stylesheet" href = "${path}/resources/css/bootstrap.min.css">
<link rel = "stylesheet" href = "${path}/resources/css/dashboard.css">
<link rel = "stylesheet" href = "${path}/resources/css/jquery.mCustomScrollbar.min.css">

<!-- js -->
<link rel = "stylesheet" href = "${path}/resources/js/bootstrap.min.js">
<!-- chart -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
	
 	   <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
   	   <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
      	<!-- 각 화면 제목 -->
        <h1 class="h2">검사 결과</h1>
         </div>
        
         <!-- 여기부터 내용 넣으면 됩니다! -->
	        <div class="container">
	        	<!-- 테이블 내용 시작 -->					
				
				<div style="padding-top: 20px">
					<table class="table">
						<tr>
							<th style="" align="left" width="150px"><h5>운동검사 번호  </h5></th>
							<th align="left"><h5>${reserveNo}</h5></th>
						</tr>
						<c:set var="result1" value="${dto1.run3kmResult + dto1.balkeProtocolResult}"/>
						<c:set var="result2" value="${dto2.forwardBendingResult + dto2.bridgeResult}"/>
						<c:set var="result3" value="${dto3.longJumpResult + dto3.run50Result}"/>
						<c:set var="result4" value="${dto4.squirtResult + dto4.benchPressResult}"/>
						<c:set var="result5" value="${dto5.sitUpResult + dto5.pushUpResult}"/>
						<c:set var="result6" value="${dto6.sideStepResult + dto6.burpeeTestResult}"/>
					</table>
				
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
				
				<!-- 테이블 내용 끝 -->
				<div style="padding-top: 20px">
					<h5>심페지구력</h5>
					<table class="table table-bordered">
					    <tr>
					      <th width="20%">3km 달리기 (분:초)</th>
					      <c:set var="run3km1" value="${dto1.run3km / 60}" />
					      
					      <td width="15%"><input type="text" id="run3km1" name="run3km1" style="color:blue;" class="form-control" readonly value="<c:out value="${fn:substring(run3km1,0,2)}"/>"></td> 
					      <td width="15%"><input type="text" id="run3km2" name="run3km2" style="color:blue;" class="form-control" readonly value="<c:out value="${fn:substring(run3km1,3,5)}"/>"></td>
					      <th width="20%">Balke 프로토콜 (180회/분)</th>
					      <td width="30%"><input type="text" id="balkeProtocol" style="color:blue;" name="balkeProtocol" class="form-control" readonly value="${dto1.balkeProtocol}"></td>
					    </tr>
					 </table>
				</div>
				
				<div style="padding-top: 20px">
					<h5>유연성</h5>
					<table class="table table-bordered">
					    <tr>
					      <th width="20%">앞으로 굽히기 (cm)</th>
					      <td width="30%"><input type="text" id="forwardBending" name="forwardBending" style="color:blue;" class="form-control" readonly value="${dto2.forwardBending}"></td>
					      <th width="20%">브릿지 테스트 (cm)</th>
					      <td width="30%"><input type="text" id="bridge" name="bridge" style="color:blue;" class="form-control" readonly value="${dto2.bridge}"></td>
					    </tr>
					 </table>
				</div>
				
				<div style="padding-top: 20px">
					<h5>순발력</h5>
					<table class="table table-bordered">
					    <tr>
					      <th width="20%">제자리 멀리 뛰기 (cm)</th>
					      <td width="30%"><input type="text" id="longJump" name="longJump" style="color:blue;" class="form-control" readonly value="${dto3.longJump}"></td>
					      <th width="20%">50m 달리기 (초)</th>
					      <td width="30%"><input type="text" id="run50" name="run50" style="color:blue;" class="form-control" readonly value="${dto3.run50}"></td>
					    </tr>
					 </table>
				</div>
				
				<div style="padding-top: 20px">
					<h5>근력</h5>
					<table class="table table-bordered">
						<tr>
							<th colspan="4">스쿼트</th>
						</tr>
					    <tr>
					      <th width="20%">무게 (kg)</th>
					      <td width="30%"><input type="text" id="squirt" name="squirt" style="color:blue;"  class="form-control" readonly value="${dto4.squirt}"></td>
					    </tr>
					    <tr>
							<th colspan="4">벤치 프레스</th>
						</tr>
					    <tr>
					      <th width="20%">무게 (kg)</th>
					      <td width="30%"><input type="text" id="benchPress" name="benchPress" style="color:blue;" class="form-control" readonly value="${dto4.benchPress}"></td>
					    </tr>
					 </table>
				</div>
				
				<div style="padding-top: 20px">
					<h5>근지구력</h5>
					<table class="table table-bordered">
					    <tr>
					      <th width="20%">윗몸일으키기 (1분/회)</th>
					      <td width="30%"><input type="text" id="sitUp" name="sitUp" style="color:blue;" class="form-control" readonly value="${dto5.sitUp}"></td>
					      <th width="20%">팔굽혀펴기 (2분/회)</th>
					      <td width="30%"><input type="text" id="pushUp" name="pushUp" style="color:blue;" class="form-control" readonly value="${dto5.pushUp}"></td>
					    </tr>
					 </table>
				</div>
				
				<div style="padding-top: 20px">
					<h5>민첩성</h5>
					<table class="table table-bordered">
					    <tr>
					      <th width="20%">사이드 스텝 (20초/회)</th>
					      <td width="30%"><input type="text" id="sideStep" name="sideStep" style="color:blue;" class="form-control" readonly value="${dto6.sideStep}"></td>
					      <th width="20%">버피 테스트 (30초/회)</th>
					      <td width="30%"><input type="text" id="burpeeTest" name="burpeeTest" style="color:blue;" class="form-control" readonly value="${dto6.burpeeTest}"></td>
					    </tr>
					 </table>
				</div>
				
				
	        </div>
        
    	<!-- footer start -->	
	  	<%@include file = "/WEB-INF/views/common/footer.jsp" %>
		<!-- footer end -->	
    </main>
    </div>
  </div>
  
</body>
</html>