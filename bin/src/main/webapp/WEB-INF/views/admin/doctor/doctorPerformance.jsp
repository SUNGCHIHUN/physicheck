<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의료진 실적</title>
<!-- css -->
<link rel = "stylesheet" href = "${path}/resources/css/adminCSS/admin.css">
<link rel = "stylesheet" href = "${path}/resources/css/bootstrap.min.css">

<!-- script -->
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
<script type="text/javascript">

	var chartData = new Array(); // 차트 데이터
	
	// 기본 날짜 설정
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth();
	
	var date = new Array(); // 연도
	var doctorName = new Array(); // 의료진명
	var examTotal = new Array(); // 실적

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

		chartData[0] = ['의료진명', '실적']; // 차트 타이틀
		
		// 데이터 값들을 각 변수에 저장
		$("input[name=date]").each(function(i, e) {
			date[i] = $(e).val();
		});
		
		$("input[name=doctorName]").each(function(i, e) {
			doctorName[i] = $(e).val();
		});

		$("input[name=examTotal]").each(function(i, e) {
			examTotal[i] = parseInt($(e).val());
		});
		
		console.log('date : ' + date);
		console.log('doctorName : ' + doctorName);
		console.log('examTotal : ' + examTotal);
		
		// 차트데이터에 값 저장
		for (var i=0; i<date.length; i++) {
			var data = [date[i] + ' - ' + doctorName[i], examTotal[i]];
			chartData[i+1] = data;
			console.log(chartData[i+1]);
		}
		
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
	
	// 연도별 실적 조회
	function getYearPerformance() {
		window.location='/admin/doctorPerformance';
	}
	
	// 월별 실적 조회
	function getMonthPerformance() {
		window.location='/admin/doctorPerformanceMonth?year=' + year;
	}
	
	// 일별 실적 조회
	function getDayPerformance() {
		window.location='/admin/doctorPerformanceDay?year=' + year + '&month=' + month;
	}
	
</script>

</head>
<body>
<header class="header">
	<%@include file = "/WEB-INF/views/admin/common/header.jsp" %>
</header>
<div class="page-wrapper chiller-theme toggled">
  <a id="show-sidebar" class="btn btn-sm" href="#" style="background:#606ea8;">
    <i class="fas fa-bars"></i>
  </a>
  <%@include file = "/WEB-INF/views/admin/common/leftbar.jsp" %>
  <!-- sidebar-wrapper  -->
  <main class="page-content">
    <div class="container-fluid">
      <h2>의료진 실적</h2>
      <hr>
      <div class="row">
	</div>
	
	<!-- 테이블 내용 시작 -->					
	<!-- 여기부터 내용 넣으면 됩니다! -->
        <div class="container">
        	<div class="row">
				<table width="100%">
					<tr>
	    			  	<td align="center">
			        		<input type="button" value="연도별" class="btn btn-secondary" onclick='getYearPerformance()'>
			        		<input type="button" value="월별" class="btn btn-secondary" onclick='getMonthPerformance()'>
			        		<input type="button" value="일별" class="btn btn-secondary" onclick='getDayPerformance()'>
						</td>
	    			</tr>
				</table>
			</div>
        	<!-- 테이블 내용 시작 -->					
			<div style="padding-top: 50px; text-align: center">
				<div id="bar-chart"></div>
				<table class="table table-hover">
					<tr class="info">					
						<th class="text-center">날짜</th>		
						<th class="text-center">번호</th>
						<th class="text-center">의료진명</th>
						<th class="text-center">성별</th>
						<th class="text-center">검진과목</th>
						<th class="text-center">실적</th>
					</tr>
					
					<%-- 행 구분용 --%>
					<c:set var="date" value="0" />
					<c:set var="basic" value="0" />
					<c:set var="physical" value="0" />
					<c:set var="mental" value="0" />
					<c:set var="allTotal" value="0" />
					
					<c:forEach var="py" items="${pylist}" varStatus="status">
						<c:if test="${py.examination != null}">
							<tr>
								<td align="center">
									<input type="hidden" name="date" value="${py.performanceYear}">
									${py.performanceYear}년
								</td>
								<td align="center">
									${py.memberNo}
								</td>
								<td align="center">
									<input type="hidden" name="doctorName" value="${py.name}">
									${py.name}
								</td>
								<td align="center">
									${py.gender}
								</td>
								<td align="center">
									${py.examination}
								</td>
								<td align="center">
									<input type="hidden" name="examTotal" value="${py.examTotal}">
									<fmt:formatNumber value="${py.examTotal}" pattern="#,###원" />
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
			<!-- 테이블 내용 끝 -->
        </div>
        <!-- 여기부터 내용 넣으면 됩니다! 끗! -->
	<!-- 테이블 내용 끝 -->
     </div>
   <hr>
   <%@include file = "/WEB-INF/views/common/footer.jsp" %>
   </main>
  <!-- page-content" -->
</div>
</body>
</html>