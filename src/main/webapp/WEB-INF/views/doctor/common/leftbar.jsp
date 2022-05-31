<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
         
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://kit.fontawesome.com/63d3d77b59.js" crossorigin="anonymous"></script>
    <script>

        $("#close-sidebar").click(function () {
            $(".page-wrapper").removeClass("toggled");
        });
        $("#show-sidebar").click(function () {
            $(".page-wrapper").addClass("toggled");
        });
    </script>
</head>
<body>
<nav id="sidebar" class="sidebar-wrapper">
    <div class="sidebar-content">
        <div class="sidebar-brand" style="background:#6d7fcc; padding-bottom: 0px;padding-top: 0px;">
            <a href="/doctor/main"><img src="${path}/resources/images/logo/logo2.png" style="width:200px; height:44px;"></a>
            <div id="close-sidebar">
                <i class="fas fa-times"></i>
            </div>
        </div>
        <div class="sidebar-header">
            <div class="user-info">
       <span class="user-name">이름 : ${dto.name}
       </span>
                <span class="user-role">진료과목 : ${dto.examination} </span>
            </div>
        </div>
        <!-- sidebar-header  -->

        <div class="sidebar-menu">
            <ul>
               <li class="header-menu">
                   <span></span>
               </li>
               <li>
                   <a href="/doctor/info">
                       <i class="fa fa-book"></i>
                       <span>개인정보수정</span>
                   </a>
               </li>
               <li>
                   <a href="/doctor/schedule">
                       <i class="fa fa-book"></i>
                       <span>일정관리</span>
                   </a>
               </li>
               <li>
                   <a href="/doctor/customerInfo?examination=${dto.examination}">
                       <i class="fa fa-book"></i>
                       <span>담당회원정보</span>
                   </a>
               </li>
               <li class="sidebar-dropdown">
                   <a href="#">
                       <i class="fa fa-tachometer-alt"></i>
                       <span>검사결과등록</span>
                   </a>
                   <div class="sidebar-submenu">
                       <ul>
                           <c:if test="${dto.examination == '기초검사'}">
                               <li>
                                   <a href="/doctor/resultList1">기초검사</a>
                               </li>
                           </c:if>
                           <c:if test="${dto.examination == '운동검사'}">
                               <li>
                                   <a href="/doctor/resultList2">운동검사</a>
                               </li>
                           </c:if>
                           <c:if test="${dto.examination == '심리검사'}">
                               <li>
                                   <a href="/doctor/resultList3">심리검사</a>
                               </li>
                           </c:if>
                       </ul>
                   </div>
               </li>
               <li class="sidebar-dropdown">
                   <a href="#">
                       <i class="fa fa-tachometer-alt"></i>
                       <span>건강정보</span>
                   </a>
                   <div class="sidebar-submenu">
                       <ul>
                           <li>
                               <a href="/doctor/dietList">식사요법 목록</a>
                           </li>
                           <li>
                               <a href="/doctor/dietAddForm">식사요법 등록</a>
                           </li>
                       </ul>
                   </div>
               </li>             
		       <li class="sidebar-dropdown">
		         <a href="#">
		           <i class="fa fa-tachometer-alt"></i>
		           <span>의약품정보</span>
		         </a>
		         <div class="sidebar-submenu">
		         	<ul>
		       	 		<li>
		           			<a href="/doctor/medicList">의약품 목록</a>
		           		</li>
		           		<li>
		           			<a href="/doctor/medicAddForm">의약품 등록</a>
		           		</li>
		         	</ul>
		         </div>
		       </li>                 
            </ul>
        </div>
        <!-- sidebar-menu  -->
    </div>
    <!-- sidebar-content  -->
    <div class="sidebar-footer">

        <a href="/logout">
            <i class="fa fa-power-off"> Logout</i>
        </a>
    </div>
</nav>
</body>
</html>