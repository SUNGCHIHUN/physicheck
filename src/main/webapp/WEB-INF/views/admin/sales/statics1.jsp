<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성별</title>

<!-- css -->
<link rel = "stylesheet" href = "${path}/resources/css/adminCSS/admin.css">
<link rel = "stylesheet" href = "${path}/resources/css/bootstrap.min.css">


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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      var male = 0;
      var female = 0;

      if(${list.get(0).total != ''})
      	male = parseInt("${list.get(0).total}");
      if(${list.get(1).total != ''})
      	female = parseInt("${list.get(1).total}");
      
      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['성별', '예약수'],
          ['남성',     male],
          ['여성',   female]
        ]);

        var options = {
          title: '성별 누적 예약 수'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
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
	<div class="container">
	  <div class="row">
	    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
	      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
	      	<!-- 각 화면 제목 -->
	        <h1 class="h2"><br>통계</h1>
	        </div>
	        	<!-- 테이블 내용 시작 -->					
				 <div id="piechart" style="padding-left: 140px; width: 900px; height: 500px;"></div>
				<!-- 테이블 내용 끝 -->
	        <!-- </div> -->
	        <!-- 여기부터 내용 넣으면 됩니다! 끗! -->
	        <hr class="featurette-divider">
	        <%@include file = "/WEB-INF/views/common/footer.jsp" %>
	    </main>
	    </div>
	  </div>
</div>
</body>
</html>