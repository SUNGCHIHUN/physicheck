<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오시는 길</title>

<!-- css -->
<link rel = "stylesheet" href = "${path}/resources/css/bootstrap.min.css">
<link rel = "stylesheet" href = "${path}/resources/css/style4.css">
<link rel = "stylesheet" href = "${path}/resources/css/jquery.mCustomScrollbar.min.css">

<!-- js -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://kit.fontawesome.com/63d3d77b59.js" crossorigin="anonymous"></script>
<link rel = "stylesheet" href = "${path}/resources/js/bootstrap.min.js">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
    </script>
    <!-- 카카오 지도  -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f2f953d223c2496fcc35b505a40518b2"></script>

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
					<h3 class="display-4">오시는 길</h3>
				</div>
			</div>
			
			<div class="container">
				<div id="map" style="width:100%;height:500px;"></div>

				   <script>
				       var container = document.getElementById('map'); //지도 표시 div
				       var options = {
				           center: new kakao.maps.LatLng(37.478892, 126.8789202), //지도의 중심좌표
				           level: 3 //지도의 확대 레벨
				       };
				       var map = new kakao.maps.Map(container, options);
				       // 마커가 표시될 위치
				       var markerPosition  = new kakao.maps.LatLng(37.478892, 126.8789202); 
				       // 마커 생성
				       var marker = new kakao.maps.Marker({
				           position: markerPosition
				       });
				       // 마커가 지도 위에 표시되도록 설정
				       marker.setMap(map);
				       // 아래 코드는 지도 위의 마커를 제거하는 코드
				       // marker.setMap(null);  
    				</script>
    				
    			<div style="width:100%;height:500px;">
    				<div class="panel panel-primary">
					  <div class="panel-heading">
					  	<br>
					    <h3 class="panel-title">대중교통 으로 방문하시는 경우</h3>
					  </div>
					  <div class="panel-body">
					    * 지하철<br>
						가산디지털단지역 6번출구 나오셔서 좌측횡단보도 건너 좌측으로 10m 가시면 삼거리가 나옵니다.<br>
						 삼거리에서 우측 방향으로 직진하셔서 사거리 대각선방향에 우리은행 건물 413호입니다.
						<br><br>
						* 버스<br>
						21, 571, 652, 금천 05
						[디지털3단지월드벤쳐센터] 정류장에서 하차<br><br>
						
						* 주소<br>
						서울시 금천구 가산디지털2로 123<br>
						 월드메르디앙2차 4층  413호
					  </div>
					</div>
					<br>
					
					<div class="panel panel-success">
					  <div class="panel-heading">
					    <h3 class="panel-title">자가용으로 방문하시는 경우</h3>
					  </div>
					  <div class="panel-body">
					    * 서부간선도로를 타고 오다가 광명교를 타고 좌회전 후 첫 사거리에서 우회전<br><br>
						* 가리봉5거리에서 철산방향 수출의 다리를 넘어 첫 사거리(한진사거리)에서 우회전<br><br>
						* 남부순환도로 구로IC로 나와 좌회전
					  </div>
					</div>
					
    			</div>	
    			
			</div>
			
	 <!-- footer start -->	
	      <%@include file = "/WEB-INF/views/common/footer.jsp" %>
	<!-- footer end -->	
	
	 </div>	<!-- content 끝 -->
</div>		<!-- wrapper 끝 -->
</body>
</html>