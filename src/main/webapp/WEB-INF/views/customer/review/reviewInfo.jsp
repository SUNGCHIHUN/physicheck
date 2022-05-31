<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰상세</title>

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
            
            $('#reviewDelete').on('click', function () {
               if(confirm("정말 삭제하시겠습니까?") == true){
            	   location.href="/customer/reviewDelete?reviewNo=${dto.reviewNo}&reserveNo=${dto.reserveNo}";
               } else{
            	   return;
               }
            });
            
            $('#reviewModify').on('click', function () {
                if(confirm("수정 하시겠습니까?") == true){
             	   location.href="/customer/reviewModify?reviewNo=${dto.reviewNo}";
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
			
			<!-- 리뷰상세 시작 -->
	        <div class="jumbotron">
				<div class="container">
					<h3 class="display-4">리뷰상세</h3>
				</div>
			</div>
			
			<div class="container">
				
	        	<!-- 테이블 내용 시작 -->					
				<div style="padding-top: 50px">
					<form class="form-horizontal">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					  <fieldset>
					     <c:choose>
					   		<c:when test="${dto.starPoint == 1}">
						        <legend>* 별점 : ★</legend>
						    </c:when>		
						    <c:when test="${dto.starPoint == 2}">
						        <legend>* 별점 : ★★</legend>
						    </c:when>	
						    <c:when test="${dto.starPoint == 3}">
						        <legend>* 별점 : ★★★</legend>
						    </c:when>	
						    <c:when test="${dto.starPoint == 4}">
						        <legend>* 별점 : ★★★★</legend>
						    </c:when>	
						    <c:when test="${dto.starPoint == 5}">
						        <legend>* 별점 : ★★★★★</legend>
						    </c:when>																														
						    <c:otherwise>
						       	<legend>x</legend>
						    </c:otherwise>
						</c:choose>
					    <div class="form-group">
					      <label for="inputEmail" class="col-lg-2 control-label">* 작성일</label>
					      <div class="col-lg-10">
					      <fmt:formatDate pattern="yyyy-MM-dd" value="${dto.inDate}"/>
					      </div>
					    </div>
					    <div class="form-group">
					      <label for="textArea" class="col-lg-2 control-label">* 내용</label>
					    		
					      <div class="col-lg-10">
					        ${dto.content}
					        
					      </div>
					    </div>
					    
					  </fieldset>
					</form>
				</div>
				
				<!-- 테이블 내용 끝 -->
			<c:if test="${dto.memberNo == MemberNo}" >
				<!-- 결제완료 -->
				<button class="w-100 btn btn-primary btn-lg" type="button" id="reviewModify" style="margin-top:100px;">수정</button>
				<button class="w-100 btn btn-primary btn-lg" type="button" id="reviewDelete" style="background:red; margin-top:25px; border:1px solid red;">삭제</button>
			</c:if>
			
			</div>	<!-- container 끝 -->
			
		 <!-- footer start -->	
		      <%@include file = "/WEB-INF/views/common/footer.jsp" %>
			<!-- footer end -->	
     
        </div>
    </div>
</body>
</html>