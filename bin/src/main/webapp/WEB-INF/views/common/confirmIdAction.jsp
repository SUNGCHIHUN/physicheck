<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
<link rel = "stylesheet" href = "${path}/resources/css/confirmIdAction.css"/>
<script src="${path}/resources/js/customerJS/join.js"></script>
</head>
<body onload="confirmIdFocus();">
	<form action="${path}/confirmIdAction" method="post" name="confirmform" onsubmit="return confirmIdCheck();">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<!-- id 중복 -->
		<c:if test="${selectCnt == 1}">
			<table>
				<tr>
					<th colspan="2">
						<span>${id}</span>는 사용할 수 없습니다.
					</th>
				</tr>
				
				<tr>
					<th> 아이디 : </th>
					<td>    
						<input class="input" type="text" name="id" maxlength="20"
							style="width:150px" autofocus required>
					</td>
				</tr>
				
				<tr>
					<th colspan="2">
						<input class="inputButton" type="submit" value="확인">
						<input class="inputButton" type="reset" value="취소" onclick="self.close();">
					</th>
				</tr>
			</table>
		</c:if>
		
		<!-- id 중복 아닐 시 -->
		<c:if test="${selectCnt != 1}">
			<table>
				<tr>
					<td align="center">
						<span>${id}</span>는 사용할 수 있습니다.
					</td>
				</tr>
				
				<tr>
					<th>
						<input class="inputButton" type="button" value="확인" onclick="setId('${id}');">
					</th>
				</tr>
			</table>
		</c:if>
	</form>

</body>
</html>