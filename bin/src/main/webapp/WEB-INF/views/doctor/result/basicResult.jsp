<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기초검사등록</title>

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
      <h2>기초검사등록</h2>
      <hr>
	
	<!-- 테이블 내용 시작 -->
	<form action="basicResultInsert?${_csrf.parameterName}=${_csrf.token}&resultNo=${mdto.reserveNo}" method="post" name="basicResultboardInsert">
		<input type="hidden" id="gender" value="${mdto.gender}">
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
						      <td>
						      	${mdto.gender}
						      	<input type="hidden" name="gender" value="${mdto.gender}">
						      </td>
						    </tr>
					 </table>
				</div>
				
				<div style="padding-top: 20px">
					<h5>체질량 검사</h5>
					<table class="table table-bordered">
					    <tr>
					      <th scope="col">신장(cm)</th>
					      <td><input type="text" id="height" name="height" class="form-control" required></td>
					      <th scope="col">체중(kg)</th>
					      <td><input type="text" id="weight" name="weight" class="form-control" required></td>
					      <th scope="col">체수분량(l)</th>
					      <td><input type="text" id="bodyWater" name="bodyWater" class="form-control" required></td>
					    </tr>
					 </table>
				</div>
				
				<div style="padding-top: 20px">
					<h5>혈압검사</h5>
					<table class="table table-bordered">
					    <tr>
					      <!-- 수치 100단위로 입력 -->
					      <th width="20%">최고혈압(mmHg)</th>
					      <td width="30%"><input type="text" id="pressureHigh" name="pressureHigh" class="form-control" required></td>
					      <th width="20%">최저혈압(mmHg)</th>
					      <td width="30%"><input type="text" id="pressureLow" name="pressureLow" class="form-control" required></td>
					    </tr>
					 </table>
				</div>
				
				<div style="padding-top: 20px">
					<h5>소변검사</h5>
					<table class="table table-bordered">
					    <tr>
					      <!-- 10단위 아래로 적어야 음성 뜸 그 이상 적으면 양성 -->
					      <th scope="col">요단백(mg/dL)</th>
					      <td><input type="text" id="urineProtein" name="urineProtein" class="form-control" required></td>
					      <!-- 100단위로 입력 -->
					      <th scope="col">요산(mg/dL)</th>
					      <td><input type="text" id="urineAcid" name="urineAcid" class="form-control" required></td>
					      <!-- 10단위로 입력 30 넘어가면 양성 뜸 -->
					      <th scope="col">요당</th>
					      <td><input type="text" id="urineGlucose" name="urineGlucose" class="form-control" required></td>
					    </tr>
					 </table>
				</div>
				
				<div style="padding-top: 20px">
					<h5>혈액검사</h5>
					<table class="table table-bordered">
					    <tr>
					      <!-- 소수점으로 적거나 한자리수 남자 정상(4.2~6.3), 여자 정상(4.0~5.4) -->
					      <th scope="col">적혈구(/㎣)</th>
					      <td><input type="text" id="redBloodCell" name="redBloodCell" class="form-control" required></td>
					      <!-- 소수점으로 적거나 한자리수 정상(4.0~10.0) -->
					      <th scope="col">백혈구(/㎣)</th>
					      <td><input type="text" id="whiteBloodCell" name="whiteBloodCell" class="form-control" required></td>
					      <!-- 100단위로 입력 130미만 400이상은 부족 또는 과다 뜸 -->
					      <th scope="col">혈소판(/㎣)</th>
					      <td><input type="text" id="bloodPlatelet" name="bloodPlatelet" class="form-control" required></td>
					    </tr>
					    <tr>
					      <!-- 100단위로 적어야됨 정상 126이하 -->
					      <th scope="col">혈색소(/㎣)</th>
					      <td><input type="text" id="liverFunction" name="liverFunction" class="form-control" required></td>
					      <th scope="col">혈당(㎎/ℓ)</th>
					      <td><input type="text" id="bloodGlucose" name="bloodGlucose" class="form-control" required></td>
					      <th scope="col"></th>
					      <td></td>
					    </tr>
					 </table>
				</div>
				
				<!-- <div style="padding-top: 20px">
					<h5>시력검사</h5>
					<table class="table table-bordered">
					    <tr>
					      <th width="20%">왼쪽 시력</th>
					      <td width="30%"><input type="text" id="eyesightLeft" name="eyesightLeft" class="form-control" required></td>
					      <th width="20%">오른쪽 시력</th>
					      <td width="30%"><input type="text" id="eyesightRight" name="eyesightRight" class="form-control" required></td>
					    </tr>
					 </table>
				</div>
				
				<div style="padding-top: 20px">
					<h5>청력검사</h5>
					<table class="table table-bordered">
					    <tr>
					      <th width="20%">왼쪽 청력</th>
					      <td width="30%"><input type="text" id="hearingLeft" name="hearingLeft" class="form-control" required></td>
					      <th width="20%">오른쪽 청력</th>
					      <td width="30%"><input type="text" id="hearingRight" name="hearingRight" class="form-control" required></td>
					    </tr>
					 </table>
				</div> -->
				
				
				<hr>
   				<%@include file = "/WEB-INF/views/common/footer.jsp" %>
			<!-- 테이블 내용 끝 -->
	        <!-- 여기부터 내용 넣으면 됩니다! 끗! -->
	</div>
	<!-- 테이블 내용 끝 -->
	</form>					
   </div>
   </main>
  <!-- page-content -->
</div>
</body>
</html>