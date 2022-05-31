<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

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
			
			<!-- 오시는길 시작 -->
	        <div class="jumbotron">
				<div class="container">
					<h3 class="display-4">공지사항</h3>
				</div>
			</div>
			
			<div class="container">
				<div class="row">
					<table width="100%">
						<tr>
							<td align="left">
								<div class="input-group sm-3">
								  <input type="text" class="form-control" id="searchContent" placeholder="Search..." style="width:30px;">
								  <div class="input-group-append">
								  	<input type="button" name="button" id="search" class="btn btn-primary" value="검색">
								  </div>
								</div>
							</td>
							<td align="right" style="width:800px;">
							</td>
						</tr>
					</table>
				</div>
				
	        	<!-- 테이블 내용 시작 -->					
				<div style="padding-top: 50px">
					<table class="table table-hover">
							<tr class="info">
								<th class="text-center">번호</th>
								<th class="text-center">제목</th>
								<th class="text-center">작성자</th>
								<th class="text-center">날짜</th>
								<th class="text-center">조회수</th>
							</tr>
							
							<c:forEach var="dto" items="${list}">
								<tr>
									<td align="center">${dto.getNoticeNo()}</td>
									<td align="center"><a href="/boardInfo?num=${dto.getNoticeNo()}">${dto.getTitle()}</a></td>
									<td align="center">${dto.getWriter()}</td>
									<td align="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.getInDate()}"/></td>
									<td align="center">${dto.getReadCnt()}</td>
								</tr>
							</c:forEach>
							<tr>
								<td align="center" colspan="11">
									<c:if test="${paging.startPage > 10}">
								    	<a href="/boardList?pageNum=${paging.prev}">[이전]</a>
									</c:if>
									<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
										<a href= "/boardList?pageNum=${num}">${num}</a>
									</c:forEach>
									<c:if test="${paging.endPage < paging.pageCount}" >
										<a href="/boardList?pageNum=${paging.next}">[다음]</a>
									</c:if>	
								</td>
		    			  </tr>
					</table>
				</div>
			
			</div>	<!-- container 끝 -->
			
		 <!-- footer start -->	
		      <%@include file = "/WEB-INF/views/common/footer.jsp" %>
			<!-- footer end -->	
     
        </div>
    </div>
</body>
</html>