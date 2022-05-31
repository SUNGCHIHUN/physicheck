<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의약품정보</title>

<!-- css -->
<link rel = "stylesheet" href = "${path}/resources/css/bootstrap.min.css">
<link rel = "stylesheet" href = "${path}/resources/css/style4.css">
<link rel = "stylesheet" href = "${path}/resources/css/jquery.mCustomScrollbar.min.css">

<!-- js -->
<link rel = "stylesheet" href = "${path}/resources/js/bootstrap.min.js">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#searchResult tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
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
		
		<!-- 의약품정보 시작 -->
		<div class="jumbotron">
			<div class="container">
				<h4 class="display-4">의약품정보</h4>
			</div>
		</div>
	
		<div class="container">	 
			<div class="row">
				<table class="table table-hover">
					<tr>
						<td align="right">
							<div class="input-group sm-3">
								<input type="text" id="myInput" placeholder="Search..." width="200px">
							</div>
						</td>
					</tr>
				</table>
			</div>
			
        
			<!-- 테이블 내용 시작 -->               
	        <div style="padding-top: 50px">
	           <table class="table table-hover">
	                 <tr class="info">
	                    <th class="text-center">번호</th>
	                    <th class="text-center">사진</th>
	                    <th class="text-center">이름</th>
	                    <th class="text-center">설명</th>	                 
	                 </tr>			
				</table>  
				
				<!-- 검색 목록을 출력할 영역 -->
				<div id="searchResult">
					<table border="1">    
						<c:forEach var="medicine" items="${mlist}">
							<c:if test="${mlist.isEmpty()}">
								<h2>항목이 존재하지 않습니다.</h2>
							</c:if>
							
							<c:if test="${!mlist.isEmpty()}">
							<tr>
								<td align="center">${medicine.medicineNo}</td>			
								<td align="center"><img src="${medicine.img}" id="img"></td>					
								<td align="center">${medicine.name}</td>
								<td align="center">${medicine.content1}</td>
							</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>				
				<!-- 테이블 내용 끝 -->				
			</div>		

			<div align="center">
				<table class="paging">
					<tr>
						<td colspan=6 align="center">
							<c:if test="${paging.startPage>10}">
								<a href="medicineList?pageNum=${paging.prev}">[이전]</a>
							</c:if>
	
							<c:forEach var="medicineNo" begin="${paging.startPage}" end="${paging.endPage}">
								<c:if test="${medicineNo == param.pageNum}">
									<span style="font-weight: bold;">${medicineNo}</span>
								</c:if>
								<c:if test="${medicineNo != param.pageNum}">
									<a href="medicineList?pageNum=${medicineNo}">${medicineNo}</a>
								</c:if>
							</c:forEach>
	
							<c:if test="${paging.endPage<paging.pageCount}">
								<a href="medicineList?pageNum=${paging.next}">[다음]</a>
							</c:if>
						</td>
					</tr>
				</table>
			</div>
			<hr class="featurette-divider">				
		</div>
		<!-- footer start -->	
		<%@include file = "/WEB-INF/views/common/footer.jsp" %>
		<!-- footer end -->	
	 </div>
</div>
</body>
</html>