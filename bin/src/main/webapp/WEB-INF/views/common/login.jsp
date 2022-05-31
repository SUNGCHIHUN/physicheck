<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<!-- js -->
<script type="text/javascript">
	$(document).ready(() => {
	    $('#sidebarCollapse').on('click', () => {
	        $('#sidebar').toggleClass('active');
	    });

	    $("#btnJoin").click(function() {
			location.href="/join"
		});
	});
</script>
</head>
<body>
	<%-- 회원가입 성공 여부 --%>
	<c:if test="${result == true}">
		<script>
			alert("회원가입성공~~")
		</script>
	</c:if>
	<c:if test="${result == false}">
		<script>
			alert("회원가입실패!!")
		</script>
	</c:if>

	<%-- 회원수정 성공 여부 --%>
	<c:if test="${update == 1}">
		<script>
			alert("회원수정성공~~")
		</script>
	</c:if>
	<c:if test="${update == 0}">
		<script>
			alert("회원수정실패!!")
		</script>
	</c:if>

	<c:if test="${errorMsg != null}">
		<script>
			alert("${errorMsg}");
		</script>
	</c:if>

    <div class="wrapper">
        <!-- laftbar start -->
			<%@include file = "/WEB-INF/views/common/leftbar.jsp" %>
		<!-- laftbar end -->

        <!-- Page Content  -->
        <div id="content">

            <!-- header start -->
			<%@include file = "/WEB-INF/views/common/header.jsp" %>
			<!-- hader end -->


	        <!-- 로그인 시작 -->
			<div class="container">
				<br><br>
		    	<form class="form-horizontal" role="form" action="/login" method="post" onsubmit="return loginCheck();">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

		    		<div class="form-group">
		    			<div class="center-block" align="center">
		    				<div class="form-group">
							  <img src="${path}/resources/images/logo/logo5.png" class="bd-placeholder-img rounded-circle" style="width:140px; height:140px;">
							   <h1 class="h3 mb-3 font-weight-normal">Login</h1>
							 </div>
							 <div class="form-group">
			                    <div class="col-sm-4">
			                        <input type="text" name="id" id="id" size="15" placeholder="아이디" class="form-control" autofocus>
			                    </div>
			                 </div>
			                 <div class="form-group">
			                    <div class="col-sm-4">
			                        <input type="password" id="password" name="password" size="15" placeholder="비밀번호" class="form-control">
			                    </div>
			                 </div>
			                <div class="form-group">
			                	<input type="submit" class="btn btn-primary" value="로그인">
			                    <input type="button" id="btnJoin" class="btn btn-primary" value="회원가입" >
			                </div>
						</div>
		               </div>
		           </form> <!-- /form -->
		       </div> <!-- ./container -->
		       <br><br><br><br>
		     <!-- 로그인 끝 -->

     		 <hr class="featurette-divider">

      <!-- footer start -->
      <%@include file = "/WEB-INF/views/common/footer.jsp" %>
	  <!-- footer end -->

        </div>
    </div>
</div>

</body>
</body>
</html>