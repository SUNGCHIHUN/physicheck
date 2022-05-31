<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의료진 정보수정</title>
<!-- css -->
<link rel = "stylesheet" href = "${path}/resources/css/adminCSS/admin.css">
<link rel = "stylesheet" href = "${path}/resources/css/bootstrap.min.css">

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path}/resources/js/doctorJS/infoUpdate.js"></script>
<!-- js -->
<script src="${path}/resources/js/bootstrap.min.js"></script>
<script src="${path}/resources/js/doctorJS/infoUpdate.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://kit.fontawesome.com/63d3d77b59.js" crossorigin="anonymous"></script>
<script>
jQuery(function ($) {
	    $(".sidebar-dropdown > a").click(function() {
	  $(".sidebar-submenu").slideUp(200);
	  if (
	    $(this)
	      .parent()
	      .hasClass("active")
	  ) {
	    $(".sidebar-dropdown").removeClass("active");
	    $(this)
	      .parent()
	      .removeClass("active");
	  } else {
	    $(".sidebar-dropdown").removeClass("active");
	    $(this)
	      .next(".sidebar-submenu")
	      .slideDown(200);
	    $(this)
	      .parent()
	      .addClass("active");
	  }
	});
	
	$("#close-sidebar").click(function() {
	  $(".page-wrapper").removeClass("toggled");
	});
	$("#show-sidebar").click(function() {
	  $(".page-wrapper").addClass("toggled");
	});
});
</script>
<script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });

        const autoHyphen = (target) => {
       	 target.value = target.value
       	  	.replace(/[^0-9]/g, '')
       	  	.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
   		};
   		
</script>
</head>
<body>
<header class="header">
	<%@include file = "/WEB-INF/views/doctor/common/header.jsp" %>
</header>
<div class="page-wrapper chiller-theme toggled">
  <a id="show-sidebar" class="btn btn-sm" href="#" style="background:#606ea8;">
    <i class="fas fa-bars"></i>
  </a>
  <%@include file = "/WEB-INF/views/doctor/common/leftbar.jsp" %>
  <!-- page-content -->
  <main class="page-content">
    <div class="container-fluid">
      <h2>개인정보수정</h2>
      <hr>
      <div class="row">
	</div>
	
	<!-- 테이블 내용 시작 -->					
	<div class="container">
		<form class="needs-validation" name="updateform" action="infoUpdate?${_csrf.parameterName}=${_csrf.token}" method="post" novalidate>
	        <input type="hidden" id="hiddenId" value="${dto.id}">
	         <input type="hidden" id="memberNo" value="${dto.memberNo}">
	        <div class="row g-3">
	          <div class="col-sm-12">
	            <label for="id" class="form-label">* 아이디</label>
	            <input type="text" name="id" id="id" size="15" value="${dto.id}" class="form-control" readonly><br>
	            <br>
	         </div>
	
	         <div class="col-12">
	           <label for="password" class="form-label">* 비밀번호</label>
	           <input type="password" id="password" name="password" size="15" placeholder="비밀번호 입력" class="form-control" required>
	         	 <br>
	         </div>
	         
	  			<div class="col-12">
	           <label for="name" class="form-label">* 이름</label>
	           <input type="text" id="name" name="name" size="15" value="${dto.name}" class="form-control" required>
	         	 <br>
	         </div>
	         
	         <div class="col-12">
	           <label for="name" class="form-label">* 진료과목</label>
	           <input type="text" id="examination" name="examination" size="15" value="${dto.examination}" class="form-control" readonly>
	         	 <br>
	         </div>
	         
	         <div class="col-sm-5">
	           <label for="No" class="form-label">* 주민번호</label>
	           <input type="text" class="form-control" id="firstNo" value="${dto.jumin1}"  readonly>
	         </div>
	         <div class="col-sm-1" >
	         	<label><br></label>
	         	<h4>-</h4>
	         </div>
	         <div class="col-sm-6">
	           <label><br></label>
	           <input type="password" class="form-control" value="${dto.jumin2}" id="lastNo" readonly>
	           <br>
	         </div>
	         
	         <div class="col-12">
	           <label for="hp" class="form-label">* 연락처</label>
	           <input type="text" id="tel" name="tel" size="11" value="${dto.tel}"  class="form-control" required>
	         	 <br>
	         </div>
	         
	         <c:set var="array2" value="${fn:split(dto.email,'@')}" /> 
	         <div class="col-sm-4">
	           <label for="email" class="form-label">* 이메일</label>
	           <input type="text" id="email1" name="email1" maxlength="20" value="${array2[0]}" class="form-control" required>
	         </div>
	         <div class="col-sm-1">
	         	 <label><br></label>
	           <h4>@</h4>
	         </div>
	         <div class="col-sm-4">
	           <label><br></label>
	           <input type="text" id="email2" name="email2" maxlength="20" value="${array2[1]}" class="form-control">
	         </div>
	         <div class="col-sm-3">
	           <label for="lastNo" class="form-label"><br></label>
	           <select id="email3" name="email3" onchange="selectEmailChk();" class="form-control">
	        	<option value="0">직접입력</option>
			<option value="naver.com">네이버</option>
			<option value="gmail.com">구글</option>
			<option value="daum.net">다음</option>
			<option value="nate.com">네이트</option>
	          </select>
	          <br>
	         </div>
	          
	         <div class="col-12">
	            <label for="name" class="form-label">* 주소</label>
			   	<br>
				   <input type="text" id="postcode" placeholder="우편번호"> 
				   <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
				   <input type="text" id="address" name="address" size="84" placeholder="주소" style="margin-top: 5px" value="${dto.address}"><br>
				   <input type="text" id="detailAddress" name="detailAddress" size="40" placeholder="상세주소" style="margin-top: 5px">
				   <input type="text" id="extraAddress" name="extraAddress" size="40" placeholder="참고항목" style="margin-top: 5px">
	          </div>
			</div>
	        <hr class="my-4">
	        <button class="w-100 btn btn-primary btn-lg" type="submit">수정</button>
	      </form>
	     </div>

	<!-- 테이블 내용 끝 -->
   </div>
   <hr>
   <%@include file = "/WEB-INF/views/common/footer.jsp" %>
   </main>
  <!-- page-content -->
</div>
</body>
</html>