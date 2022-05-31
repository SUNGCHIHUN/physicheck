<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의료진 등록 처리</title>
</head>
<body>
	<%-- 등록 성공 --%>
	<c:if test="${insertResult > 0}">
		<script>
			window.location='/admin/doctorList';
		</script>
	</c:if>
	
	<%-- 등록 실패 --%>
	<c:if test="${insertResult <= 0}">
		<script>
			alert('등록 실패')
			history.go(-1);
		</script>
	</c:if>
</body>
</html>