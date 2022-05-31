<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약내역 상세</title>

<!-- css -->
<style>
td:hover {
  background-color: gold;
  cursor:pointer;
}
td{
	font-size:45px;
}
</style>
<link rel = "stylesheet" href = "${path}/resources/css/bootstrap.min.css">

<link rel = "stylesheet" href = "${path}/resources/css/style4.css">
<link rel = "stylesheet" href = "${path}/resources/css/jquery.mCustomScrollbar.min.css">

<!-- js -->
<script src="${path}/resources/js/customerJS/join.js"></script>
<script src="https://kit.fontawesome.com/63d3d77b59.js" crossorigin="anonymous"></script>
<link rel = "stylesheet" href = "${path}/resources/js/bootstrap.min.js">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<script type="text/javascript">
        $(document).ready(function () {
        	
        	var totalCost = $('#totalCost').val();
        	
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
            
            // 목록 돌아가기
            $('#reserveListBtn').on('click', function () {
                location.href="/customer/reserveList";
            });
            
            // 예약취소 버튼
            $('#reserveCancelBtn').on('click', function () {
                location.href="/customer/reserveCancelBtn?reserveNo=${dto.reserveNo}";
                alert("예약이 취소되었습니다.");
            });
            
            // 카카오페이 결제 버튼
            $('#PayBtn').on('click', function () {
            	location.href="/customer/reserveKakaopay?totalCost="+totalCost+"&reserveNo=${dto.reserveNo}&${_csrf.parameterName}=${_csrf.token}";
				
            });
            
            // 카드 결제 버튼
            $('#cardPayBtn').on('click', function () {
            	location.href="/customer/reserveCard?totalCost="+totalCost+"&reserveNo=${dto.reserveNo}&${_csrf.parameterName}=${_csrf.token}";
				
            });
            
            // 직접결제 버튼  
            $('#directPayBtn').on('click', function () {
            	if(confirm("현금으로 결제하시겠습니까?") == true){
            	location.href="/customer/directPay?totalCost="+totalCost+"&reserveNo=${dto.reserveNo}&${_csrf.parameterName}=${_csrf.token}";
            	
            	} else{
             	   return;
                }
            });
             
            
            // 환불결제 버튼  
            $('#paidReturnBtn').on('click', function () {
            	if(confirm("환불 하시겠습니까?") == true){
            	location.href="/customer/paidReturn?totalCost="+totalCost+"&reserveNo=${dto.reserveNo}&${_csrf.parameterName}=${_csrf.token}";
            	alert("환불이 완료되었습니다.");
            	} else{
             	   return;
                }
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
			
			<!-- 예약하기 시작 -->
	        <div class="jumbotron">
				<div class="container">
					<h3 class="display-4">예약내역 상세</h3>
				</div>
			</div>
			
			<div class="container" >
			<form class="needs-validation" name="joinform"novalidate>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="card border-primary mb-3" style="max-width: 20rem; margin-left:37%">
			  <div class="card-header">회원번호</div>
			  <div class="card-body">
			    <h4 class="card-title">${MemberNo}</h4>
			    <p class="card-text"></p>
			  </div>
			</div>
			
			<div class="card border-primary mb-3" style="max-width: 20rem; margin-left:37%">
			  <div class="card-header">예약번호</div>
			  <div class="card-body">
			    <h4 class="card-title">${dto.reserveNo}</h4>
			    <p class="card-text"></p>
			  </div>
			</div>
			
			<div class="card border-primary mb-3" style="max-width: 20rem; margin-left:37%">
			  <div class="card-header">예약날짜</div>
			  <div class="card-body">
			    <h4 class="card-title">${dto.reserveDate}</h4>
			    <p class="card-text"></p>
			  </div>
			</div>
			
			<!-- 카카오 페이로 넘길 결제 금액 -->
			<c:choose>
				<c:when test="${dto.getPhysicalNo() == 0 && dto.getMentalNo() == 0}">
			        <input type="hidden" name="totalCost" id="totalCost" value="80">
			    </c:when>	
			
				<c:when test="${dto.getPhysicalNo() != 0 && dto.getMentalNo() == 0}">
					<input type="hidden" name="totalCost" id="totalCost" value="280">
			    </c:when>
			    
			    <c:when test="${dto.getPhysicalNo() == 0 && dto.getMentalNo() != 0}">
					<input type="hidden" name="totalCost" id="totalCost" value="330">
			    </c:when>
			    
			    <c:when test="${dto.getPhysicalNo() != 0 && dto.getMentalNo() != 0}">
			    	<input type="hidden" name="totalCost" id="totalCost" value="530">
			    </c:when>
	        </c:choose>
	        
			<div class="card border-primary mb-3" style="max-width: 20rem; margin-left:37%">
			  <div class="card-header">결제금액</div>
			  	<div class="card-body">
				    <h4 class="card-title">
					    <c:choose>
							<c:when test="${dto.getPhysicalNo() == 0 && dto.getMentalNo() == 0}">
						        80원
						    </c:when>			
						    <c:when test="${dto.getPhysicalNo() != 0 && dto.getMentalNo() == 0}">
						        280원
						    </c:when>	
							<c:when test="${dto.getPhysicalNo() == 0 && dto.getMentalNo() != 0}">
								330원
						    </c:when>    
						    <c:when test="${dto.getPhysicalNo() != 0 && dto.getMentalNo() != 0}">
						    	530원
						    </c:when>
			        	</c:choose>
				    </h4>
			    <p class="card-text"></p>
			  </div>
			</div>
			
			<div class="card border-primary mb-3" style="max-width: 20rem; margin-left:37%">
			  <div class="card-header">검사 항목 (검사 번호)</div>
			  <div class="card-body">
				  * 기초검사 : ${dto.basicNo}
				  <br><br>
				  * 체력검사 : 
				  <c:choose>
			   		<c:when test="${dto.getPhysicalNo() == 0 or dto.getPhysicalNo() == null}">
				        <td align="center">X</td>
				    </c:when>																															
				    <c:otherwise>
				       	<td align="center">${dto.getPhysicalNo()}</td>
				    </c:otherwise>
				 </c:choose>
				  <br><br>
				  * 심리검사 : 
				  <c:choose>
			   		<c:when test="${dto.getMentalNo() == 0 or dto.getMentalNo() == null}">
				        <td align="center">X</td>
				    </c:when>																															
				    <c:otherwise>
				       	<td align="center">${dto.getMentalNo()}</td>
				    </c:otherwise>
				  </c:choose>				
			  </div>
			</div>
			
			<c:set var="payState" value="${dto.getPayState()}"/>
			<c:if test="${payState == 0}" >
				<!-- 결제대기 -->
				<button class="w-100 btn btn-primary btn-lg" type="button" id="PayBtn" style="margin-top:100px;">카카오페이 결제하기</button>
				<button class="w-100 btn btn-primary btn-lg" type="button" id="cardPayBtn" style="margin-top:15px;">카드 결제하기</button>
				<button class="w-100 btn btn-primary btn-lg" type="button" id="directPayBtn" style="margin-top:15px;">현금 결제하기</button>
				<button class="w-100 btn btn-primary btn-lg" type="button" id="reserveCancelBtn" style="background:red; margin-top:25px; border:1px solid red;">예약취소</button>
			</c:if>
			
			<c:if test="${payState == 1}" >
				<!-- 결제완료 -->
				<button class="w-100 btn btn-primary btn-lg" type="button" id="reserveListBtn" style="margin-top:100px;">목록</button>
				<button class="w-100 btn btn-primary btn-lg" type="button" id="paidReturnBtn" style="background:red; margin-top:25px; border:1px solid red;">예약취소 및 환불</button>
			</c:if>
			
			<c:if test="${payState == 2}" >
				<p class="w-100 btn btn-primary btn-lg">* 환불 완료</p>
			</c:if>
			</form>
			
			
	        	
			</div>	<!-- container 끝 -->
			
		    <!-- footer start -->	
		      <%@include file = "/WEB-INF/views/common/footer.jsp" %>
			<!-- footer end -->	
     
        </div>
    </div>
</body>
</html>