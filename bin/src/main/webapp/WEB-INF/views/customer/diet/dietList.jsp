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
	        	<!-- 테이블 데이터 내용 시작 -->
	        	<div class="row row-cols-1 row-cols-md-3">
					<c:forEach var="diet" items="${dlist}">
						<c:if test="${dlist.isEmpty()}">
							<h2>항목이 존재하지 않습니다.</h2>
						</c:if>
						<c:if test="${!dlist.isEmpty()}">
						<div class="col mb-4">
						  <div class="card">
						    <a href="dietDetail?dietNo=${diet.dietNo}"><img src="${diet.image}" class="card-img-top" alt="${diet.image}" width="400" height="400"></a>
						    <div class="card-body">
						      <h5 class="card-title">${diet.title}</h5>
						    </div>
						    <div class="card-footer">
						      <small class="text-muted">조회수: ${diet.count}</small>
						    </div>
						  </div>
						 </div>
						</c:if>
					</c:forEach>
				</div>
				
				<div align="center">
					<table>
						<tr>
							<td colspan=6 align="center">
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
			</div>
			
			<!-- container 끝 -->
			
			  <!-- footer start -->	
		      <%@include file = "/WEB-INF/views/common/footer.jsp" %>
			  <!-- footer end -->	
     
        </div>
    </div>
</body>
</html>