<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기초검사등록</title>

<!-- css -->
<link rel = "stylesheet" href = "${path}/resources/css/adminCSS/admin.css">
<link rel = "stylesheet" href = "${path}/resources/css/bootstrap.min.css">

<!-- js -->
<script src="${path}/resources/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 테이블 내용 시작 -->
	<form action="mentalDetialModifyAction?${_csrf.parameterName}=${_csrf.token}&reserveNo=${mdto.reserveNo}" method="post" name="basicResultboardInsert">
		<div class="container">
		<div class="row">
					<table width="100%">
						<tr>
							<td align="right">
								<input type="submit" id="update" class="btn btn-primary" value="등록">
							</td>
						</tr>
					</table>
				</div>
	        </div>	
			<!-- 여기부터 내용 넣으면 됩니다! -->
	      	<div class="container">
	      	<!-- 테이블 내용 시작 -->					
			<h5>심리검사</h5>
			<table class="table table-bordered">
				<tr>
					<th>항목</th>
					<th>총합</th>
					<th>비고</th>
				</tr>
			    <tr>
			      <th scope="col">시각</th>
			      <td>${dto1.total1}</td>
			      <td>
				      <c:set var="total1" value="${dto1.total1}"/>
				      <c:choose>
				      	<c:when test="${total1 <= 12}">
			      			<p>매일 연습을 통해 심상기술을 발달시켜야 함</p>
				      	</c:when>
				      	<c:when test="${total1 >= 13 && total1 <= 17}">
			      			<p>기술 수준이 보통. 매주 시간을 할애하여 심상기술을 발달 시켜야 함</p>
				      	</c:when>
				      	<c:when test="${total1 >= 17 && total1 <= 20}">
			      			<p>기술 수준이 높음. 주기적으로 연습하여 높은 수준을 유지 해야 함</p>
				      	</c:when>
				      	<c:otherwise>
				      		<p>아직 설문에 응하지 않았음</p>
				      	</c:otherwise>
				      	</c:choose>
			        </td>
			      </tr>
			      <tr>
			      <th scope="col">청각</th>
			      <td>${dto1.total2}</td>
			      <td>
				      <c:set var="total2" value="${dto1.total2}"/>
				      <c:choose>
				      	<c:when test="${total2 <= 12}">
			      			<p>매일 연습을 통해 심상기술을 발달시켜야 함</p>
				      	</c:when>
				      	<c:when test="${total2 >= 13 && total2 <= 17}">
			      			<p>기술 수준이 보통. 매주 시간을 할애하여 심상기술을 발달 시켜야 함</p>
				      	</c:when>
				      	<c:when test="${total2 >= 17 && total2 <= 20}">
			      			<p>기술 수준이 높음. 주기적으로 연습하여 높은 수준을 유지 해야 함</p>
				      	</c:when>
				      	<c:otherwise>
				      		<p>아직 설문에 응하지 않았음</p>
				      	</c:otherwise>
				      	</c:choose>
			        </td>
			      </tr>
			      <tr>
			      <th scope="col">운동감각</th>
			      <td>${dto1.total3}</td>
			      <td>
				      <c:set var="total3" value="${dto1.total3}"/>
				      <c:choose>
				      	<c:when test="${total3 <= 12}">
			      			<p>매일 연습을 통해 심상기술을 발달시켜야 함</p>
				      	</c:when>
				      	<c:when test="${total3 >= 13 && total3 <= 17}">
			      			<p>기술 수준이 보통. 매주 시간을 할애하여 심상기술을 발달 시켜야 함</p>
				      	</c:when>
				      	<c:when test="${total3 >= 17 && total3 <= 20}">
			      			<p>기술 수준이 높음. 주기적으로 연습하여 높은 수준을 유지 해야 함</p>
				      	</c:when>
				      	<c:otherwise>
				      		<p>아직 설문에 응하지 않았음</p>
				      	</c:otherwise>
				      	</c:choose>
			        </td>
			       </tr>
			       <tr>
			       <th scope="col">기분상태</th>
			       <td>${dto1.total4}</td>
			       <td>
				       <c:set var="total4" value="${dto1.total4}"/>
				       <c:choose>
				       <c:when test="${total4 <= 12}">
			       			<p>매일 연습을 통해 심상기술을 발달시켜야 함</p>
				       </c:when>
				       <c:when test="${total4 >= 13 && total4 <= 17}">
			      			<p>기술 수준이 보통. 매주 시간을 할애하여 심상기술을 발달 시켜야 함</p>
				      	</c:when>
				      	<c:when test="${total4 >= 17 && total4 <= 20}">
			      			<p>기술 수준이 높음. 주기적으로 연습하여 높은 수준을 유지 해야 함</p>
				      	</c:when>
				      	<c:otherwise>
				      		<p>아직 설문에 응하지 않았음</p>
				      	</c:otherwise>
				      	</c:choose>
			        </td>
			       </tr>
			       <tr>
			       <th scope="col">조절력</th>
			       <td>${dto1.total5}</td>
			       <td>
				       <c:set var="total5" value="${dto1.total5}"/>
				       <c:choose>
				       <c:when test="${total5 <= 12}">
			       			<p>매일 연습을 통해 심상기술을 발달시켜야 함</p>
				       </c:when>
				       <c:when test="${total5 >= 13 && total5 <= 17}">
			      			<p>기술 수준이 보통. 매주 시간을 할애하여 심상기술을 발달 시켜야 함</p>
				      	</c:when>
				      	<c:when test="${total5 >= 17 && total5 <= 20}">
			      			<p>기술 수준이 높음. 주기적으로 연습하여 높은 수준을 유지 해야 함</p>
				      	</c:when>
				      	<c:otherwise>
				      		<p>아직 설문에 응하지 않았음</p>
				      	</c:otherwise>
				      	</c:choose>
			        </td>
			       </tr>
			 </table>
			 
			 <div style="padding-top: 20px">
				<h5>소견서</h5>
				<table class="table table-bordered">
				    <tr>
                       <td><textarea rows="5" cols="85" name="comments" id="comments" style = "width:100%">${dto1.comments}</textarea></td>
                    </tr>
				 </table>
			 </div>
			 <hr>
	        <!-- 여기부터 내용 넣으면 됩니다! 끗! -->
	</div>
	<!-- 테이블 내용 끝 -->
	</form>					
</body>
</html>