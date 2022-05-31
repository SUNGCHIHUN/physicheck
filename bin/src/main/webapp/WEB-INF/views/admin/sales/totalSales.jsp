<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>총 결산</title>
<!-- css -->
<link rel = "stylesheet" href = "${path}/resources/css/adminCSS/admin.css">
<link rel = "stylesheet" href = "${path}/resources/css/bootstrap.min.css">

<!-- script -->
<script src="${path}/resources/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/63d3d77b59.js" crossorigin="anonymous"></script>
<!-- 구글차트 라이브러리 이용 -->
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
});

	var chartData = new Array(); // 차트 데이터
	
	// 기본 날짜 설정
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth();
	
	var date = new Array(); // 연도
	var cashTotal = new Array(); // 현금 합계
	var cardTotal = new Array(); // 카드 합계
	var kakaoTotal = new Array(); // 카카오페이 합계
	var allTotal = new Array(); // 3가지 합계
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
		
		chartData[0] = ['일', '카드', '캐쉬', '카카오페이', '총 매출']; // 차트 타이틀
		
		// 데이터 값들을 각 변수에 저장
		$("input[name=date]").each(function(i, e) {
			date[i] = $(e).val();
		});
		
		$("input[name=cardTotal]").each(function(i, e) {
			cardTotal[i] = parseInt($(e).val());
		});

		$("input[name=cashTotal]").each(function(i, e) {
			cashTotal[i] = parseInt($(e).val());
		});
		
		$("input[name=kakaoTotal]").each(function(i, e) {
			kakaoTotal[i] = parseInt($(e).val());
		});
		
		$("input[name=allTotal]").each(function(i, e) {
			allTotal[i] = parseInt($(e).val());
		});
		
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
			var data = [date[i], cardTotal[i], cashTotal[i], kakaoTotal[i], allTotal[i]];
			chartData[i+1] = data;
		}
		
		console.log('chartData : ', chartData);
			
		// 차트 데이터
		var data = google.visualization.arrayToDataTable(chartData);
		
		// 차트 꾸미기
		var options = {
			title : '연도별 매출', // 차트 타이틀명
			curveType: 'function',
			legend: { position: 'bottom'},
			width: '100%',
			height: 400
		};
		
		// 차트 객체 생성(뿌려질 위치의 div id를 받는다.)
		var chart = new google.visualization.LineChart(document.getElementById('curve-chart'));

		// 설정된 정보들을 이용하여 차트를 화면에 출력
		chart.draw(data, options);
	}
	
	// 연도별 총 결산
	function getYearTotal() {
		window.location='/admin/totalSales';
	}
		
	// 월별 총 결산
	function getMonthTotal() {
		window.location='/admin/totalSalesMonth?year=' + year;
	}
	
	// 일별 총 결산
	function getDayTotal() {
		window.location='/admin/totalSalesDay?year=' + year + '&month=' + month;
	}
	
	// 검사항목별 결산
	function getTestSales() {
		window.location='/admin/testSales';
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
      <h2>총 결산</h2>
      <hr>
      <div class="row">
	</div>
	
	<!-- 테이블 내용 시작 -->					
	<div class="container">
	        	<div class="row">
	        		<table width="100%">
						<tr>
							<td align="center">
				        		<input type="button" value="연도별" class="btn btn-secondary" onclick='getYearTotal()'>
				        		<input type="button" value="월별" class="btn btn-secondary" onclick='getMonthTotal()'>
				        		<input type="button" value="일별" class="btn btn-secondary" onclick='getDayTotal()'>
				        		<input type="button" value="검사항목별" class="btn btn-primary" onclick='getTestSales()'>
							</td>
						</tr>
					</table>
	        	</div>
	        	<!-- 테이블 내용 시작 -->					
				<div style="padding-top: 50px; text-align: center">
					<div id="curve-chart"></div>
					<table class="table table-hover">
							<tr class="info">
								<th class="text-center">날짜</th>
								<th class="text-center">카드</th>
								<th class="text-center">현금</th>
								<th class="text-center">카카오페이</th>
								<th class="text-center">총 매출(카드 + 현금 + 카카오페이)</th>
								<th class="text-center">전년 대비</th>
							</tr>
							<tr>
								<c:forEach var="yts" items="${ytslist}" varStatus="status">
									<c:if test="${!status.last}">
										<c:if test="${status.count % 4 == 1}">
										<tr>
											<td align="center">
												<input type="hidden" name="date" value="${yts.paymentYear}">
												${yts.paymentYear}년
											</td>
											<td align="center">
												<input type="hidden" name="cardTotal" value="${yts.total}">
												<fmt:formatNumber value="${yts.total}" pattern="#,###원"/>
											</td>
										</c:if>
										<c:if test="${status.count % 4 == 2}">
											<td align="center">
												<input type="hidden" name="cashTotal" value="${yts.total}">
												<fmt:formatNumber value="${yts.total}" pattern="#,###원"/>
											</td>
										</c:if>
										<c:if test="${status.count % 4 == 3}">
											<td align="center">
												<input type="hidden" name="kakaoTotal" value="${yts.total}">
												<fmt:formatNumber value="${yts.total}" pattern="#,###원"/>
											</td>
										</c:if>
										<c:if test="${status.count % 4 == 0}">
											<td align="center">
												<input type="hidden" name="allTotal" value="${yts.total}">
												<fmt:formatNumber value="${yts.total}" pattern="#,###원"/>
											</td>
											<td align="center">
												<span class="yoy"> %</span>
											</td>
										</tr>
										</c:if>
									</c:if>
									
									<c:if test="${status.last}">
										<tr>
											<td align="center" colspan="6">
												총 매출 : <fmt:formatNumber value="${yts.total}" pattern="#,###원"/>
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</tr>
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