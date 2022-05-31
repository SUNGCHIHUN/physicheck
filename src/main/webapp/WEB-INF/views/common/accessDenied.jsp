<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>접근권한</title>

<!-- 3-3. 자바스크립트 이벤트 추가 : 햄버거버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가 -->
<script src="${path}/resources/js/customerJS/main.js"></script>

</head>
<body>
<div class="wrap">
   <c:if test="${sessionScope.memberId != null}">
      <script>
         $(function () {
            alert("${errMsg}")
            window.location="/logout"
         })
      </script>
   </c:if>
   <c:if test="${sessionScope.memberId == null}">
      <script>
         $(function () {
            alert("${errMsg}")
            window.location="/logout"
         })
      </script>
   </c:if>
</body>
</html>
