<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검사안내</title>


<!-- css -->
<link rel = "stylesheet" href = "${path}/resources/css/bootstrap.min.css">
<link rel = "stylesheet" href = "${path}/resources/css/style4.css">
<link rel = "stylesheet" href = "${path}/resources/css/jquery.mCustomScrollbar.min.css">
<!-- web-font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300;500&display=swap" rel="stylesheet">
<!-- js -->
<script src="${path}/resources/js/customerJS/join.js"></script>
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
			
	        <!-- 회원가입 시작 -->

		    <div class="row featurette">
		      <div class="col-md-7 order-md-2">
		        <h2 class="featurette-heading"><span class="text-muted">Physical Checkup</span></h2>
		        <p class="lead">
		        
	<pre>
			
								
	<h3><심폐지구력 검사></h3>
	 
	 	
	■ 벤치스텝핑
	
	 
	스텝박스[높이 남:40cm, 여 33cm] 두개를 붙여서 설치 
	
	4스텝 승강운동[속도 : 23회/분, 매트로놈 90bpm 설정]
	 
	5분간 실시 후 의자에 앉아서 맥박 측정
	
	
	
	■ Balke 프로토콜
	
	 
	treadmill 이용 최대하운동부하 검사
	
	초기 경사도 0% [km/h]<3,4mph>
	
	초기 1분 경사도 2% 다음 1%씩 증가
	
	맥박이 180회/분  도달시간
	
	측정시간 기록 후 추정공식 대입 
	 
	최대산소섭취량 추정공식 [단위:L/min]
	남자 : V̇O₂max=3.744x{[체중+5]/[심박수-62]} [체중:kg]
	여자 : V̇O₂max=3.740x{[체중-3]/[심박수-65]} [심박수:bpm]  
			
								
	<h3><유연성 검사></h3> 
	 
	 	
	■ 앉아 윗몸 앞으로 굽히기
	
	
	좌전굴 측정기에 무릎을 펴고 앉아서, 팔을 뻗어 허리를 
	
	서서히 굽힌다. 2초간 그 자세를 유지하며 cm로 기록
	
	
	
	■ 어깨가동성검사
	
	
	먼저 가장 끝 손목 주름에서 가장 긴 손가락 끝까지의 길이를 잰다.(이것의 평가의 기준이 된다.)
	
	양발을 모아 붙이고 양손의 엄지 손가락을 먼저 접어 안으로 들어가게 주먹을 말아 쥔다.
	
	검사를 받는 사람은 동시에 한쪽 주먹은 목 뒤로 다른 한 쪽은 등뒤로 가져간다.
	한쪽 어깨는 최대한 신전되고 내회전하며 내전할 것이고
	한쪽 어깨는 최대한 굴곡되고 외회전하며 외전할여 양 손이 만날 수 있도록 한다.
			
								
	<h3><순발력 검사></h3> 	
	 
	 	
	■ 제자리 멀리뛰기
	
	
	측정단위는 m이다.
	
	측정도구는 제자리 구름판을 이용한다.
	
	발구름판을 넘지 않도록 서서 팔이나 몸, 다리의 반동을 이용하며 뛰며,
	
	발구름선에서 가장 가까운 발뒤꿈치의 착지점까지 거리를 구름선과 직각으로 측정한다.
	 
	 	
	■ 50m 달리기
	
	
	50m를 빠른 속도로 달리는 능력을 측정합니다.
	
	측정할 준비가 되면 깃발이나 신호기를 원모양으로 흔들어 준비가 되었다는 것을 알려준다.
	
	깃발이나 신호기가 땅에서 떨어지는 순간 출발하여 
	
	주자의 몸통이 결승선에 닿을 때까지 시간을 0.01초 단위로 측정하여 기록합니다.
			
								
	<h3><근력 검사></h3> 	
	 
	 	
	■ 완력
	
	
	케이블 머신 앞에서 언더 그립으로 잡는다.
	
	팔꿈치 각도가 90도가 되도록 굴곡시키고 
	
	한 팔은 허리에 손을 댐
	
	3회 실시하여 최대무게[1RM]
	 
	 	
	■ 벤치프레스
	
	
	벤치를 바벨의 중심, 그립은 와이드 그립을 쥐고 측정한다.
	
	최대근력 = 바벨 무게 / 체중	
	 
	 	
	■ 배근력
	

	근력계 위에 양 발 끝을 15cm 간격, 등 각도 30도 굽힌다.
	
	그립을 말아 잡으면 안되고, 2 ~ 3회[사이 휴식 1분]중 최고점을 측정한다.
	 
	 	
	■ 레그프레스(1RM 측정)


	넙다리네갈레근, 협력근[큰볼기근, 뒤넙다리근] 단축성 수축
	
	기구에 등을 대고 앉고 머신 손잡이를 잡음

	근력점수 = 1RM무게 / 체중 * 100
		%1RM = 100 - [Reps x 2.5]
		1RM = 들어 올린 무게 / [%1RM/100]
			
								
	<h3><근지구력 검사></h3> 
	 
	 	
	■ 윗몸일으키기
	
	
	누운 상태에서 무릎 직각 양 손 깍지, 보조자 또는 
	
	기구사용 발목 고정. 어깨 바닥에 완전히 닿고, 1분동안
	
	실시한 횟수
	 
	 	
	■ 팔굽혀펴기(남:베이직, 여: 무릎대고)
	

	양 손을 어깨 넓이, 양 발은 모은 자세에서 머리에서
	
	발끝까지 일직선, 팔을 90도 이상, 가슴이 바닥에 접근
	
	1분동안 횟수를 측정한다.
	 
	 	
	■ 버피테스트
	

	양발을 모으로 차렷 자세, 발의 위치에 테이프를 표시, 
	
	발을 뻗었을 시 발의 위치 테이프로 표시, 
	
	1분 동안 시행 횟수
	 
	 	
	■ 하프 스쿼트 점프 
	
	
	피험자 양 손은 허리에 위치, 양 다리를 굽힌 상태에서
	
	한쪽 발은 앞으로 다른 발은 뒤로 하여 준비 자세,
	
	무릎을 펴면서 위로 점프하고 착지할 때는 양발을 교차,
	
	1분 동안 시행 횟수
			
								
	<h3><민첩성 검사></h3> 	
	 
	 	
	■ 사이드 스텝
	
	
	피검자는 중앙의 선을 밟지 않은 상태에 두발을 딛고 선다.
	
	[시작]하는 신호와 함께 오른발이 오른쪽 선을 넘어 서도록 오른편으로 사이드 스텝을 한다. 
	
	이때 횟수를 1개로 한다.
	
	오른쪽 선을 넘어 섰으면 다시 빠른 동작으로 처음 자세로 돌아온다. 
	
	이때 횟수를 2개로 한다.
	
	돌아온 다음 다시 왼쪽으로 왼발이 넘어서도록 사이드 스텝을 행한다.
	
	이때 횟수를 3개로 한다.
	
	이 동작을 좌우로 교대하여 될수 있는 대로 빠른 동작으로 정해진 시간 안에 실시한다.
	
	2회 실시하여 좋은 기록을 인정한다.
	 
	 	
	■ 부메랑 달리기	
	
		
	출발신호와 함께 출발선 좌측에서 중앙에 있는 깃대를 향해서 뛴다.
	
	중앙에는 깃대를 시계방향으로 돌아 1번 깃발을 향해 달려가 
	
	시계방향으로 돌아서 중앙에 있는 깃발을 향해 달려가 시계방향으로 돌아 2번 깃발로 뛴다.
	
	2번 깃발 또한 시계방향으로 돌아 중앙에 있는 깃발을 다시 시계방향으로 돌아 3번 깃발로 뛴다.
	
	3번 깃발 또한 시계방향으로 돌아 중앙에 있는 깃발을 시계방향으로 돌아 출발선이었었던 지점으로 결승 골인한다.
	
	출발지점에서 결승지점까지의 걸린 시간을 측정한다.
	
	길이는 십자로 교차한 0번 깃발로부터 1번, 2번, 3번, 출발선까지가 각각 5.18m로 정한다	
	 
	 	
	■ 전신반응검사	
	
	
	신호음에 집중합니다.
	
	어깨너비만큼 다리를 벌리고 섭니다.
	
	예고없이 들리는 신호에 반응하여 양발을 동시에 벌립니다. 
	
	3회 실시하여 가장 좋은 결과를 기록합니다.
	
	양발 동시에 벌려야 합니다.
	
	발이 완전히 떨어져야 합니다.
	
	마지막으로 신호를 예측하여 움직이지 않도록 합니다.	
	
		        
	</pre>		        
		           	        
		      </div>
		      <div class="col-md-5 order-md-1">
				<img src="${path}/resources/images/guide/sport_test3.jpg" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" style="width:700px; height:500px;">
		      </div>
		    </div>

		    <!-- 회원가입 끝 -->
		     
     		<hr class="featurette-divider">
     		
     		 <!-- footer start -->	
		      <%@include file = "/WEB-INF/views/common/footer.jsp" %>
			<!-- footer end -->	
     
        </div>
    </div>

</body>
</html>