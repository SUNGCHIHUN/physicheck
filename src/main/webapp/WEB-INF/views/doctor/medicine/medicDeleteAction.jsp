<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의약품 삭제처리</title>
</head>
<body>
    <c:if test="${deleteCount == 0}">
		<script type="text/javascript">
			alert("삭제 실패!");
		</script>
	</c:if>
	<c:if test="${deleteCount != 0}">
		<script type="text/javascript">
			alert("삭제 성공!");
			window.location="medicList";
		</script>
	</c:if>
</body>
</html>