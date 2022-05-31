<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정관리</title>
<style>

  /*
  i wish this required CSS was better documented :(
  https://github.com/FezVrasta/popper.js/issues/674
  derived from this CSS on this page: https://popper.js.org/tooltip-examples.html
  */

  .popper,
  .tooltip {
    position: absolute;
    z-index: 9999;
    background: #FFC107;
    color: black;
    width: 150px;
    border-radius: 3px;
    box-shadow: 0 0 2px rgba(0,0,0,0.5);
    padding: 10px;
    text-align: center;
  }
  .style5 .tooltip {
    background: #1E252B;
    color: #FFFFFF;
    max-width: 200px;
    width: auto;
    font-size: .8rem;
    padding: .5em 1em;
  }
  .popper .popper__arrow,
  .tooltip .tooltip-arrow {
    width: 0;
    height: 0;
    border-style: solid;
    position: absolute;
    margin: 5px;
  }

  .tooltip .tooltip-arrow,
  .popper .popper__arrow {
    border-color: #FFC107;
  }
  .style5 .tooltip .tooltip-arrow {
    border-color: #1E252B;
  }
  .popper[x-placement^="top"],
  .tooltip[x-placement^="top"] {
    margin-bottom: 5px;
  }
  .popper[x-placement^="top"] .popper__arrow,
  .tooltip[x-placement^="top"] .tooltip-arrow {
    border-width: 5px 5px 0 5px;
    border-left-color: transparent;
    border-right-color: transparent;
    border-bottom-color: transparent;
    bottom: -5px;
    left: calc(50% - 5px);
    margin-top: 0;
    margin-bottom: 0;
  }
  .popper[x-placement^="bottom"],
  .tooltip[x-placement^="bottom"] {
    margin-top: 5px;
  }
  .tooltip[x-placement^="bottom"] .tooltip-arrow,
  .popper[x-placement^="bottom"] .popper__arrow {
    border-width: 0 5px 5px 5px;
    border-left-color: transparent;
    border-right-color: transparent;
    border-top-color: transparent;
    top: -5px;
    left: calc(50% - 5px);
    margin-top: 0;
    margin-bottom: 0;
  }
  .tooltip[x-placement^="right"],
  .popper[x-placement^="right"] {
    margin-left: 5px;
  }
  .popper[x-placement^="right"] .popper__arrow,
  .tooltip[x-placement^="right"] .tooltip-arrow {
    border-width: 5px 5px 5px 0;
    border-left-color: transparent;
    border-top-color: transparent;
    border-bottom-color: transparent;
    left: -5px;
    top: calc(50% - 5px);
    margin-left: 0;
    margin-right: 0;
  }
  .popper[x-placement^="left"],
  .tooltip[x-placement^="left"] {
    margin-right: 5px;
  }
  .popper[x-placement^="left"] .popper__arrow,
  .tooltip[x-placement^="left"] .tooltip-arrow {
    border-width: 5px 0 5px 5px;
    border-top-color: transparent;
    border-right-color: transparent;
    border-bottom-color: transparent;
    right: -5px;
    top: calc(50% - 5px);
    margin-left: 0;
    margin-right: 0;
  }
</style>
<!-- css -->
<link rel = "stylesheet" href = "${path}/resources/css/adminCSS/admin.css">
<link rel = "stylesheet" href = "${path}/resources/css/bootstrap.min.css">

<!-- js -->
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
});
</script>
<!-- 달력 css&js -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.js"></script>
<script src="https://unpkg.com/popper.js/dist/umd/popper.min.js"></script>
<script src="https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js"></script>
<script>
$(function(){
	
	$.ajax({
	  url: "${path}/doctor/scheduleList",
	  method: "GET",
	  dataType: "JSON",
	  success: function(data){
		  console.log(data);
		  //console.log(data.jsonArr);
			
			var calendarEl = document.getElementById('calendar');
			
		    var calendar = new FullCalendar.Calendar(calendarEl, {
		      initialView: 'dayGridMonth',
		      initialDate: '2022-04-12', //초기 로딩 날짜
		      headerToolbar: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'dayGridMonth,timeGridWeek,timeGridDay'
		      },
		      navLinks: true, // 눌렀을때 day/week 보여줌
		      selectable : true,
		      selectMirror: true, // 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용
		      locale: 'ko',		//한국어 설정
		      droppable: true,
		      events: data	//여기에 날짜 들어간다
		      //후.....왜 안나와 이놈들....
		      /* eventDidMount: function(info) {
		          var tooltip = new Tooltip(info.el, {
		            title: info.event.extendedProps.description,
		            placement: 'top',
		            trigger: 'hover',
		            container: 'body'
		          });
		      } */
		      /* eventRender: function (event, element, view) {
		    	    //일정에 hover시 요약
		    	    element.popover({
		    	      title: $('<div />', {
		    	        class: 'popoverTitleCalendar',
		    	        text: event.title
		    	      }).css({
		    	        'background': event.backgroundColor,
		    	        'color': event.textColor
		    	      }),
		    	      content: $('<div />', {
		    	          class: 'popoverInfoCalendar'
		    	        }).append('<p><strong>예약번호:</strong> ' + event.description + '</p>')
		    	        .append('<p><strong>회원명:</strong> ' + event.title + '</p>')
		    	        .append('<p><strong>시간:</strong> ' + getDisplayEventDate(event) + '</p>')
		    	        .append('<div class="popoverDescCalendar"><strong>설명:</strong> ' + event.description + '</div>'),
		    	      delay: {
		    	        show: "800",
		    	        hide: "50"
		    	      },
		    	      trigger: 'hover',
		    	      placement: 'top',
		    	      html: true,
		    	      container: 'body'
		    	    });

		    	    return filtering(event);
		      } */
		    });
	
		    calendar.render();		
	  },
	  error: function(e){
	  	alert("빼에에에에에에에에에엥~" + e.code);
	  }
	});
	 
	/* request.done(function( data ) {
		console.log(data);
			
			var calendarEl = document.getElementById('calendar');
			
		    var calendar = new FullCalendar.Calendar(calendarEl, {
		      initialView: 'dayGridMonth',
		      headerToolbar: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'dayGridMonth,timeGridWeek,timeGridDay'
		      },
		      events: data
		    });
	
		    calendar.render();								
	});
	 
	request.fail(function( jqXHR, textStatus ) {
	  alert( "Request failed: " + textStatus );
	}); */
});
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
      <h2>일정관리</h2>
      <hr>
	
	<!-- 테이블 내용 시작 -->					
	<div class="container">
	   	<div id='calendar'></div>
	</div>
	<!-- 테이블 내용 끝 -->
	</div>
	<hr>
	<!-- 테이블 내용 끝 -->
   <%@include file = "/WEB-INF/views/common/footer.jsp" %>
   </main>
  <!-- page-content -->
</div>
</body>
</html>