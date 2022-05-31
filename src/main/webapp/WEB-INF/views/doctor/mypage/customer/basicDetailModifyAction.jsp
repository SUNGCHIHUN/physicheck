<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기초검사등록Action</title>

<!-- css -->
<link rel = "stylesheet" href = "${path}/resources/css/adminCSS/admin.css">
<link rel = "stylesheet" href = "${path}/resources/css/bootstrap.min.css">

<!-- js -->
<script src="${path}/resources/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/63d3d77b59.js" crossorigin="anonymous"></script>
</head>
<body>
  <main class="page-content">
	  <div class="container-fluid">
	  	<!-- InsertCnt -->
	    <c:if test="${bmiUpdateCnt == 0}">
			<c:if test="${pressureUpdateCnt == 0}">
				<c:if test="${urineUpdateCnt == 0}">
					<c:if test="${bloodUpdateCnt == 0}">
						<script type="text/javascript">
							alert("Update 실패(UpdateCnt)");
						</script>
					</c:if>
				</c:if>
			</c:if>
		</c:if>
		<c:if test="${bmiUpdateCnt != 0}">
			<c:if test="${pressureUpdateCnt != 0}">
				<c:if test="${urineUpdateCnt != 0}">
					<c:if test="${bloodUpdateCnt != 0}">
						<script type="text/javascript">
							setTimeout(function() {
								alert("기초검사결과 수정 완료.");
								self.close();
							},1000);
						</script>
					</c:if>
				</c:if>
			</c:if>
		</c:if>
	  </div>
  </main>
</body>
</html>