<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InfoDetail</title>
<!-- css -->
<link rel = "stylesheet" href = "${path}/resources/css/jquery.mCustomScrollbar.min.css">

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
			<h1 class="h2">종합검사 결과</h1>
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
					
				<!-- 기초검사 -->
			<c:if test="${basicChk != 0}">
				<div style="padding-top: 20px">
					<h5>기초검사</h5>
					<table class="table table-bordered">
					    <tr>
					      <th width="10%">신장(cm)</th>
					      <td width="10%">${bmi.height}</td>
					      <th width="10%">체중(kg)</th>
					      <td width="10%">${bmi.weight}</td>		     
					    </tr>
					    
					    <tr>					      
					      <th width="10%">MBI(kg/m2)</th>
					      <td width="10%">${bmi.bmi}</td>
					      
					      <c:choose>
					      	<c:when test="${bmi.bmi < 18.5}">
				      			<p>저체중</p>
					      	</c:when>
					      	<c:when test="${bmi.bmi < 22.9}">
				      			<p>정상</p>
					      	</c:when>
					      	<c:when test="${bmi.bmi < 24.9}">
				      			<p>과체중</p>
					      	</c:when>
					      	<c:when test="${bmi.bmi < 29.9}">
				      			<p>경도비만(1단계 비만)</p>
					      	</c:when>
					      	<c:when test="${bmi.bmi < 34.9}">
				      			<p>중도비만(2단계 비만)</p>
					      	</c:when>
					      	<c:when test="${bmi.bmi > 35}">
				      			<p>고도비만</p>
					      	</c:when>
					      	<c:otherwise>
					      		<p>X</p>
					      	</c:otherwise>
					      </c:choose>
					      <td width="30%" colspan="2">
		                    <div class="progress blue">
		                        <div class="progress-bar" style="width:${bmi.bmi}%; background:#3485ef;">
		                            <div class="progress-value">${bmi.bmi}</div>
		                        </div>
		                    </div>
					      </td>	 
					      	
					      	      				      
					    </tr>
					    
					    <tr>
					      <th width="10%">체지방(g/cm^3)</th>
					      <td width="10%">${bmi.bodyFat}</td>
					      <td width="30%" colspan="2">
					      	<div class="progress blue">
		                        <div class="progress-bar" style="width:${bmi.bodyFat}%; background:#3485ef;">
		                            <div class="progress-value">${bmi.bodyFat}</div>
		                        </div>
		                    </div>
					      </td>	 
					    </tr>
					    
					    <tr>			      
					      <th width="10%">근량(kg)</th>
					      <td width="10%">${bmi.bodyMuscle}</td>
					       <td width="30%" colspan="2">
					      	<div class="progress blue">
		                        <div class="progress-bar" style="width:${bmi.bodyMuscle}%; background:#3485ef;">
		                            <div class="progress-value">${bmi.bodyMuscle}</div>
		                        </div>
		                    </div>
					      </td>	 
					    </tr>
					    
					    <tr> 					      
					      <th width="10%">체수분량(ml)</th>
					      <td width="10%">${bmi.bodyWater}</td>
					       <td width="30%" colspan="2">
					      	<div class="progress blue">
		                        <div class="progress-bar" style="width:${bmi.bodyWater}%; background:#3485ef;">
		                            <div class="progress-value">${bmi.bodyWater}</div>
		                        </div>
		                    </div>
					      </td>	 
					    </tr>
					 </table>
				</div>
				
				<div style="padding-top: 20px">
					<h5 style="padding-top: 20px">혈압검사</h5>
					<table class="table table-bordered">
					    <tr>
					      <th width="10%">최고혈압(mmHg)</th>
					      <td width="10%">${pressure.pressureHigh}</td>
					      <th width="10%">최저혈압(mmHg)</th>
					      <td width="10%">${pressure.pressureLow}</td>
					    </tr>

					    <tr>   
					      <th width="10%">고혈압</th>
					      <td width="10%" colspan="3">
					      	<c:choose>
					      	<c:when test="${pressure.pressureHigh < 130 && pressure.pressureLow < 130}">
				      			<p>정상혈압</p>
					      	</c:when>
					      	<c:when test="${pressure.pressureHigh < 139 && pressure.pressureLow < 139}">
				      			<p>고혈압 전단계</p>
					      	</c:when>
					      	<c:when test="${pressure.pressureHigh < 159 && pressure.pressureLow < 159}">
				      			<p>고혈압 1단계(경증)</p>
					      	</c:when>
					      	<c:when test="${pressure.pressureHigh < 179 && pressure.pressureLow < 179}">
				      			<p>고혈압 2단계(중등증)</p>
					      	</c:when>
					      	<c:when test="${pressure.pressureHigh < 209 && pressure.pressureLow > 209}">
				      			<p>고혈압 3단계(중증)</p>
					      	</c:when>
					      	<c:otherwise>
					      		<p>문제있음(고혈압)</p>
					      	</c:otherwise>
					        </c:choose>
					      </td>
					    </tr>
					 </table>
				</div>
				
				<div style="padding-top: 20px">
					<h5 style="padding-top: 20px">소변검사</h5>
					<table class="table table-bordered">
					    <tr>
					      <th width="10%">요단백(mg/dL)</th>
					      <td width="10%">${urine.urineProtein}</td>
					      <td width="10%">
					      	<c:choose>
					      	<c:when test="${urine.urineProtein < 10}">
				      			<p>음성</p>
					      	</c:when>
					      	<c:when test="${urine.urineProtein > 10}">
				      			<p>양성</p>
					      	</c:when>
					      	<c:otherwise>
					      		<p>문제있음(요단백)</p>
					      	</c:otherwise>
					        </c:choose>
					      </td>
					      <td>
					      	<div class="progress blue">
		                        <div class="progress-bar" style="width:${urine.urineProtein}%; background:#3485ef;">
		                            <div class="progress-value">${urine.urineProtein}</div>
		                        </div>
		                    </div>
					      </td>
					    </tr>
					    <tr>
					      <th width="10%">요산(mg/dL)</th>
					      <td width="10%">${urine.urineAcid}</td>
					      <td width="10%">  
					      	<c:choose>
					      	<c:when test="${urine.urineAcid > 250 && urine.urineAcid < 750 }">
				      			<p>정상</p>
					      	</c:when>
					      	<c:when test="${urine.urineAcid < 250}">
				      			<p>비정상</p>
					      	</c:when>
					      	<c:when test="${urine.urineAcid > 750 }">
				      			<p>비정상</p>
					      	</c:when>
					      	<c:otherwise>
					      		<p>문제있음(요산)</p>
					      	</c:otherwise>
					        </c:choose>
					      </td>
					      <td>
					      	<div class="progress blue">
		                        <div class="progress-bar" style="width:${urine.urineAcid}%; background:#3485ef;">
		                            <div class="progress-value">${urine.urineAcid}</div>
		                        </div>
		                    </div>
					      </td>
					    </tr>
					    <tr>
					      <th width="10%">요당</th>
					      <td width="10%">${urine.urineGlucose}</td>
					      <td width="10%">
					      	<c:choose>
					      	<c:when test="${urine.urineGlucose < 30}">
				      			<p>음성</p>
					      	</c:when>
					      	<c:when test="${urine.urineGlucose > 30}">
				      			<p>양성</p>
					      	</c:when>
					      	<c:otherwise>
					      		<p>문제있음(요산)</p>
					      	</c:otherwise>
					        </c:choose>
					      </td>
					      <td>
					      	<div class="progress blue">
		                        <div class="progress-bar" style="width:${urine.urineGlucose}%; background:#3485ef;">
		                            <div class="progress-value">${urine.urineGlucose}</div>
		                        </div>
		                    </div>
					      </td>
					    </tr>
					 </table>
				</div>
				
				<div style="padding-top: 20px">
					<h5 style="padding-top: 20px">혈액검사</h5>
					<table class="table table-bordered">
					    <tr>
					      <th width="10%">적혈구(10^6 /㎣)</th>
					      <td width="10%">${blood.redBloodCell}</td>
					      <td width="10%">
					      	<c:set var="gender" value="${mdto.gender}"/>
				      		<c:if test="${gender eq '남성'}">
				      			<c:choose>
							      	<c:when test="${blood.redBloodCell > 4.2 && blood.redBloodCell < 6.3}">
						      			<p>정상</p>
							      	</c:when>
							      	<c:when test="${blood.redBloodCell < 4.2}">
						      			<p>부족</p>
							      	</c:when>
							      	<c:when test="${blood.redBloodCell > 6.3}">
						      			<p>과다</p>
							      	</c:when>
							      	<c:otherwise>
							      		<p>문제있음(적혈구)</p>
							      	</c:otherwise>
						        </c:choose>
				      		</c:if>
				      		<c:if test="${gender eq '여성'}">
				      			<c:choose>
							      	<c:when test="${blood.redBloodCell > 4.0 && blood.redBloodCell < 5.4}">
						      			<p>정상</p>
							      	</c:when>
							      	<c:when test="${blood.redBloodCell < 4.0}">
						      			<p>부족</p>
							      	</c:when>
							      	<c:when test="${blood.redBloodCell > 5.4}">
						      			<p>과다</p>
							      	</c:when>
							      	<c:otherwise>
							      		<p>문제있음(적혈구)</p>
							      	</c:otherwise>
						        </c:choose>
				      		</c:if>
					      </td>
					      <td>
					      	<div class="progress blue">
		                        <div class="progress-bar" style="width:${blood.redBloodCell}%; background:#3485ef;">
		                            <div class="progress-value">${blood.redBloodCell}</div>
		                        </div>
		                    </div>
					      </td>
					    </tr>
					    <tr>
					      <th width="10%">백혈구(10^3/㎣)</th>
					      <td width="10%">${blood.whiteBloodCell}</td>
					      <td width="10%">
				      		<c:choose>
					      	<c:when test="${blood.whiteBloodCell > 4.0 && blood.whiteBloodCell < 10.0}">
				      			<p>정상</p>
					      	</c:when>
					      	<c:when test="${blood.whiteBloodCell < 4.0}">
				      			<p>부족</p>
					      	</c:when>
					      	<c:when test="${blood.whiteBloodCell > 10.0}">
				      			<p>과다</p>
					      	</c:when>
					      	<c:otherwise>
					      		<p>문제있음(백혈구)</p>
					      	</c:otherwise>
					        </c:choose>
					      </td>
					      <td>
					      	<div class="progress blue">
		                        <div class="progress-bar" style="width:${blood.whiteBloodCell}%; background:#3485ef;">
		                            <div class="progress-value">${blood.whiteBloodCell}</div>
		                        </div>
		                    </div>
					      </td>
					    </tr>
					    <tr>
					      <th width="10%">혈소판(10^3)</th>
					      <td width="10%">${blood.bloodPlatelet}</td>
					      <td width="10%">
				      		<c:choose>
						      	<c:when test="${blood.bloodPlatelet > 130 && blood.bloodPlatelet < 400}">
					      			<p>정상</p>
						      	</c:when>
						      	<c:when test="${blood.bloodPlatelet < 130}">
					      			<p>부족</p>
						      	</c:when>
						      	<c:when test="${blood.bloodPlatelet > 400}">
					      			<p>과다</p>
						      	</c:when>
						      	<c:otherwise>
						      		<p>문제있음(혈소판)</p>
						      	</c:otherwise>
					        </c:choose>
					      </td>
					      <td>
					      	<div class="progress blue">
		                        <div class="progress-bar" style="width:${blood.bloodPlatelet}%; background:#3485ef;">
		                            <div class="progress-value">${blood.bloodPlatelet}</div>
		                        </div>
		                    </div>
					      </td>
					    </tr>
					    <tr>
					      <th width="10%">혈색소</th>
					      <td width="10%">${blood.liverFunction}</td>
					      <td width="10%">
					      	<c:if test="${gender eq '남성'}">
					      		<c:choose>
							      	<c:when test="${blood.liverFunction > 13.0 && blood.liverFunction < 17.0}">
						      			<p>정상</p>
							      	</c:when>
							      	<c:when test="${blood.liverFunction < 13.0}">
						      			<p>부족</p>
							      	</c:when>
							      	<c:when test="${blood.liverFunction > 17.0}">
						      			<p>과다</p>
							      	</c:when>
							      	<c:otherwise>
							      		<p>문제있음(혈색소)</p>
							      	</c:otherwise>
						        </c:choose>
					      	 </c:if>
					      	 <c:if test="${gender eq '여성'}">
					      		<c:choose>
							      	<c:when test="${blood.liverFunction > 12.0 && blood.liverFunction < 16.0}">
						      			<p>정상</p>
							      	</c:when>
							      	<c:when test="${blood.liverFunction < 12.0}">
						      			<p>부족</p>
							      	</c:when>
							      	<c:when test="${blood.liverFunction > 16.0}">
						      			<p>과다</p>
							      	</c:when>
							      	<c:otherwise>
							      		<p>문제있음(혈색소))</p>
							      	</c:otherwise>
						        </c:choose>
					      	 </c:if>
					      </td>
					      <td>
					      	<div class="progress blue">
		                        <div class="progress-bar" style="width:${blood.liverFunction}%; background:#3485ef;">
		                            <div class="progress-value">${blood.liverFunction}</div>
		                        </div>
		                    </div>
					      </td>
					    </tr>
					    <tr>
					      <th width="10%">혈당</th>
					      <td width="10%">${blood.bloodGlucose}</td>
					      <td width="10%">
				      		<c:choose>
					      	<c:when test="${blood.bloodGlucose <= 126}">
				      			<p>정상</p>
					      	</c:when>
					      	<c:when test="${blood.bloodPlatelet > 126}">
				      			<p>비정상</p>
					      	</c:when>
					      	<c:otherwise>
					      		<p>문제있음(혈소판)</p>
					      	</c:otherwise>
					        </c:choose>
					      </td>
					      <td>
					      	<div class="progress blue">
		                        <div class="progress-bar" style="width:${blood.bloodPlatelet}%; background:#3485ef;">
		                            <div class="progress-value">${blood.bloodPlatelet}</div>
		                        </div>
		                    </div>
					      </td>
					    </tr>
					 </table>
				</div>
				</c:if>
			<!-- 기초검사 끝 -->
			
			<c:if test="${basicChk == 0}">
				<hr>
					<h3>* 기초검사 결과가 아직 등록 되지 않았습니다.</h3>
				<hr>
			</c:if>
			
			
			
			
			
			<!-- 운동검사 -->
			<c:if test="${physicalChk != 0}">
			
			<div style="padding-top: 20px">
					<table class="table">
						<tr>
							<th style="" align="left" width="150px"><h5>운동검사 결과  </h5></th>
							<%-- <th align="left"><h5>${reserveNo}</h5></th> --%>
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
				</c:if>
			<!-- 운동검사 끝 -->
			
			<c:if test="${physicalChk == 0}">
				<hr>
					<h3>* 운동검사 결과가 아직 등록 되지 않았거나 검사항목이 아닙니다.</h3>
				<hr>
			</c:if>
			
			
			<!-- 심리검사 -->
			<c:if test="${mentalChk != 0}">
			<div style="padding-top: 20px">
					<h5>심리검사</h5>
					<table class="table table-bordered">
						<tr>
							<th>항목</th>
							<th>총합</th>
							<th>비고</th>
						</tr>
					    <tr>
					      <th scope="col">시각</th>
					      <td>${dto10.total1}</td>
					      <td>
						      <c:set var="total1" value="${dto10.total1}"/>
						      <c:choose>
						      	<c:when test="${total1 <= 12}">
					      			<p>매일 연습을 통해 심상기술을 발달시켜야 함</p>
						      	</c:when>
						      	<c:when test="${total1 >= 13 && total1 <= 17}">
					      			<p>기술 수준이 보통. 매주 시간을 할애하여 심상기술을 발달 시켜야 함</p>
						      	</c:when>
						      	<c:when test="${total1 >= 17 && total1 <= 20}">
					      			<p>기술 수준이 높음. 주기적으로 연습하여 높은 수준을 유지 해야 함</p>
						      	</c:when>
						      	<c:otherwise>
						      		<p>아직 설문에 응하지 않았음</p>
						      	</c:otherwise>
						      	</c:choose>
					        </td>
					      </tr>
					      <tr>
					      <th scope="col">청각</th>
					      <td>${dto10.total2}</td>
					      <td>
						      <c:set var="total2" value="${dto10.total2}"/>
						      <c:choose>
						      	<c:when test="${total2 <= 12}">
					      			<p>매일 연습을 통해 심상기술을 발달시켜야 함</p>
						      	</c:when>
						      	<c:when test="${total2 >= 13 && total2 <= 17}">
					      			<p>기술 수준이 보통. 매주 시간을 할애하여 심상기술을 발달 시켜야 함</p>
						      	</c:when>
						      	<c:when test="${total2 >= 17 && total2 <= 20}">
					      			<p>기술 수준이 높음. 주기적으로 연습하여 높은 수준을 유지 해야 함</p>
						      	</c:when>
						      	<c:otherwise>
						      		<p>아직 설문에 응하지 않았음</p>
						      	</c:otherwise>
						      	</c:choose>
					        </td>
					      </tr>
					      <tr>
					      <th scope="col">운동감각</th>
					      <td>${dto10.total3}</td>
					      <td>
						      <c:set var="total3" value="${dto10.total3}"/>
						      <c:choose>
						      	<c:when test="${total3 <= 12}">
					      			<p>매일 연습을 통해 심상기술을 발달시켜야 함</p>
						      	</c:when>
						      	<c:when test="${total3 >= 13 && total3 <= 17}">
					      			<p>기술 수준이 보통. 매주 시간을 할애하여 심상기술을 발달 시켜야 함</p>
						      	</c:when>
						      	<c:when test="${total3 >= 17 && total3 <= 20}">
					      			<p>기술 수준이 높음. 주기적으로 연습하여 높은 수준을 유지 해야 함</p>
						      	</c:when>
						      	<c:otherwise>
						      		<p>아직 설문에 응하지 않았음</p>
						      	</c:otherwise>
						      	</c:choose>
					        </td>
					       </tr>
					       <tr>
					       <th scope="col">기분상태</th>
					       <td>${dto10.total4}</td>
					       <td>
						       <c:set var="total4" value="${dto10.total4}"/>
						       <c:choose>
						       <c:when test="${total4 <= 12}">
					       			<p>매일 연습을 통해 심상기술을 발달시켜야 함</p>
						       </c:when>
						       <c:when test="${total4 >= 13 && total4 <= 17}">
					      			<p>기술 수준이 보통. 매주 시간을 할애하여 심상기술을 발달 시켜야 함</p>
						      	</c:when>
						      	<c:when test="${total4 >= 17 && total4 <= 20}">
					      			<p>기술 수준이 높음. 주기적으로 연습하여 높은 수준을 유지 해야 함</p>
						      	</c:when>
						      	<c:otherwise>
						      		<p>아직 설문에 응하지 않았음</p>
						      	</c:otherwise>
						      	</c:choose>
					        </td>
					       </tr>
					       <tr>
					       <th scope="col">조절력</th>
					       <td>${dto10.total5}</td>
					       <td>
						       <c:set var="total5" value="${dto10.total5}"/>
						       <c:choose>
						       <c:when test="${total5 <= 12}">
					       			<p>매일 연습을 통해 심상기술을 발달시켜야 함</p>
						       </c:when>
						       <c:when test="${total5 >= 13 && total5 <= 17}">
					      			<p>기술 수준이 보통. 매주 시간을 할애하여 심상기술을 발달 시켜야 함</p>
						      	</c:when>
						      	<c:when test="${total5 >= 17 && total5 <= 20}">
					      			<p>기술 수준이 높음. 주기적으로 연습하여 높은 수준을 유지 해야 함</p>
						      	</c:when>
						      	<c:otherwise>
						      		<p>아직 설문에 응하지 않았음</p>
						      	</c:otherwise>
						      	</c:choose>
					        </td>
					       </tr>
					 </table>
					 
					 <h5>담당의 소견서</h5>
					 <table class="table table-bordered">
					 	<tr>
					 		<td>${dto10.comments}</td>
					 	</tr>
					 </table>
				</div>
			
			</c:if>
			<!-- 심리검사 끝 -->
			
			<c:if test="${mentalChk == 0}">
				<hr>
					<h3>* 심리검사 결과가 아직 등록 되지 않았거나 검사항목이 아닙니다.</h3>
				<hr>
			</c:if>
			
			
			<hr class="featurette-divider">
			<!-- 테이블 내용 끝 -->
        </div>
    	<!-- footer start -->	
	  	<%@include file = "/WEB-INF/views/common/footer.jsp" %>
		<!-- footer end -->	
    </main>
    </div>
  </div>
	  
</body>
</html>