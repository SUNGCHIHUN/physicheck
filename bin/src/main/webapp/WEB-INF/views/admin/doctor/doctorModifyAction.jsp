<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 처리</title>
</head>
<body>
	<%-- 수정 성공 --%>
	<c:if test="${updateResult > 0}">
		<script>
			window.location='/admin/doctorList?doctorNo=${doctorNo}&pageNum=${pageNum}';
		</script>
	</c:if>
	
	<%-- 수정 실패 --%>
	<c:if test="${updateResult <= 0}">
		<script>
			alert('수정 실패')
			history.go(-1);
		</script>
	</c:if>
</body>
</html>