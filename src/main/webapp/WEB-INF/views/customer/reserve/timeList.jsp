<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간표 리스트</title>
<script type="text/javascript">
var cnt = 0;



</script>
</head>
<body>
<form action="#">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<c:set var="date1" value="${date1}"/>
	<c:if test="${date1 == 1 }">
		* 10시 마감
	</c:if>
	<c:if test="${date1 == 0 }">
		<input type="radio" name="datePick" id="datePick" value="10:00:00" class="timeCnt">&nbsp&nbsp10:00
	</c:if>
	<br>
<c:set var="date2" value="${date2}"/>
	<c:if test="${date2 != 0 }">
		* 11시 마감 
	</c:if>
	<c:if test="${date2 == 0 }">
		<input type="radio" name="datePick" id="datePick" value="11:00:00" class="timeCnt">&nbsp&nbsp11:00
	</c:if>
	<br>
<c:set var="date3" value="${date3}"/>
	<c:if test="${date3 != 0 }">
		* 14시 마감 
	</c:if>
	<c:if test="${date3 == 0 }">
		<input type="radio" name="datePick"  id="datePick" value="14:00:00" class="timeCnt">&nbsp&nbsp14:00
	</c:if>
	<br>
<c:set var="date4" value="${date4}"/>
	<c:if test="${date4 != 0 }">
		* 15시 마감 
	</c:if>
	<c:if test="${date4 == 0 }">
		<input type="radio" name="datePick" id="datePick" value="15:00:00" class="timeCnt">&nbsp&nbsp15:00
	</c:if>
	
</form>	
</body>
</html>