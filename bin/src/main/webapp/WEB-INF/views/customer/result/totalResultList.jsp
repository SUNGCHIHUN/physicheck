<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동검사 결과 리스트</title>

<!-- css -->
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
			
			<!-- 오시는길 시작 -->
	        <div class="jumbotron">
				<div class="container">
					<h3 class="display-4">종합검사결과리스트</h3>
				</div>
			</div>
			
			<div class="container">
				
	        	<!-- 테이블 내용 시작 -->					
				<div style="padding-top: 50px">
					<table class="table table-hover">
							<tr class="info">
								<th class="text-center">예약번호</th>
								<th class="text-center">회원번호</th>
								<th class="text-center">예약일</th>
								<th class="text-center">기초검사번호</th>
								<th class="text-center">운동검사번호</th>
								<th class="text-center">심리검사번호</th>
							</tr>
							
							<c:forEach var="dto" items="${list}">
							<tr>
								<td align="center"><a href="/customer/totalResult?reserveNo=${dto.getReserveNo()}&basicNo=${dto.getBasicNo()}&physicalNo=${dto.getPhysicalNo()}&mentalNo=${dto.getMentalNo()}" style="color:red;">${dto.getReserveNo()}</a></td>
								<td align="center">${dto.getMemberNo()}</td>
								<td align="center">${dto.getReserveDate()}</td>
								<td align="center">${dto.getBasicNo()}</td>
								
								<c:choose>
							   		<c:when test="${dto.getPhysicalNo() == 0 or dto.getPhysicalNo() == null}">
								        <td align="center">X</td>
								    </c:when>																															
								    <c:otherwise>
								       	<td align="center">${dto.getPhysicalNo()}</td>
								    </c:otherwise>
								</c:choose>
								
								<c:choose>
							   		<c:when test="${dto.getMentalNo() == 0 or dto.getMentalNo() == null}">
								        <td align="center">X</td>
								    </c:when>																															
								    <c:otherwise>
								       	<td align="center">${dto.getMentalNo()}</td>
								    </c:otherwise>
								</c:choose>		
								
								
							</tr>
							</c:forEach>
							<tr>
								<td align="center" colspan="11">
							    	<c:if test="${paging.startPage > 10}">
										<a href="/customer/totalResultList?pageNum=${paging.prev}">[이전]</a>
									</c:if>
											
									<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
										<a href="/customer/totalResultList?pageNum=${num}">${num}</a>
									</c:forEach>
								
									<c:if test="${paging.endPage < paging.pageCount}" >
										<a href="/customer/totalResultList?pageNum=${paging.next}">[다음]</a>
									</c:if>
								</td>
		    			  </tr>
					</table>
				</div>
				<!-- 테이블 내용 끝 -->
			
			</div>	<!-- container 끝 -->
			
		 <!-- footer start -->	
		      <%@include file = "/WEB-INF/views/common/footer.jsp" %>
			<!-- footer end -->	
     
        </div>
    </div>
</body>
</html>