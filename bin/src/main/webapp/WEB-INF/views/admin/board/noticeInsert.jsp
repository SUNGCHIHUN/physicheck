<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지</title>

<!-- css -->
<link rel = "stylesheet" href = "${path}/resources/css/adminCSS/admin.css">
</head>
<body>
<header class="header">
	<%@include file = "/WEB-INF/views/admin/common/header.jsp" %>
</header>
<div class="page-wrapper chiller-theme toggled">
  <a id="show-sidebar" class="btn btn-sm" href="#" style="background:#606ea8;">
    <i class="fas fa-bars"></i>
  </a>
  <%@include file = "/WEB-INF/views/admin/common/leftbar.jsp" %>
  <!-- page-content -->
  <main class="page-content">
    <div class="container-fluid">
      <h2>공지사항 등록</h2>
      <hr>
      <form name="test"></form>
	      <!-- 테이블 내용 시작 -->
	      <div class="container">
            <div style="padding-top: 50px">
           		<form name="noticeInsert" action="/admin/noticeInsertAction" method="post">
            		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            	
					<table class="table table-hover">
						<tr class="info">
		                 <th>작성자</th>
		                 <td><input type="text" class="input" name="writer" id="writer" size="97" placeholder="작성자 입력" required autofocus /></td>
		              </tr>
		              <tr>
		                 <th>글 제목</th>
		                 <td><input type="text" class="input" name="title" id="title" size="97"  placeholder="글 제목 입력" required /></td>
		              </tr>
		              
		              <tr>
		                 <th>글 내용</th>
		                 <td><textarea rows="10" cols="100" name="content" id="content"></textarea></td>
		              </tr>
		          	</table>
		          	<div align="center">
			          <hr class="my-4">
			          <input type="submit" class="w-100 btn btn-primary btn-lg" value="등록" id="insert1" style="width:100px !important" />
			          <!-- <button class="w-100 btn btn-primary btn-lg" type="submit" style ="width:100px !important">등록</button> -->
					</div>
	          	</form>
			</div>
	    </div> <!-- ./container -->
	    </div>
		<!-- 테이블 내용 끝 -->
   		<hr class="featurette-divider">
    		
 		<!-- footer start -->	
      	<%@include file = "/WEB-INF/views/common/footer.jsp" %>
		<!-- footer end -->	
     </main>
  </div>
  <!-- page-content -->
</body>
</html>