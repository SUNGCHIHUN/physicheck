<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table</title>
<!-- css -->
<link rel = "stylesheet" href = "${path}/resources/css/bootstrap.min.css">
<link rel = "stylesheet" href = "${path}/resources/css/dashboard.css">
<link rel = "stylesheet" href = "${path}/resources/css/jquery.mCustomScrollbar.min.css">

<!-- js -->
<link rel = "stylesheet" href = "${path}/resources/js/bootstrap.min.js">
</head>
<body>
	<!-- 헤더 시작 -->
	<%@include file = "/WEB-INF/views/admin/common/header.jsp" %>
	<!-- 헤더 끝 -->
	
	<div class="container-fluid">
	  <div class="row">
	   <!-- 레프트바 시작 -->
	   <%@include file = "/WEB-INF/views/admin/common/leftbar.jsp" %>
	   <!-- 레프트바 끝 -->
		
	    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
	      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
	      	<!-- 각 화면 제목 -->
	        <h1 class="h2"><br>여기에 입력해주세요</h1>
	        </div>
	        
	        <!-- 여기부터 내용 넣으면 됩니다! -->
	        <div class="container">
	        	<div class="row">
					<table width="100%">
						<tr>
							<td align="left">
								<div class="input-group sm-3">
								  <input type="text" class="form-control" placeholder="Search..." style="width:30px;">
								  <div class="input-group-append">
								  	<input type="button" name="button" id="search" class="btn btn-primary" value="검색">
								  </div>
								</div>
							</td>
							<td align="right">
								<input type="button" name="button" id="insert" class="btn btn-primary" value="등록">
								<input type="button" name="button" id="delete" class="btn btn-danger" value="삭제">
							</td>
						</tr>
					</table>
				</div>
				
	        	<!-- 테이블 내용 시작 -->					
				<div style="padding-top: 50px">
					<table class="table table-hover">
							<tr class="info">
								<th class="text-center">
									<input type="checkbox" name="basket" id="basket" checked onclick="allCheck();">
								</th>
								<th class="text-center">번호</th>
								<th class="text-center">제목</th>
								<th class="text-center">작성자</th>
								<th class="text-center">날짜</th>
								<th class="text-center">조회수</th>
							</tr>
							
							<tr>
								<td align="center">
									<input type = "checkbox" id="checkbox" name="checkbox" checked>
								</td>
								<td align="center">1</td>
								<td align="center"><a href="#">제목1</a></td>
								<td align="center">작성자1</td>
								<td align="center">2022-04-17</td>
								<td align="center">0</td>
							</tr>
							<tr>
								<td align="center">
									<input type = "checkbox" id="checkbox" name="checkbox" checked>
								</td>
								<td align="center">2</td>
								<td align="center"><a href="#">제목2</a></td>
								<td align="center">작성자2</td>
								<td align="center">2022-04-17</td>
								<td align="center">0</td>
							</tr>
							
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td align="center">
							    <a href="#">[이전]</a>
								
								<a href= "#">number</a>
								
								<a href="#">[다음]</a>
								</td>
								<td></td>
								<td></td>
		    			  </tr>
					</table>
				</div>
				<!-- 테이블 내용 끝 -->
	        </div>
	        <!-- 여기부터 내용 넣으면 됩니다! 끗! -->
	        <hr class="featurette-divider">
	        <%@include file = "/WEB-INF/views/common/footer.jsp" %>
	    </main>
	    </div>
	  </div>
</body>
</html>