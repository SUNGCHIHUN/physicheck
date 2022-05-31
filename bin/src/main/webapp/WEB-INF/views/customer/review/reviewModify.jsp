<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰수정 페이지</title>

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
            
            $('#reviewList').on('click', function () {
            	location.href="/customer/reviewList";
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
					<h3 class="display-4">리뷰수정 페이지</h3>
				</div>
			</div>
			
			<div class="container">
				
	        	<!-- 테이블 내용 시작 -->					
				<div style="padding-top: 50px">
					<form class="form-horizontal" action="/customer/reviewModifyAction?reviewNo=${dto.reviewNo}">
					<input type="hidden" name="reviewNo" value="${dto.reviewNo}" />
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					  <fieldset>
					     <div class="col-sm-3">
				             <label for="lastNo" class="form-label"><br>* 별점을 선택하세요<br></label>
				             <select id="starPointSelect" name="starPointSelect" class="form-control">
					         	<option value="1">★</option>
								<option value="2">★★</option>
								<option value="3">★★★</option>
								<option value="4">★★★★</option>
								<option value="5">★★★★★</option>
				            </select>
				            <br>
			           </div>
					    
					    <div class="form-group">
					      <label for="textArea" class="col-lg-2 control-label">* 내용</label>
					    		
					      <div class="col-lg-10">
					        <textarea rows="20" cols="100"  name="content" id="content" placeholder="내용을 입력해 주세요">${dto.content}</textarea>
					      </div>
					    </div>
					    
					  </fieldset>
					<button class="w-100 btn btn-primary btn-lg" type=submit id="reviewModify" style="margin-top:100px;">수정</button>
					<button class="w-100 btn btn-primary btn-lg" type="button" id="reviewList" style="margin-top:25px;">목록</button>
			
					</form>
				</div>
				
				<!-- 테이블 내용 끝 -->
			
				<!-- 결제완료 -->
				
			
			</div>	<!-- container 끝 -->
			
		 <!-- footer start -->	
		      <%@include file = "/WEB-INF/views/common/footer.jsp" %>
			<!-- footer end -->	
     
        </div>
    </div>
</body>
</html>