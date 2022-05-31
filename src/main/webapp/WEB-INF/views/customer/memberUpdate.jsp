<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>

<!-- js -->
<script src="${path}/resources/js/customerJS/join.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
    <div class="wrapper">
        <!-- laftbar start -->
			<%@include file = "/WEB-INF/views/common/leftbar.jsp" %>
		<!-- laftbar end -->

        <!-- Page Content  -->
        <div id="content">

        	<!-- header start -->
			<%@include file = "/WEB-INF/views/common/header.jsp" %>
			<!-- header end -->

	        <!-- 회원정보 수정 시작 -->
	        <div class="jumbotron">
				<div class="container">
					<h3 class="display-4">회원정보 수정</h3>
				</div>
			</div>

			<div class="container">
		 		<form class="needs-validation" name="joinform" action="/customer/memberUpdateAction" method="post" novalidate>
		 			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input type="hidden" name="hiddenId" value="0">
					<div class="row g-3">
            			<div class="col-sm-9">
			              <label for="id" class="form-label">아이디</label>
						  <input type="text" id="id" name="id" size="15" class="form-control" readonly value="${dto.getId()}">
						  <br>
			           </div>
			           <div class="col-12">
			             <label for="password" class="form-label">* 비밀번호</label>
			             <input type="password" id="password" name="password" size="15" placeholder="공백없이 20자 이내로 작성" class="form-control">
			           	 <br>
			           </div>

			           <div class="col-12">
			             <label for="re_password" class="form-label">* 비밀번호 확인</label>
			             <input type="password" id="re_password" name="re_password" size="15" placeholder="비밀번호 확인" class="form-control">
			           	 <br>
			           </div>

					   <div class="col-12">
			             <label for="name" class="form-label">* 이름</label>
			             <input type="text" id="name" name="name" size="15" class="form-control" value="${dto.name}">
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
			             <input class="form-control" type="password" name="jumin2" id="lastNo" maxlength="7" value="${dto.jumin2}" readonly>
			             <br>
			           </div>

			           <div class="col-12">
			             <label for="name" class="form-label">* 성별</label>
				            <div class="form-check">
				              <input id="man" name="gender" type="radio" class="form-check-input" value="남성" required <c:if test="${dto.gender=='남성'}">checked</c:if>>
				              <label class="form-check-label" for="man">남성</label>
				            </div>
				            <div class="form-check">
				              <input id="woman" name="gender" type="radio" class="form-check-input" value="여성" required <c:if test="${dto.gender=='여성'}">checked</c:if>>
				              <label class="form-check-label" for="woman">여성</label>
				            </div>
			           	 <br>
			           </div>

			           <div class="col-12">
			             <label for="hp" class="form-label">* 연락처</label>
			             <input type="text" id="tel" name="tel" oninput="javascript:autoHyphen(this)" maxlength="13" class="form-control" value="${dto.tel}">
			             <br />
			           </div>

	        		   <c:set var="array2" value="${fn:split(dto.email,'@')}" /> 

			           <div class="col-sm-4">
			             <label for="email" class="form-label">* 이메일</label>
			             <input type="text" id="email1" name="email1" maxlength="20" class="form-control" value="${array2[0]}">
			           </div>
			           <div class="col-sm-1">
			           	 <label><br></label>
			             <h4>@</h4>
			           </div>
			           <div class="col-sm-4">
			             <label><br></label>
			             <input type="text" id="email2" name="email2" maxlength="20" class="form-control" value="${array2[1]}">
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
						   <input type="text" id="extraAddress" name="extraAddress" size="40" placeholder="비고" style="margin-top: 5px">
			          </div>
					</div>
		          <hr class="my-4">
		          <input type="submit" id="memberUpdate" class="w-100 btn btn-primary btn-lg" value="수정">
		        </form>
		    </div> <!-- ./container -->
		   	<!-- 회원정보 수정 끝 -->

     		<hr class="featurette-divider">

     		 <!-- footer start -->
		      <%@include file = "/WEB-INF/views/common/footer.jsp" %>
			<!-- footer end -->

        </div>
    </div>

</body>
</body>
</html>