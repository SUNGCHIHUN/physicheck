<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검사항목별 결산</title>
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
	var month = today.getMonth() + 1;
	
	var date = new Array(); // 연도
	var basicTotal = new Array(); // 기초검사 합계
	var physicalTotal = new Array(); // 운동검사 합계
	var mentalTotal = new Array(); // 심리검사 합계
	var allTotal = new Array(); // 전체 합계
	var yoy = new Array(); // 전년대비 값

	// 페이지가 로딩되면 차트 출력
	$(function() {
		loadChart();
	});

	// 차트 출력하기
	function loadChart() {

		// 구글 차트 라이브러리 불러오기
		google.charts.load('current', {'packages':['corechart']});
		
		// 차트 정보를 매개변수로 받아서 그에 맞는 구글 차트 출력
		google.charts.setOnLoadCallback(drawChart);
	}
		
	// 차트 정보 설정 메서드
	function drawChart() {

		chartData[0] = ['연도', '기초검사', '운동검사', '심리검사', '총 매출']; // 차트 타이틀
		
		// 데이터 값들을 각 변수에 저장
		$("input[name=date]").each(function(i, e) {
			date[i] = $(e).val();
		});
		
		$("input[name=basicTotal]").each(function(i, e) {
			basicTotal[i] = parseInt($(e).val());
		});

		$("input[name=physicalTotal]").each(function(i, e) {
			physicalTotal[i] = parseInt($(e).val());
		});
		
		$("input[name=mentalTotal]").each(function(i, e) {
			mentalTotal[i] = parseInt($(e).val());
		});
		
		$("input[name=allTotal]").each(function(i, e) {
			allTotal[i] = parseInt($(e).val());
		});
		console.log(date);
		console.log(basicTotal);
		console.log(physicalTotal);
		console.log(mentalTotal);
		console.log(allTotal);
		
		// 전년대비 퍼센트 값
		for (var i=0; i<allTotal.length; i++) {
			
			yoy[i] = (i == 0) ? 0 : (Math.floor(((allTotal[i] - allTotal[i-1]) / allTotal[i-1]) * 10000)) / 100;
		}
		
		// 출력
		$(".yoy").each(function(i, e) {
			if (yoy[i] < 0)
				$(e).css({"color": "blue", "font-weight": "bold"});
			if (yoy[i] > 0)
				$(e).css({"color": "red", "font-weight": "bold"});
			
			$(e).html(yoy[i] + " %");
		});
		
		// 차트데이터에 값 저장
		for (var i=0; i<date.length; i++) {
			var data = [date[i], basicTotal[i], physicalTotal[i], mentalTotal[i], allTotal[i]];
			chartData[i+1] = data;
		}

		console.log('chartData : ', chartData);
		
		// 차트 데이터
		var data = google.visualization.arrayToDataTable(chartData);
		
		// 차트 꾸미기
		var options = {
			title : '검사항목별 매출 추이', // 차트 타이틀명
            vAxis: {title: '매출'},
            hAxis: {title: '연도별'},
            width: '100%',
	  	    height: 400,
            seriesType: 'bars',
            series: {3: {type: 'line'}}
		};
		
		// 차트 객체 생성(뿌려질 위치의 div id를 받는다.)
		var chart = new google.visualization.ComboChart(document.getElementById('combo-chart'));

		// 설정된 정보들을 이용하여 차트를 화면에 출력
		chart.draw(data, options);
	}
	
	// 연도별 결산
	function getYearTest() {
		window.location='/admin/testSales';
	}
	
	// 월별 결산
	function getMonthTest() {
		window.location='/admin/testSalesMonth?year=' + year;
	}
	
	// 일별 결산
	function getDayTest() {
		window.location='/admin/testSalesDay?year=' + year + '&month=' + month;
	}
	
	// 총 결산
	function getTotalSales() {
		window.location='/admin/totalSales';
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
      <h2>검사항목별 매출</h2>
      <hr>
      <div class="row">
	</div>
	
	<!-- 테이블 내용 시작 -->		
	<div class="container">
	        	<div class="row">
	        		<table width="100%">
						<tr>
							<td align="center">
				        		<input type="button" value="연도별" class="btn btn-secondary" onclick='getYearTest()'>
				        		<input type="button" value="월별" class="btn btn-secondary" onclick='getMonthTest()'>
				        		<input type="button" value="일별" class="btn btn-secondary" onclick='getDayTest()'>
				        		<input type="button" value="전체" class="btn btn-primary" onclick='getTotalSales()'>
							</td>
						</tr>
					</table>
	        	</div>
	        	<!-- 테이블 내용 시작 -->					
				<div style="padding-top: 50px; text-align: center">
					<div id="combo-chart"></div>
					<table class="table table-hover">
						<tr class="info">
							<th class="text-center">날짜</th>
							<th class="text-center">기초검사</th>
							<th class="text-center">운동검사</th>
							<th class="text-center">심리검사</th>
							<th class="text-center">총 매출(기초 + 운동 + 심리)</th>
							<th class="text-center">전년 대비</th>
						</tr>
						<%-- 행 구분용 --%>
						<c:set var="date" value="0" />
						<c:set var="basic" value="0" />
						<c:set var="physical" value="0" />
						<c:set var="mental" value="0" />
						<c:set var="allTotal" value="0" />
						<c:set var="total" value="0" />
						<c:set var="isNull" value="0" />
						
						<c:forEach var="yts" items="${ytslist}" varStatus="status">
							<c:if test="${yts.testCode != null}">
								<c:if test="${date != yts.paymentYear}">
									<c:set var="date" value="${yts.paymentYear}"/>
									<c:set var="allTotal" value="0" />
									<tr>
										<td align="center">
											<input type="hidden" name="date" value="${yts.paymentYear}">
											${yts.paymentYear}년
										</td>
								</c:if>
								<c:if test="${yts.testCode eq 'A'}">
									<td align="center">
										<c:set var="basic" value="1" />
										<c:set var="allTotal" value="${allTotal + yts.total}" />
										<input type="hidden" name="basicTotal" value="${yts.total}">
										<fmt:formatNumber value="${yts.total}" pattern="#,###원"/>									
									</td>
								</c:if>
								<c:if test="${yts.testCode ne 'A' and yts.testCode eq 'B'}">
									<c:if test="${basic == 0}">
										<c:set var="basic" value="1" />
										<td align="center">	
											<input type="hidden" name="basicTotal" value="0">
											<fmt:formatNumber value="0" pattern="#,###원"/>
										</td>
									</c:if>
									<td align="center">
										<c:set var="physical" value="1" />
										<c:set var="allTotal" value="${allTotal + yts.total}" />
										<c:set var="total" value="${total + allTotal}" />
										<input type="hidden" name="physicalTotal" value="${yts.total}">
										<fmt:formatNumber value="${yts.total}" pattern="#,###원"/>									
									</td>
								</c:if>
								<c:if test="${yts.testCode ne 'A' and yts.testCode ne 'B' and yts.testCode eq 'C'}">
									<c:if test="${basic == 0}">
										<c:set var="basic" value="1" />
										<td align="center">	
											<input type="hidden" name="basicTotal" value="0">
											<fmt:formatNumber value="0" pattern="#,###원"/>
										</td>
									</c:if>
									<c:if test="${physical == 0}">
										<c:set var="physical" value="1" />
										<td align="center">	
											<input type="hidden" name="physicalTotal" value="0">
											<fmt:formatNumber value="0" pattern="#,###원"/>
										</td>
									</c:if>
									<td align="center">
										<c:set var="mental" value="1" />
										<c:set var="allTotal" value="${allTotal + yts.total}" />
										<c:set var="total" value="${total + allTotal}" />
										<input type="hidden" name="mentalTotal" value="${yts.total}">
										<fmt:formatNumber value="${yts.total}" pattern="#,###원"/>									
									</td>
									<c:if test="${basic == 1 and physical == 1 and mental == 1}">
										<c:set var="basic" value="0" />
										<c:set var="physical" value="0" />
										<c:set var="mental" value="0" />
										<td align="center">
											<input type="hidden" name="allTotal" value="${allTotal}">		
											<c:set var="total" value="${allTotal}" />							
											<fmt:formatNumber value="${allTotal}" pattern="#,###원"/>
										</td>
										<td align="center"><span class="yoy"></span></td>
										</tr>
										<c:set var="allTotal" value="0" />
									</c:if>
								</c:if>
							</c:if>
							<c:if test="${yts.testCode == 'D'}">
								<c:if test="${basic == 0}">
									<c:set var="basic" value="1" />
									<td align="center">	
										<input type="hidden" name="basicTotal" value="0">
										<fmt:formatNumber value="0" pattern="#,###원"/>
									</td>
								</c:if>
								<c:if test="${physical == 0}">
									<c:set var="physical" value="1" />
									<td align="center">	
										<input type="hidden" name="physicalTotal" value="0">
										<fmt:formatNumber value="0" pattern="#,###원"/>
									</td>
								</c:if>
								<c:if test="${mental == 0}">
									<c:set var="mental" value="1" />
									<td align="center">
										<input type="hidden" name="mentalTotal" value="0">
										<fmt:formatNumber value="0" pattern="#,###원"/>									
									</td>
								</c:if>
								<c:if test="${basic == 1 and physical == 1 and mental == 1}">
									<c:set var="basic" value="0" />
									<c:set var="physical" value="0" />
									<c:set var="mental" value="0" />
									<td align="center">
										<input type="hidden" name="allTotal" value="${allTotal}">		
										<c:set var="total" value="${allTotal}" />							
										<fmt:formatNumber value="${allTotal}" pattern="#,###원"/>
									</td>
									<td align="center"><span class="yoy"></span></td>
									</tr>
									<c:set var="allTotal" value="0" />
								</c:if>
							</c:if>
							<c:if test="${status.last}">
								<tr>
								<td align="center" colspan="6">
									총 매출 : <fmt:formatNumber value="${total}" pattern="#,###원"/>
								</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
				<!-- 테이블 내용 끝 -->
	        </div>	
	<!-- 테이블 내용 끝 -->
     </div>
   <hr>
   <%@include file = "/WEB-INF/views/common/footer.jsp" %>
   </main>
  <!-- page-content" -->
</div>
</body>
</html>