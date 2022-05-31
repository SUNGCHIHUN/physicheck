<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰등록</title>

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
					<h3 class="display-4">리뷰등록</h3>
				</div>
			</div>
	
			<div class="container">
				 <form class="needs-validation" action="/customer/reviewAddBtn" novalidate>
          <div class="row g-3">
            <div class="col-sm-12">
              <label for="id" class="form-label">* 내용</label>
              <textarea rows="20" cols="100"  name="content" id="content" placeholder="내용을 입력해 주세요"></textarea>
           </div>

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
           
           <div class="col-sm-3">
             <label for="lastNo" class="form-label"><br>* 예약번호<br></label>
             <select id="reserveNo" name="reserveNo" class="form-control">
	             <c:forEach var="dto" items="${dto}">
		         	<option value="${dto}">${dto}</option>
				</c:forEach>
            </select>
            <br>
           </div>
            
        
		</div>
          <hr class="my-4">
          <button class="w-100 btn btn-primary btn-lg" type="submit">리뷰등록</button>
        </form>
		    </div> <!-- ./container -->
				<!-- 테이블 내용 끝 -->
			
			
		 <!-- footer start -->	
		      <%@include file = "/WEB-INF/views/common/footer.jsp" %>
			<!-- footer end -->	
     	</div>
        </div>
</body>
</html>