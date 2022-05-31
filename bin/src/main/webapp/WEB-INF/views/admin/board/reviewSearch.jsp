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
<link rel = "stylesheet" href = "${path}/resources/css/bootstrap.min.css">

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
</script>
<script>

	var reviewArr = [];
	var reviewNo = "";
	
	function allCheck() {
		
		if ($("input[name=reviewChk]").is(":checked")) {
			
			$("input[name=reviewChk]:checked").each(function(index, element) {
				$(element).prop("checked", false);
				reviewArr = [];
			});
			
			reviewArr = [];
			
		} else {
			
			$("input[name=reviewChk]").each(function(index, element) {
				$(element).prop("checked", true);
				reviewArr.push($(element).val());
			});
		}
		
	}
	
	$(function(){
		
		$("#delete").click(function(){
			$("input[name=reviewChk]").each(function(index, element) {
				if ($(element).is(":checked")) {
					reviewArr.push($(element).val());
					//alert($(element).val());
				}
			});
			
			document.reviewDelete.action="reviewDelete?reviewArr=" + reviewArr;
			document.reviewDelete.submit();
		});
	});
	
</script>
<script>
$(function(){
	$('#search').click(function(){
		location.href = 'reviewSearch?searchContent='+$('#searchContent').val();
	});
});
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
      <h2>리뷰</h2>
      <hr>
	
	<!-- 테이블 내용 시작 -->	
	<form name="test"></form>				
	 <div class="container">
		<form action="reviewDelete" method="post" name="reviewDelete">
  		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	        	<div class="row">
					<table width="100%">
						<tr>
							<td align="left">
								<div class="input-group sm-3">
								  <input type="text" class="form-control" id="searchContent" placeholder="Search..." style="width:30px;">
								  <div class="input-group-append">
								  	<input type="button" name="search" id="search" class="btn btn-primary" value="검색">
								  </div>
								</div>
							</td>
							<td align="right">
								<!-- <input type="button" name="button" id="insert" class="btn btn-primary" value="등록"> -->
								<input type="button" name="button" id="delete" class="btn btn-danger" value="삭제">
							</td>
						</tr>
					</table>
				</div>
				
	        	<!-- 테이블 내용 시작 -->					
				<div style="padding-top: 50px">
					<table class="table table-hover">
							<tr class="info">
								<th class="text-center">
									<input type="checkbox" name="chk" id="chk" checked onclick="allCheck();">
								</th>
								<th class="text-center">번호</th>
								<th class="text-center">내용</th>
								<th class="text-center">예약번호</th>
								<th class="text-center">날짜</th>
								<th class="text-center">별점</th>
							</tr>
							<c:forEach var="dto" items="${list}">
							<tr>
								<td align="center">
									<input type = "checkbox" id="reviewChk" name="reviewChk" value="${dto.reviewNo}" checked="">
								</td>
								<td align="center">${dto.reviewNo}</td>
								<td align="center">${dto.content}</td>
								<td align="center">${dto.reserveNo}</td>
								<td align="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.inDate}"/></td>
								<c:choose>
								   		<c:when test="${dto.starPoint == 1}">
									        <td align="center">★</td>
									    </c:when>		
									    <c:when test="${dto.starPoint == 2}">
									        <td align="center">★★</td>
									    </c:when>	
									    <c:when test="${dto.starPoint == 3}">
									        <td align="center">★★★</td>
									    </c:when>	
									    <c:when test="${dto.starPoint == 4}">
									        <td align="center">★★★★</td>
									    </c:when>	
									    <c:when test="${dto.starPoint == 5}">
									        <td align="center">★★★★★</td>
									    </c:when>																														
									    <c:otherwise>
									       	<td align="center">x</td>
									    </c:otherwise>
								    
									</c:choose>
							</tr>
							</c:forEach>
							
							<tr>
								<td colspan=6 align="center">
							    <c:if test="${paging.startPage>10}">
		                       		<a href="review?pageNum=${paging.prev}">[이전]</a>
		                       	</c:if>
		                       	
		                       	<c:forEach var="reviewNo" begin="${paging.startPage}" end="${paging.endPage}">
		                       		<a href="review?pageNum=${reviewNo}">${reviewNo}</a>
		                       	</c:forEach>
		                       	
		                       	<c:if test="${paging.endPage<paging.pageCount}">
		                       		<a href="review?pageNum=${paging.next}">[다음]</a>
		                       	</c:if>
								</td>
		    			  </tr>
					</table>
				</div>
			</form>
				<!-- 테이블 내용 끝 -->
	        </div>
	        </div>
	        <!-- 여기부터 내용 넣으면 됩니다! 끗! -->
	        <hr class="featurette-divider">
	        <%@include file = "/WEB-INF/views/common/footer.jsp" %>
	    </main>
	    </div>
</body>
</html>