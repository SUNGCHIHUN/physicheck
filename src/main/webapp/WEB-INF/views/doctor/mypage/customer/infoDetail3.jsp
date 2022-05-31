<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>담당회원정보상세</title>
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
	
	$("#mentalBtn").click(function() {
		window.open("mentalDetialModify?reserveNo=${param.reserveNo}", '심리검사수정','width=800px,height=900px' );
	});
});
</script>
<script src='https://www.gstatic.com/charts/loader.js'></script>
<script>

	var total1 = 0;
	var total2 = 0;
	var total3 = 0;
	var total4 = 0;
	var total5 = 0;
	
	if(${dto2.total1 != ''})
		total1 = parseInt("${dto2.total1}");
	if(${dto2.total2 != ''})
		total2 = parseInt("${dto2.total2}");
	if(${dto2.total3 != ''})
		total3 = parseInt("${dto2.total3}");
	if(${dto2.total4 != ''})
		total4 = parseInt("${dto2.total4}");
	if(${dto2.total5 != ''})
		total5 = parseInt("${dto2.total5}");
	
	// 페이지가 로딩되면 차트 출력
	$(function() {
		loadChart();
	});
	
	// 차트 출력하기
	function loadChart() {

		// 구글 차트 라이브러리 불러오기
		google.charts.load('upcoming', {'packages': ['vegachart']}).then(drawChart);
		
		// 차트 정보를 매개변수로 받아서 그에 맞는 구글 차트 출력
		google.charts.setOnLoadCallback(drawChart);
	}
	
	// 차트 정보 설정 메서드
	function drawChart() {
		 const dataTable = new google.visualization.DataTable();
		    dataTable.addColumn({type: 'string', 'id': 'category'});
		    dataTable.addColumn({type: 'number', 'id': 'amount'});
		    dataTable.addRows([
		      ['시각', total1],
		      ['청각', total2],
		      ['운동감각', total3],
		      ['기분상태', total4],
		      ['조절력', total5],
		    ]);

		    const options = {
		    	"vega": {
		        "$schema": "https://vega.github.io/schema/vega/v4.json",
		        "width": 500,
	            "height": 200,
		        "padding": 5,
		
		        'data': [{'name': 'table', 'source': 'datatable'}],
		
		        "signals": [
		          {
		            "name": "tooltip",
		            "value": {},
		            "on": [
		              {"events": "rect:mouseover", "update": "datum"},
		              {"events": "rect:mouseout",  "update": "{}"}
		            ]
		          }
		        ],
		
		        "scales": [
		          {
		            "name": "xscale",
		            "type": "band",
		            "domain": {"data": "table", "field": "category"},
		            "range": "width",
		            "padding": 0.05,
		            "round": true
		          },
		          {
		            "name": "yscale",
		            "domain": {"data": "table", "field": "amount"},
		            "nice": true,
		            "range": "height"
		          }
		        ],
		
		        "axes": [
		          { "orient": "bottom", "scale": "xscale" },
		          { "orient": "left", "scale": "yscale" }
		        ],
		
		        "marks": [
		          {
		            "type": "rect",
		            "from": {"data":"table"},
		            "encode": {
		              "enter": {
		                "x": {"scale": "xscale", "field": "category"},
		                "width": {"scale": "xscale", "band": 1},
		                "y": {"scale": "yscale", "field": "amount"},
		                "y2": {"scale": "yscale", "value": 0}
		              },
		              "update": {
		                "fill": {"value": "steelblue"}
		              },
		              "hover": {
		                "fill": {"value": "red"}
		              }
		            }
		          },
		          {
		            "type": "text",
		            "encode": {
		              "enter": {
		                "align": {"value": "center"},
		                "baseline": {"value": "bottom"},
		                "fill": {"value": "#333"}
		              },
		              "update": {
		                "x": {"scale": "xscale", "signal": "tooltip.category", "band": 0.5},
		                "y": {"scale": "yscale", "signal": "tooltip.amount", "offset": -2},
		                "text": {"signal": "tooltip.amount"},
		                "fillOpacity": [
		                  {"test": "datum === tooltip", "value": 0},
		                  {"value": 1}
		                ]
		              }
		            }
		          }
		        ]
		      }
		    };

		    const chart = new google.visualization.VegaChart(document.getElementById('chart-div'));
		    chart.draw(dataTable, options);
    	}
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
    <div class="container-fluid">
      <h2>담당회원정보상세</h2>
      <hr>
	<!-- 테이블 내용 시작 -->					
	   <div class="container">
	        	<div class="row">
					<table width="100%">
						<tr>
							<td align="right">
								<input type="button" name="button" id="mentalBtn" class="btn btn-primary" value="수정">
							</td>
						</tr>
					</table>
				</div>
	        </div>

	        <!-- 여기부터 내용 넣으면 됩니다! -->
	        <div class="container">
	        	<!-- 테이블 내용 시작 -->					
				<div style="padding-top: 50px">
					<h5>회원정보</h5>
					<table class="table table-bordered">
						    <tr>
						      <th scope="col">번호</th>
						      <td>${mdto.memberNo}</td>
						      <th scope="col">예약번호</th>
						      <td>${mdto.reserveNo}</td>
						    </tr>
						    <tr>
						      <th scope="col">이름</th>
						      <td>${mdto.name}</td>
						      <th scope="col">나이</th>
						      <td>
						      <c:set var="jumin" value="${mdto.jumin1}"/>
							  <!-- 현재년도 가져오기 -->
							  <c:set var="now" value="<%=new java.util.Date()%>" />
							  <c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
							  <c:set var="year" value="${fn:substring(sysYear,2,4)}"/>
							  
							  <!-- 나이 구하기 -->
							  <c:set value="${fn:substring(jumin,0,2)}" var="frontJumin"/>
							  <c:set var = "age1" value="${100-frontJumin+1}"/>
							  <!-- 계산한나이-->
   							  <c:set var = "age" value="${age1+year}" />
   							  <c:set var = "age2" value="${age-1}" />
   							  ${age}세(만 ${age2}세)
								
						      </td>
						      </tr>
						    <tr>
						      <th scope="col">주민번호</th>
						      <td>${mdto.jumin1} - *******</td>
						      <th scope="col">성별</th>
						      <td>${mdto.gender}</td>
						    </tr>
					 </table>
				</div>
				
				<div style="padding-top: 20px">
					<h5>심리검사</h5>
					<div id="chart-div" align="center"></div>
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
					 
					 <h5>담당의 소견서</h5>
					 <table class="table table-bordered">
					 	<tr>
					 		<td>${dto1.comments}</td>
					 	</tr>
					 </table>
					 
					 <hr class="featurette-divider">
					 <table class="table table-hover">
						<h5>이전 검사 내역</h5>
						<tr class="info">
							<th class="text-center">번호</th>
							<th class="text-center">예약번호</th>
							<th class="text-center">이름</th>
							<th class="text-center">검진날짜</th>
						</tr>
						
						<c:forEach var="dto1" items="${list}">
							<tr>
								<td align="center">${dto1.memberNo}</td>
								<td align="center">${dto1.reserveNo}</td>
								<td align="center"><a href="customerDetail3?reserveNo=${dto1.reserveNo}&memberNo=${dto1.memberNo}">${dto1.name}</a></td>
								<td align="center">${dto1.reserveDate}</td>
							</tr>
						</c:forEach>
						
						<tr>
							<td colspan="4" align="center">
							    <!-- 페이징 처리 -->
								<!-- 이전버튼 활성화 여부 -->
								<c:if test="${paging.startPage > 10}">
									<a href="/doctor/customerDetail3?pageNum=${paging.prev}&reserveNo=${mdto.reserveNo}&memberNo=${mdto.memberNo}">[이전]</a>
								</c:if>
								
								<!-- 페이지번호 처리 -->
								<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
									<a href= "/doctor/customerDetail3?pageNum=${num}&reserveNo=${mdto.reserveNo}&memberNo=${mdto.memberNo}">${num}</a>
								</c:forEach>
								${num}
								<c:if test="${paging.endPage < paging.pageCount}">
									<a href="/doctor/customerDetail3?pageNum=${paging.next}&reserveNo=${mdto.reserveNo}&memberNo=${mdto.memberNo}">[다음]</a>
								</c:if>
							 </td>
		    			 </tr>
					</table>
				</div>
	        </div>
			<hr>
	<!-- 테이블 내용 끝 -->
   </div>
   <%@include file = "/WEB-INF/views/common/footer.jsp" %>
   </main>
  <!-- page-content -->
</div>
</body>
</html>