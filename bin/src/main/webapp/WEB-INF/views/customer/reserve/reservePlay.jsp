<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>

<!-- css -->
<style>
td:hover {
  background-color: gold;
  cursor:pointer;
}
td{
	font-size:45px;
}
</style>
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

<!-- 달력  -->
<script type="text/javascript">

var today = new Date();
function buildCalendar(){
  var row = null
  var cnt = 0;
  var calendarTable = document.getElementById("calendar");
  var calendarTableTitle = document.getElementById("calendarTitle");
  calendarTableTitle.innerHTML = today.getFullYear()+"년"+(today.getMonth()+1)+"월";
  
  var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
  var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0);
  
  while(calendarTable.rows.length > 2){
  	calendarTable.deleteRow(calendarTable.rows.length -1);
  }

  row = calendarTable.insertRow();
  for(i = 0; i < firstDate.getDay(); i++){
  	cell = row.insertCell();
  	
  	cnt += 1;
  	console.log(firstDate.getDay());
  	console.log(i);
  	
  }

  for(i = 1; i <= lastDate.getDate(); i++){
  	cell = row.insertCell();
  	cnt += 1;

    cell.setAttribute('id', i);
  	cell.innerHTML = i;
  	cell.align = "center";

    

    if (cnt % 7 == 1) {
    	cell.innerHTML = "<font color=#F79DC2>" + i + "</font>";
    }

    if (cnt % 7 == 0){
    	cell.innerHTML = "<font color=skyblue>" + i + "</font>";
    	row = calendar.insertRow();
    }
  }

  if(cnt % 7 != 0){
  	for(i = 0; i < 7 - (cnt % 7); i++){
  		cell = row.insertCell();
  	}
  }
  
  
}

function prevCalendar(){
	today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
	buildCalendar();
}

function nextCalendar(){
	today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
	buildCalendar();
}

$(document).ready(function() {
	
	
	$("td:not(:first)").on('click',function(){
		
		clickedYear = today.getFullYear();
	  	clickedMonth = ( 1 + today.getMonth() );
	  	clickedDate = this.getAttribute('id');
		
	  	if(clickedDate == 0 || clickedDate == null){
	  		clickedDate = 1;
	  	}
	  	
	  	clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;
	  	clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
	  	clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;
	  	
	  	var todayDate = ("0" + today.getDate()).slice(-2);
	  	var now = new Date();
	  	var currentDate;
	  	
	  		currentDate = today.getFullYear() + "-0" + (1+now.getMonth()) + "-" + todayDate;
	  	
	  
	  	// var currentDate = today.getFullYear() + "-0" + (1+today.getMonth()) + "-" + today.getDate();
	  	
	  	// alert(currentDate);
	  	if(clickedYMD <= currentDate){
	  		//alert(clickedYMD);
	  		//alert(currentDate);
	  		alert("내일 날짜 부터 예약이 가능합니다.");
	  		
	  	}
	  	else{
	  		$('#selectedDate').val(clickedYMD)
	  		select_test();
	  	}
	  	
	});


	$("th").on('click',function(){
		
		clickedYear = today.getFullYear();
	  	clickedMonth = ( 1 + today.getMonth() );
	  	clickedDate = 1;

	  	if(clickedDate == 0 || clickedDate == null){
	  		clickedDate = 1;
	  	}
	  	
	  	clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;
	  	clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
	  	clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;
	  	
	  	$('#selectedDate').val(clickedYMD)
	  	
	  	$("td:not(:first)").on('click',function(){
			
			clickedYear = today.getFullYear();
		  	clickedMonth = ( 1 + today.getMonth() );
		  	clickedDate = this.getAttribute('id');

		  	if(clickedDate == 0 || clickedDate == null){
		  		clickedDate = 1;
		  	}
		  	
		  	clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;
		  	clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
		  	clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;
		  	
		  	var todayDate = ("0" + today.getDate()).slice(-2);
		  	
		  	var currentDate;
		  	var now = new Date();
		  		 currentDate = today.getFullYear() + "-0" + (1+now.getMonth()) + "-" + todayDate;
		  	
		  
		  	// var currentDate = today.getFullYear() + "-0" + (1+today.getMonth()) + "-" + today.getDate();
		  	
		  	
		  	// alert(currentDate);
		  	if(clickedYMD <= currentDate){
		  		//alert(clickedYMD);
		  		//alert(currentDate);
		  		alert("내일 날짜 부터 예약이 가능합니다.");
		  	}
		  	else{
		  		$('#selectedDate').val(clickedYMD)
		  		select_test();
		  	}
		});
	  	
	});
	
	
	// 예약하기 버튼
	$("#reserveBtn").click(function(){
		
		reserve_addBtn();
	});
	
});

function select_test() {
	
	var param = {
			"date" : $('#selectedDate').val(),
			"${_csrf.parameterName}" : "${_csrf.token}"
	}
	
	console.log('param : ' + param);
	
	$.ajax({
		type: "post",
		url: "/customer/timeList?${_csrf.parameterName}=${_csrf.token}",
		data: param,
		success: function(result) {	
			$('#timeList').html(result);
			
		},
		error:function(request,status,error){
			alert("code:" + request.status + request.responseText + error);
		}
	});
	
	
}	

function reserve_addBtn() {
		 var succeess = 0;
		var date_length = document.getElementsByName("datePick").length;
		var date_pick;
		  for (var i=0; i<date_length; i++) {
	            if (document.getElementsByName("datePick")[i].checked == true) {
	            	date_pick = document.getElementsByName("datePick")[i].value;
	            }
	        }
		  
		  // alert(date_pick);
		  var dateTotal = document.getElementById("selectedDate").value + " " + date_pick;
		  
		  // alert(dateTotal);
		  
		  var physical = 0;
		  var mental = 0;
		 
		  
		  if(document.getElementById("physical").checked){
			  physical = 1;
		  }
		  if(document.getElementById("mental").checked){
			  mental = 1;
		  }
		  
		  var param = {
					"reservData" : dateTotal,
					"physical" : physical,
					"mental" : mental,
					"${_csrf.parameterName}" : "${_csrf.token}"
			}
			
			$.ajax({
				type: "post",
				url: "/customer/reserveAction?${_csrf.parameterName}=${_csrf.token}",
				data: param,
				success: function(result) {	
					console.log("success");
					succeess = 1;
					select_test();
				}
			});
		  console.log(succeess);
		  alert(dateTotal + "예약이 완료되었습니다.")	;
		  setTimeout(function() {
			  location.href="/customer/reserveList";
			}, 2000);
		  
			
			
	
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
			
			<!-- 예약하기 시작 -->
	        <div class="jumbotron">
				<div class="container">
					<h3 class="display-4">예약하기</h3>
				</div>
			</div>
			
			<div class="container" >
			<form class="needs-validation" name="joinform"novalidate>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="card border-primary mb-3" style="max-width: 20rem; margin-left:37%">
			  <div class="card-header">회원번호</div>
			  <div class="card-body">
			    <h4 class="card-title">${MemberNo}</h4>
			    <p class="card-text"></p>
			  </div>
			</div>
			
			<div class="card border-primary mb-3" style="max-width: 20rem; margin-left:37%">
			  <div class="card-header">검사항목 (* 기초항목필수) </div>
			  <div class="card-body">
			  <input type = "checkbox" id="physical" name="physical" class="card-title">체력검사
			  <input type = "checkbox" id="mental" name="mental" >심리검사
			  </div>
			</div>
			
			<!-- 달력 시작 -->
			<div style="margin-rignt:10px; margin-top:20px;">
				<table id="calendar" align="center" >
	
					<tr>
						<th align="center"><label onclick="prevCalendar()"> ◀ </label></td>
						<td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td>
						<th align="center"><label onclick="nextCalendar()"> ▶ </label></td>
					</tr>
					<tr>
						<td align="center"><font color ="#F79DC2">일</td>
						<td align="center">월</td>
						<td align="center">화</td>
						<td align="center">수</td>
						<td align="center">목</td>
						<td align="center">금</td>
						<td align="center"><font color ="skyblue">토</td>
					</tr>
					<script type="text/javascript">buildCalendar();</script>
				</table>
				
				<!-- 선택한 예약일시를 출력할 위치 -->
				<input id="selectedDate" type="text" name="selectedDate" readonly="readonly" style="margin-left:40%; margin-top:50px; font-size:25px;">
			
				<div id="timeList" style="margin-left:40%; margin-top:15px; font-size:25px;">
									
				</div>
			</div>
			<!-- 달력 끝 -->
			<button class="w-100 btn btn-primary btn-lg" type="button" id="reserveBtn" style="margin-top:100px;">예약하기</button>
			</form>
				
	        	
			</div>	<!-- container 끝 -->
			
		 <!-- footer start -->	
		      <%@include file = "/WEB-INF/views/common/footer.jsp" %>
			<!-- footer end -->	
     
        </div>
    </div>
</body>
</html>