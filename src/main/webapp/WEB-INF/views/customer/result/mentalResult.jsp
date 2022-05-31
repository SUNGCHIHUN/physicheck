<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>심리검사결과</title>

<!-- css -->
<link rel = "stylesheet" href = "${path}/resources/css/bootstrap.min.css">
<link rel = "stylesheet" href = "${path}/resources/css/style4.css">
<link rel = "stylesheet" href = "${path}/resources/css/jquery.mCustomScrollbar.min.css">

<!-- js -->
<script src="${path}/resources/js/customerJS/join.js"></script>
<script src="https://kit.fontawesome.com/63d3d77b59.js" crossorigin="anonymous"></script>
<link rel = "stylesheet" href = "${path}/resources/js/bootstrap.min.js">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
</script>
<script src='https://www.gstatic.com/charts/loader.js'></script>
<script>

	var chartData = new Array(); // 차트 데이터

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
	 <div class="wrapper">
        <!-- laftbar start -->
			<%@include file = "/WEB-INF/views/common/leftbar.jsp" %>
		<!-- laftbar end -->

        <!-- Page Content  -->
        <div id="content">

        	<!-- header start -->
			<%@include file = "/WEB-INF/views/common/header.jsp" %>
			<!-- header end -->
			
	        <div class="jumbotron">
				<div class="container">
					<h3 class="display-4">심리검사결과</h3>
				</div>
			</div>
			
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
				</div>
				<!-- 테이블 내용 끝 -->
				<hr class="featurette-divider">
			</div>	<!-- container 끝 -->
			
		 	<!-- footer start -->	
		      <%@include file = "/WEB-INF/views/common/footer.jsp" %>
			<!-- footer end -->	
     
        </div>
    </div>
</body>
</html>