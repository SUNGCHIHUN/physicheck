<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>심리검사등록</title>

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
<!-- 구글차트 라이브러리 이용 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- <script type="text/javascript">

	var chartData = new Array(); // 차트 데이터
	
	var total1 = new Array(); // 시각
	var total2 = new Array(); // 청각
	var total3 = new Array(); // 운동감각
	var total4 = new Array(); // 기분상태
	var total5 = new Array(); // 조절력

	// 페이지가 로딩되면 차트 출력
	$(function() {
		loadChart();
	});

	// 차트 출력하기
	function loadChart() {

		// 구글 차트 라이브러리 불러오기
		google.charts.load('current', {'packages':['corechart', 'bar']});
		
		// 차트 정보를 매개변수로 받아서 그에 맞는 구글 차트 출력
		google.charts.setOnLoadCallback(drawChart);
	}
		
	// 차트 정보 설정 메서드
	function drawChart() {

		chartData[0] = ['시각', '청각', '운동감각', '기분상태', '조절력']; // 차트 타이틀
		
		// 데이터 값들을 각 변수에 저장
		$("input[name=total1]").each(function(i, e) {
			total1[i] = $(e).val();
		});
		
		$("input[name=total2]").each(function(i, e) {
			total2[i] = $(e).val();
		});

		$("input[name=total3]").each(function(i, e) {
			total3[i] = parseInt($(e).val());
		});
		
		$("input[name=total4]").each(function(i, e) {
			total4[i] = parseInt($(e).val());
		});
		
		$("input[name=total5]").each(function(i, e) {
			total5[i] = parseInt($(e).val());
		});
		
		console.log('시각 : ' + total1);
		console.log('청각 : ' + total2);
		console.log('운동감각 : ' + total3);
		console.log('기분상태 : ' + total4);
		console.log('조절력 : ' + total5);
		
		
		/* // 차트데이터에 값 저장
		for (var i=0; i<dateCount; i++) {
			var data = [date[i] + ' - ' + doctorName[i], examTotal[i]];
			chartData[i+1] = data;
			console.log(chartData[i+1]);
		} */
		
		// 차트 데이터
		var data = google.visualization.arrayToDataTable(chartData);
		
		// 차트 꾸미기
		var options = {
          chart: {
            title: '실적',
            subtitle: 'Doctor Performance',
          },
          bars: 'horizontal' // Required for Material Bar Charts.
        };
		
		// 차트 객체 생성(뿌려질 위치의 div id를 받는다.)
		var chart = new google.visualization.BarChart(document.getElementById('bar-chart'));

		// 설정된 정보들을 이용하여 차트를 화면에 출력
		chart.draw(data, options);
	}
</script> -->
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
      <h2>심리검사등록</h2>
      <hr>
	
	<!-- 테이블 내용 시작 -->
	<form action="mentalResultInsert?reserveNo=${mdto.reserveNo}" method="post" name="basicResultboardInsert">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<div class="container">
		<div class="row">
					<table width="100%">
						<tr>
							<td align="right">
								<input type="submit" id="update" class="btn btn-primary" value="등록">
							</td>
						</tr>
					</table>
				</div>
	        </div>
	  	
	        <div class="container">
	        	<!-- 테이블 내용 시작 -->					
				<div style="padding-top: 50px">
					<h5>회원정보</h5>
					<table class="table table-bordered">
						    <tr>
						      <th scope="col">번호</th>
						      <td>
						      	  ${mdto.memberNo}
							      <input type="hidden" name="memberNo" value="${mdto.memberNo}">
							  </td>
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
				
				<div style="padding-top: 20px">
					<h5>설문지 검사 결과</h5>
					<table class="table table-bordered">
						<tr>
							<th>항목</th>
							<th>총합</th>
							<th>비고</th>
						</tr>
					    <tr>
					      <th scope="col">시각</th>
					      <td>${dto1.total1}</td>
					      <td>
						      <c:set var="total1" value="${dto1.total1}"/>
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
					      <td>${dto1.total2}</td>
					      <td>
						      <c:set var="total2" value="${dto1.total2}"/>
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
					      <td>${dto1.total3}</td>
					      <td>
						      <c:set var="total3" value="${dto1.total3}"/>
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
					       <td>${dto1.total4}</td>
					       <td>
						       <c:set var="total4" value="${dto1.total4}"/>
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
					       <td>${dto1.total5}</td>
					       <td>
						       <c:set var="total5" value="${dto1.total5}"/>
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
				</div>
				
				<hr class="featurette-divider">
				
				<div style="padding-top: 20px">
		  			<div id="bar-chart"></div>
				</div>
				
				<div style="padding-top: 20px">
					<h5>소견서</h5>
					<table class="table table-bordered">
					    <tr>
                        <td><textarea rows="5" cols="120" name="comments" id="comments"></textarea></td>
                     	</tr>
					 </table>
				</div>
				
				<hr class="featurette-divider">
				
			<%@include file = "/WEB-INF/views/common/footer.jsp" %>
		</div>
	<!-- 테이블 내용 끝 -->
	</form>					
   </div>
   </main>
  <!-- page-content -->
</div>
</body>
</html>