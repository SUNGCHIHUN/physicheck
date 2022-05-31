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

<!-- js -->
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
    <!-- 식사요법 시작 -->
	        <div class="jumbotron">
				<div class="container">
					<h3 class="display-4">식사요법</h3>
				</div>
			</div>
			
			<div class="container">
	        	<!-- 테이블 데이터 내용 시작 -->
	        	<div class="row row-cols-1 row-cols-md-3">
					<c:forEach var="diet" items="${dlist}">
						<c:if test="${dlist.isEmpty()}">
							<h2>항목이 존재하지 않습니다.</h2>
						</c:if>
						<c:if test="${!dlist.isEmpty()}">
						<div class="col mb-4">
						  <div class="card">
						    <a href="dietDetail?dietNo=${diet.dietNo}"><img src="${diet.image}" class="card-img-top" alt="${diet.image}"  width="400" height="400"></a>
						    <div class="card-body">
						      <h5 class="card-title">${diet.title}</h5>
						      <p class="card-text">${diet.content1}</p>
						    </div>
						    <div class="card-footer">
						      <small class="text-muted">${diet.count}</small>
						    </div>
						  </div>
						 </div>
						</c:if>
					</c:forEach>
				</div>
				
				<div align="center">
					<table>
						<tr>
							<td colspan=6 align="center">
								<c:if test="${paging.startPage>10}">
									<a href="dietList?pageNum=${paging.prev}">[이전]</a>
								</c:if>
		
								<c:forEach var="dietNo" begin="${paging.startPage}" end="${paging.endPage}">
									<c:if test="${dietNo == param.pageNum}">
										<span style="font-weight: bold;">${dietNo}</span>
									</c:if>
									<c:if test="${dietNo != param.pageNum}">
										<a href="dietList?pageNum=${dietNo}">${dietNo}</a>
									</c:if>
								</c:forEach>
		
								<c:if test="${paging.endPage<paging.pageCount}">
									<a href="dietList?pageNum=${paging.next}">[다음]</a>
								</c:if>
							</td>
						</tr>
					</table>
				</div>
			</div>
			
			<!-- container 끝 -->
			
			  <!-- footer start -->	
		      <%@include file = "/WEB-INF/views/common/footer.jsp" %>
			  <!-- footer end -->	
     	</main>
    </div>
</body>
</html>