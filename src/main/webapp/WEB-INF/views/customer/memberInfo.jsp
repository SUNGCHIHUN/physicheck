<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보확인</title>

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
	//삭제버튼 클릭
  $(function(){
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.memberDelete.action="memberDelete?${_csrf.parameterName}=${_csrf.token}";
			document.memberDelete.submit();
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
			
	        <!-- 회원정보 확인 시작 -->
	        <div class="jumbotron">
				<div class="container">
					<h3 class="display-4">회원정보확인</h3>
				</div>
			</div>
	
			<div class="container">
	        	<form action="memberDelete" method="post" name="memberDelete">
		  		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				  <div class="row g-3">
				   <div class="col-sm-9">
		              <label for="id" class="form-label">* 아이디</label>
		              <input type="text" name="id" id="id" size="15" class="form-control" value="${dto.id}" readonly>
		           	  <br>
		           </div>
		
				   <div class="col-12">
		             <label for="name" class="form-label">* 이름</label>
		             <input type="text" id="name" name="name" size="15" class="form-control" value="${dto.name}" readonly>
		           	 <br>
		           </div>
		
		           <div class="col-sm-5">
		             <label for="No" class="form-label">* 주민번호</label>
		             <input id="firstNo" class="form-control" type="text" name="jumin1" maxlength="6" value="${dto.jumin1}" readonly>
		           </div>
		           <div class="col-sm-1" >
		           	<label><br></label>
		           	<h4>-</h4>
		           </div>
		           <div class="col-sm-6">
		             <label><br></label>
		             <input class="form-control" type="password" name="jumin2" id="lastNo" value="*******" maxlength="7" readonly>
		             <br>
		           </div>
		
		           <div class="col-12">
		             <label for="name" class="form-label">* 성별</label>
			            <div class="form-check">
			              <input id="man" name="gender" type="radio" class="form-check-input" <c:if test="${dto.gender=='남성'}">checked</c:if>>
			              <label class="form-check-label" for="man">남성</label>
			            </div>
			            <div class="form-check">
			              <input id="woman" name="gender" type="radio" class="form-check-input" <c:if test="${dto.gender=='여성'}">checked</c:if>>
			              <label class="form-check-label" for="woman">여성</label>
			            </div>
		           	 <br>
		           </div>
		
		           <div class="col-12">
		             <label for="hp" class="form-label">* 연락처</label>
		             <input type="text" id="tel" name="tel" maxlength="13" class="form-control" value="${dto.tel}" readonly>
		             <br />
		           </div>
		
		           <c:set var="array2" value="${fn:split(dto.email,'@')}" /> 
		        			   
		           <div class="col-sm-4">
		             <label for="email" class="form-label">* 이메일</label>
		             <input type="text" id="email1" name="email1" maxlength="20" class="form-control" value="${array2[0]}" readonly>
		           </div>
		           <div class="col-sm-1">
		           	 <label><br></label>
		             <h4>@</h4>
		           </div>
		           <div class="col-sm-4">
		             <label><br></label>
		             <input type="text" id="email2" name="email2" maxlength="20" class="form-control" value="${array2[1]}" readonly>
		             <br>
		           </div>
		
		           <div class="col-12">
		            <label for="name" class="form-label">* 주소</label>
		            <input type="text" id="address" name="address" size="60" class="form-control" value="${dto.address}" readonly>
				   	<br>
				   </div>
						
				  </div>
		          	<hr class="my-4">
		          	<input type="hidden" name="num" value="${dto.id}">
		          	<input type="button" value="회원정보 수정" class="w-100 btn btn-primary btn-lg" style="margin-top:100px;" onclick="window.location='/customer/memberUpdate'" />
		            <br>
					<input type="button" id="btnDelete" value="회원 탈퇴" class="w-100 btn btn-primary btn-lg" style="background:red; margin-top:25px; border:1px solid red;" />
				</form>
		    </div> <!-- ./container -->
		    <!-- 회원정보 확인 끝 -->
		     
     		<hr class="featurette-divider">
     		
     		<!-- footer start -->	
		    <%@include file = "/WEB-INF/views/common/footer.jsp" %>
			<!-- footer end -->	
     
        </div>
    </div>

</body>
</body>
</html>