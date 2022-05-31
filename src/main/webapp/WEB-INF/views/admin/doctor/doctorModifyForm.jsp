<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의료진 수정</title>
<!-- css -->
<link rel = "stylesheet" href = "${path}/resources/css/adminCSS/admin.css">
<link rel = "stylesheet" href = "${path}/resources/css/bootstrap.min.css">

<!-- js -->
<script src="${path}/resources/js/customerJS/join.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path}/resources/js/bootstrap.min.js"></script>
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

	const autoHyphen = (target) => {
     	 target.value = target.value
     	  	.replace(/[^0-9]/g, '')
     	  	.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
 	};
 	
</script>
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
      <h2>의료진 수정</h2>
      <hr>
      
      <form name="test"></form>
	<!-- 여기부터 내용 넣으면 됩니다! -->
        <div class="container">
			 <form action="doctorModifyAction" method="post">
			 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			 <input type="hidden" name="doctorNo" value="${doctor.memberNo}">
			 <input type="hidden" name="pageNum" value="${pageNum}">
         <div class="row g-3">
           <div class="col-12">
             <label for="id" class="form-label">* 의료진명</label>
             <input type="text" name="name" id="name" size="15" value="${doctor.name}" placeholder="공백없이 20자 이내로 작성" class="form-control" autofocus readonly>
          	  <br>
          </div>
            
          <div class="col-sm-5">
            <label for="No" class="form-label">* 검진과목</label>
            <select id="examination" name="examination" class="form-control">
				<option value="기초검사" <c:if test="${doctor.examination eq '기초검사'}">selected</c:if>>기초검사</option>
				<option value="운동검사" <c:if test="${doctor.examination eq '운동검사'}">selected</c:if>>운동검사</option>
				<option value="심리검사" <c:if test="${doctor.examination eq '심리검사'}">selected</c:if>>심리검사</option>
	         </select>
	         <br>
          </div>
          
          <div class="col-12">
            <label for="name" class="form-label">* 성별</label>
             <div class="form-check">
             <input id="man" name="gender" value="남성" type="radio" class="form-check-input" required <c:if test="${doctor.gender eq '남성'}">checked</c:if> disabled>
             <label class="form-check-label" for="man">남성</label>
           </div>
           <div class="form-check">
             <input id="woman" name="gender" value="여성" type="radio" class="form-check-input" required <c:if test="${doctor.gender eq '여성'}">checked</c:if> disabled>
             <label class="form-check-label" for="woman">여성</label>
           </div>
          	 <br>
          </div>
          
          <div class="col-sm-5">
             <label for="No" class="form-label">* 주민번호</label>
             <input id="firstNo" class="form-control" type="text" name="jumin1" placeholder="" value="${doctor.jumin1}" maxlength="6" required readonly>
           </div>
           <div class="col-sm-1" >
           	<label><br></label>
           	<h4>-</h4>
           </div>
           <div class="col-sm-6">
             <label><br></label>
             <input class="form-control" type="password" name="jumin2" id="lastNo" placeholder="" value="${doctor.jumin2}" maxlength="7" required readonly>
             <br>
           </div>
          
           <div class="col-12">
             <label for="hp" class="form-label">* 연락처</label>
             <input type="text" id="tel" name="tel" oninput="javascript:autoHyphen(this)" maxlength="13" value="${doctor.tel}" class="form-control" readonly>
             <br/>
           </div>
          
            <c:set var="email" value="${fn:split(doctor.email,'@')}" />
            <c:forEach var="e" items="${email}" varStatus="status">
            	<c:if test="${status.count == 1}">
		            <div class="col-sm-4">
		          	   <label><br></label>
            			<label for="email" class="form-label">* 이메일</label>
 				        <input type="text" id="email1" name="email1" maxlength="20" value="${e}" class="form-control" readonly>
        			</div>
            		<div class="col-sm-1">
		          	   <label><br></label>
		            	<h4>@</h4>
		         	</div>
            	</c:if>
            	<c:if test="${status.count == 2}">
		            <div class="col-sm-4">
			            <label><br></label>
	 			        <input type="text" id="email2" name="email2" maxlength="20" value="${e}" class="form-control" readonly>
            		</div>
            	</c:if>
            </c:forEach>
          <div class="col-sm-3">
            <label for="lastNo" class="form-label"><br></label>
            <select id="email3" name="email3" onchange="selectEmailChk();" class="form-control" disabled>
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
           <input type="text" id="address" name="address" size="60" value="${doctor.address}" placeholder="주소를 입력하세요." class="form-control" readonly>
          	<br>
         </div>
	</div>
         <hr class="my-4">
          <input type="submit" value="수정" class="w-100 btn btn-primary btn-lg">
       </form>
	</div> <!-- ./container -->
   <!-- 여기부터 내용 넣으면 됩니다! 끗! -->
   </div>
   <hr>
   <%@include file = "/WEB-INF/views/common/footer.jsp" %>
   </main>
  <!-- page-content -->
</div>
</body>
</html>