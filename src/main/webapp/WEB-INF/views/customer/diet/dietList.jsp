<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식사요법</title>

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
        
        $('#search').click(function(){
    		location.href = '/noticeSearch?searchContent='+$('#searchContent').val();
    	});
        
    });
</script>

<style>
.paging a{
	font-size:20px;
	padding:5px;
}
</style>
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
			
			<!-- 식사요법 시작 -->
	        <div class="jumbotron">
				<div class="container">
					<h3 class="display-4">식사요법</h3>
				</div>
			</div>
			
			<div class="container">
			
	        	<!-- 테이블 내용 시작 -->
	        	<div style="padding-top: 50px">
	        		<table class="table table-hover">
	        			<tr class="info">
							<th class="text-center">번호</th>
							<th class="text-center">사진</th>
							<th class="text-center">식사명</th>							
							<th class="text-center">조회수</th>				
						</tr>
													        			
					<c:forEach var="diet" items="${dlist}">
					<tr>
						<c:if test="${dlist.isEmpty()}">
							<h2>항목이 존재하지 않습니다.</h2>
						</c:if>
						
						<c:if test="${!dlist.isEmpty()}">
						    <td align="center">
						      ${diet.dietNo}
						    </td>						
							<td align="center">
						    	<a href="dietDetail?dietNo=${diet.dietNo}"><img src="${diet.image}" width="150"></a>
						    </td>
						    <td>
								<a href="dietDetail?dietNo=${diet.dietNo}">${diet.title}</a>
						    </td>
						    <td align="center">
						      <small class="text-muted">조회수: ${diet.count}</small>
						    </td>
						</c:if>
					</tr>	
					</c:forEach>
					
						<tr>
							<td colspan=6 align="center" class="paging">
								<c:if test="${paging.startPage>10}">
									<a href="dietList?pageNum=${paging.prev}">[이전]</a>
								</c:if>
		
								<c:forEach var="dietNo" begin="${paging.startPage}" end="${paging.endPage}">
									<c:if test="${dietNo == param.pageNum}">
										<span style="font-weight: bold;">${dietNo}</span>
									</c:if>
									<c:if test="${dietNo != param.pageNum}">
										<a href="dietList?pageNum=${dietNo}">${dietNo}</a>
									</c:if>
								</c:forEach>
		
								<c:if test="${paging.endPage<paging.pageCount}">
									<a href="dietList?pageNum=${paging.next}">[다음]</a>
								</c:if>
							</td>
						</tr>
					</table>
				</div>
				<hr class="featurette-divider">				
			</div>
			
			<!-- container 끝 -->
			
			  <!-- footer start -->	
		      <%@include file = "/WEB-INF/views/common/footer.jsp" %>
			  <!-- footer end -->	
     
        </div>
    </div>
</body>
</html>