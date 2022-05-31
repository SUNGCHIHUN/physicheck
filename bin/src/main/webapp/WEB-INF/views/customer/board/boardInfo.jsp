<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>

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
			
			<!-- 공지사항 상세 -->
	        <div class="jumbotron">
				<div class="container">
					<h3 class="display-4">공지사항 상세</h3>
				</div>
			</div>
			
			<div class="container">
				
	        	<!-- 테이블 내용 시작 -->					
				<div style="padding-top: 50px">
					<form class="form-horizontal">
					<table class="table table-hover">
						<tr class="info">
	                 		<th style="width:150px">작성일</th>
	                 		<td style="width:150px; text-align:left">
	                    		<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${dto.inDate}" />
	                 		</td>
	                 
	                 		<th style="width:150px">조회수</th>
	                 		<td style="width:150px; text-align:left">${dto.readCnt}</td>
	              		</tr>
	              		<tr>
	                 		<th style="width:150px">작성자</th>
	                 		<td colspan="3" style="width:150px; text-align:left">${dto.writer}</td>
	              		</tr>
	              
		              	<tr>
			                <th>글 제목</th>
			                <td colspan="3" style="text-align:left">${dto.title}</td>
		              	</tr>
	              
		                <tr>
			                <th>글 내용</th>
			                <td  colspan="3" style="text-align:left">${dto.content}</td>
		                </tr>
					</table>
					  <%-- <fieldset>
					    <legend>${dto.title}</legend>	<!-- 글 제목 -->
					    <div class="form-group">
					      <label for="inputEmail" class="col-lg-2 control-label">* 작성일</label>
					      <div class="col-lg-10">
					       	<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${dto.inDate}"/>
					      </div>
					    </div>
					    <div class="form-group">
					      <label for="inputPassword" class="col-lg-2 control-label">* 조회수</label>
					      <div class="col-lg-10">
					        ${dto.readCnt}
					      </div>
					      
					    </div>
					    <div class="form-group">
					      <label for="textArea" class="col-lg-2 control-label">* 내용</label>
					    
					      <div class="col-lg-10">
					        ${dto.content}
					        
					      </div>
					    </div>
					    
					  </fieldset> --%>
					</form>
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