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
		      <div class="col-md-7">
		        <h1 class="featurette-heading"><span class="text-muted">Basic Checkup</span></h1>
		        <p class="lead">
		        
	<pre>
			
								
	<h3><혈액 검사></h3>
	 
	 	
	■ 혈액 검사의 목적
	
	 
	혈액을 구성하는 각종 혈구의 수 및 특성을 평가하는 검사로 전반적인 건강 상태를 나타내며, 
	
	질병의 진단이나 경과를 추적하는데 기본 자료를 제공하는
	 
	선별검사로서 백혈구, 적혈구, 혈소판, 간기능(지방간수치), 혈당 등을 포함합니다.
	 
	
	■ 참고치
	
	 
	- 백혈구 : 4.000 - 10,000/㎣
	 
	 
	- 적혈구수 : 남자 420만 - 630만 /㎣, 여자 400만 - 540만 /㎣				 
	 
	
	- 혈소판 수 : 150만 - 350만 /㎣
	 
	 
	- 간기능(지방간수치) : 0~40IU/L
	
	
	- 혈당(8시간공복후) : 70~100 mg/dL		 
	 
	 
	■ 관련질환
	 
	 
	- 백혈구 수
	 
	
	증가 : 백혈병, 골수 증식성 질환, 감염증, 악성 종양의 전이, 감염증, 자가면역성 질환, 골수 증식성 질환, 
	
	약물 사용(특히 corticosteroids), 용혈성 빈혈, 수혈 직후, 알러지
	 
	감소 : 재생불량성 빈혈, 방사선 조사, 비장의 기능 항진 등 
	 
	 
	- 적혈구 수  : 감소할 때는 빈혈을, 증가할 때는 적혈구 증가증을 의심할 수 있습니다.

	 
	- 혈소판 수
	 
	증가 : 골수 증식성 질환, 원발성 혈소판 증가증, 진성 다혈증, 만성 과립구성 백혈병
	 
	감소 : 재생불량성 빈혈, 방사성 노출 후, 백혈병, 암의 전이, 골수 섬유증, 다발성 골수종, 거대 적아구성 빈혈, 
	
	특발성 혈소판 감소성 자반증(ITP), 전신성 홍반성 낭창(SLE), 악성 림프종, 만성 림프구성 백혈병, 
	
	미만성 혈관내 응고(DIC), 패혈증 등
	 
	 
	- 간기능(지방간수치) : 지방간 수치가 정상수치보다 2 ~ 3배 이상이면 지방간을 의심할수 있습니다.
	
	
	- 혈당(8시간공복후) : 8시간 이상 공복 후 측정한 혈당이 126 mg/dL 이상인 경우 당뇨병으로 의심할수 있습니다.
	
	
	
	<hr>
	
	
	
	<h3><소변 검사></h3>


	■ 소변 검사의 목적
	
	 
	소변으로 요산, 요단백, 요당을 검사합니다. 
	
	 	
	■ 참고치
	
	 
	- 요산  :  남성은 혈중 요산 치가 7mg/dl, 여성은 6mg/dl이하 정상
	 
	 
	- 요단백 : Negative(음성)
	 
	 
	- 요당  : 180mg/dL 이하
	 
	 
	■ 관련질환
	 
	
	- 요비중 : 통풍, 통풍성 관절염
	
		 
	- 요단백 : 요로 감염증, 방광염, 신장염, 신증후군, 신장 경화증
	 
	 
	- 요당  : 당뇨병
	
	
	
	<hr>
	
	
	
	<h3><혈압검사></h3>


	■ 혈압 검사의 목적
	
	 
	
	혈압 측정은 혈압이 높아서 혈관에 부담이 가서 생기는 심근경색이나 뇌졸중, 신장병 등을 예방하기 위해 필수적인 검사입니다.
	 
	혈압이란 혈관에 피가 흐르면서 발생하는 압력을 말하며, 심장이 혈액을 내보낼 때의 압력을 최고혈압(수축기 혈압),
	 
	심장이 확장되어 혈액이 심장으로 돌아왔을 때의 압력을 최저혈압(확장기 혈압)이라고 합니다.
	 
	병원에서 혈압을 재면 평소보다는 5-10mmHg 높게 나오는 경우가 많은데, 혈압을 정확하게 알려면 
	
	하루 중 같은 시간에 재어 비교하는 것이 좋습니다.
	 
	
	
	■ 방법
	
	 
	 
	편안한 안정상태에서 상완에 혈압 커프를 감고 측정합니다.
	 
	
	
	■ 참고치
	
	 
	
	WHO(세계보건기구)의 기준에 따르면, 정상치는 최고혈압 139mmHg이하, 최저혈압 89mmHg이하로 규정되어 있습니다.
	 
	고혈압은 최고혈압 160mmHg이상, 최저혈압 95mmHg 이상으로 되어 있으나, 혈압은 여러 요인에 영향을 받아 
	
	수시로 변하기 때문에, 한번 측정한 혈압 수치를 근거로 고혈압으로 진단하지는 않고, 
	
	안정된 상태에서 일정한 간격을 두고 여러 차례 측정한 혈압 결과를 가지고 신중히 판단하여 진단합니다.
	 
	
	 
	■ 관련질환
	 
	
	고혈압의 대부분은 '본태성 고혈압'이라고 불리는 유전적인 것이며, 일부 신장병이나 내분비 이상 등이
	 
	
	원인인 '2차성 고혈압'도 있습니다.
	 
	
	혈압이 높으면 동맥경화나 협심증, 심근경색, 뇌졸중 등의 원인이 됩니다.
	
	
	
	<hr>
	
	
	
	<h3><체질량 검사></h3>
	 
	 
	
	■ 체질량 검사의 목적
	
	
	
	신체 이상징후 등 몸의 균형적인 상태를 진단합니다.
	
	
	
	■ 방법
	
	
	
	신장, 체중, BMI, 체지방, 근량, 체수분량을 측정합니다.				
			
			
	
	■ 참고치		
	
	
	
	- BMI : 정상체중(BMI 18.5~24.9) , 과체중(BMI 25~29.9) , 비만자(BMI 30~34.9)
	
	
	- 체지방 : 정상 체지방률은 성인 남성의 경우 15~20%, 여자의 경우엔 20~25%
	
	
	- 근량 : 18세 이상 기준으로 여자 근육량 평균은 34%, 남자 근육량 평균은 43%
	
	
	- 체수분량 : 정상 체수분량은 남성은 55~65%, 여성은 45~60%
	
	
	
	</pre>		        
		        
	        
		      </div>
		      <div class="col-md-5">
				<img src="${path}/resources/images/guide/basic_test4.jpg" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" style="width:700px; height:500px;">
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