<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의약품 정보수정</title>
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
   		
   		// 의약품 삭제
   		function deleteDiet(no) {
   			if(confirm('삭제하시겠습니까?')) {
   				window.location="medicDeleteAction?medicineNo=" + no;
   			}
   		}
   		
		// 의약품 수정
		function updateDiet(no) {
			window.location="getMedicUpdate?medicineNo=" + no;
		}
		
</script>

<style>
.paging a{
	font-size:20px;
	padding:5px;
}
</style>

</head>
<body>

	<!-- header start -->
	<%@include file = "/WEB-INF/views/doctor/common/header.jsp" %>
	<!-- header end -->	
	<div class="page-wrapper chiller-theme toggled">
		<a id="show-sidebar" class="btn btn-sm" href="#" style="background:#606ea8;">
			<i class="fas fa-bars"></i>
		</a>
		<!-- laftbar start -->  
		<%@include file = "/WEB-INF/views/doctor/common/leftbar.jsp" %>
		<!-- laftbar end -->
	
		<!-- page-content -->
		<main class="page-content">
		  
		<!-- 시작 -->
        <div class="jumbotron">
			<div class="container">
				<h3 class="display-4">의약품 목록</h3>
			</div>
		</div>
			
		<div class="container">
        	<!-- 테이블 내용 시작 -->
	        <div style="padding-top: 50px">
	           <table class="table table-hover">
	                 <tr class="info">
	                    <th class="text-center">번호</th>
	                    <th class="text-center">사진</th>
	                    <th class="text-center">이름</th>
	                    <th class="text-center">설명</th>	  
	                    <th class="text-center">수정/삭제</th>	  	                                   
	                 </tr>			

					<c:forEach var="medicine" items="${mlist}">
						<c:if test="${mlist.isEmpty()}">
							<h2>항목이 존재하지 않습니다.</h2>
						</c:if>
						<c:if test="${!mlist.isEmpty()}">
							<tr>
								<td align="center">${medicine.medicineNo}</td>			
								<td align="center"><img src="${medicine.img}" id="img"></td>					
								<td align="center">${medicine.name}</td>
								<td align="center">${medicine.content1}</td>
								<td colspan="2" align="center">
									<input type="button" value="수정" onclick="updateDiet('${medicine.medicineNo}');">
									<input type="button" value="삭제" onclick="deleteDiet('${medicine.medicineNo}');">
								</td>							
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
			

			<hr class="featurette-divider">	
		  </div>					
		  <!-- footer start -->	
	      <%@include file = "/WEB-INF/views/doctor/common/footer.jsp" %>
		  <!-- footer end -->	
     	</main>
    </div>
</body>
</html>