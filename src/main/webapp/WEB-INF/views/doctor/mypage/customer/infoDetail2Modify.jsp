<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>담당회원정보상세</title>
<!-- css -->
<link rel = "stylesheet" href = "${path}/resources/css/adminCSS/admin.css">
<link rel = "stylesheet" href = "${path}/resources/css/bootstrap.min.css">

<!-- js -->
<script src="${path}/resources/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/63d3d77b59.js" crossorigin="anonymous"></script>

<!-- chart -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
	
	$("#phsicBtn").click(function() {
		  // var param = getParam("reserveNo");
		 //  window.open("customerDetailPhysical?reserveNo=${param.reserveNo}", '운동검사상세','width=800px,height=900px' );
		 // location.href="doctorCustomerDetail2Modify?reserveNo=${param.reserveNo}"
		});
	
});
</script>
</head>
<body>
<c:set var="reserveNo" value="${param.reserveNo}"/>
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
      <h2>담당회원정보상세</h2>
      <hr>
      <div class="row">
	</div>
	
	        <!-- 여기부터 내용 넣으면 됩니다! -->
	        <div class="container">
	        	<!-- 테이블 내용 시작 -->					
				
				<div class="container-fluid">
			      <h2>운동검사 상세 수정 ${param.reserveNo}</h2>
			      <c:set var="reserveNo2" value="${param.reserveNo}"/>
			      <hr>
	
				<!-- 테이블 내용 시작 -->
				<form action="customerDetailPhysicalModifyAction?${_csrf.parameterName}=${_csrf.token}&reserveNo=${reserveNo2}" method="post" name="basicResultboardInsert">
					<div class="container">
					<div class="row">
								<table width="100%">
									<tr>
										<td align="right">
											<input type="submit" id="update" class="btn btn-primary" value="수정">
										</td>
									</tr>
								</table>
							</div>
				        </div>
				  	
	        <div class="container">
	        	<!-- 테이블 내용 시작 -->					
	        	<!-- 회원정보 -->
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
				<!-- 회원정보 E -->
				<div style="padding-top: 20px">
					<h5>심페지구력</h5>
					<table class="table table-bordered">
					    <tr>
					      <th width="20%">3km 달리기 (분:초)</th>
					      <td width="15%"><input type="text" id="run3km1" name="run3km1" class="form-control"></td> 
					      <td width="15%"><input type="text" id="run3km2" name="run3km2" class="form-control"></td>
					      <th width="20%">Balke 프로토콜 (180회/분)</th>
					      <td width="30%"><input type="text" id="balkeProtocol" name="balkeProtocol" class="form-control"></td>
					    </tr>
					 </table>
				</div>
				
				<div style="padding-top: 20px">
					<h5>유연성</h5>
					<table class="table table-bordered">
					    <tr>
					      <th width="20%">앞으로 굽히기 (cm)</th>
					      <td width="30%"><input type="text" id="forwardBending" name="forwardBending" class="form-control"></td>
					      <th width="20%">브릿지 테스트 (cm)</th>
					      <td width="30%"><input type="text" id="bridge" name="bridge" class="form-control"></td>
					    </tr>
					 </table>
				</div>
				
				<div style="padding-top: 20px">
					<h5>순발력</h5>
					<table class="table table-bordered">
					    <tr>
					      <th width="20%">제자리 멀리 뛰기 (cm)</th>
					      <td width="30%"><input type="text" id="longJump" name="longJump" class="form-control"></td>
					      <th width="20%">50m 달리기 (초)</th>
					      <td width="30%"><input type="text" id="run50" name="run50" class="form-control"></td>
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
					      <th width="20%">체중 (kg)</th>
					      <td width="30%"><input type="text" id="weight1" name="weight1" class="form-control"></td>
					      <th width="20%">무게 (kg)</th>
					      <td width="30%"><input type="text" id="squirt" name="squirt" class="form-control"></td>
					    </tr>
					    <tr>
							<th colspan="4">벤치 프레스</th>
						</tr>
					    <tr>
					      <th width="20%">체중 (kg)</th>
					      <td width="30%"><input type="text" id="weight2" name="weight2" class="form-control"></td>
					      <th width="20%">무게 (kg)</th>
					      <td width="30%"><input type="text" id="benchPress" name="benchPress" class="form-control"></td>
					    </tr>
					 </table>
				</div>
				
				<div style="padding-top: 20px">
					<h5>근지구력</h5>
					<table class="table table-bordered">
					    <tr>
					      <th width="20%">윗몸일으키기 (1분/회)</th>
					      <td width="30%"><input type="text" id="sitUp" name="sitUp" class="form-control"></td>
					      <th width="20%">팔굽혀펴기 (2분/회)</th>
					      <td width="30%"><input type="text" id="pushUp" name="pushUp" class="form-control"></td>
					    </tr>
					 </table>
				</div>
				
				<div style="padding-top: 20px">
					<h5>민첩성</h5>
					<table class="table table-bordered">
					    <tr>
					      <th width="20%">사이드 스텝 (20초/회)</th>
					      <td width="30%"><input type="text" id="sideStep" name="sideStep" class="form-control"></td>
					      <th width="20%">버피 테스트 (30초/회)</th>
					      <td width="30%"><input type="text" id="burpeeTest" name="burpeeTest" class="form-control"></td>
					    </tr>
					 </table>
				</div>
				<hr class="featurette-divider">
		</div>
	<!-- 테이블 내용 끝 -->
	</form>					
   </div>
				
			<%@include file = "/WEB-INF/views/common/footer.jsp" %>
		</div>
   </div>
   </main>
</div>
</body>
</html>