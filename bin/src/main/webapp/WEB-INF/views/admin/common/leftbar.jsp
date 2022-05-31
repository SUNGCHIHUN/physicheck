<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://kit.fontawesome.com/63d3d77b59.js" crossorigin="anonymous"></script>
</head>
<body>

<nav id="sidebar" class="sidebar-wrapper">
    <form method="post" name="form1">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        <div class="sidebar-content">
            <div class="sidebar-brand" style="background:#6d7fcc; padding-bottom: 0px;padding-top: 0px;">
                <a href="/admin/main"><img src="${path}/resources/images/logo/logo2.png"
                                           style="width:200px; height:44px;"></a>
                <div id="close-sidebar">
                    <i class="fas fa-times"></i>
                </div>
            </div>

            <!-- sidebar-header  -->

            <div class="sidebar-menu">
                <ul>
                    <li class="header-menu">
                        <span></span>
                    </li>
                    <li>
                        <a href="/admin/notice">
                            <i class="fa fa-book"></i>
                            <span>공지사항</span>
                        </a>
                    </li>
                    <li>
                        <a href="/admin/review">
                            <i class="fa fa-book"></i>
                            <span>리뷰관리</span>
                        </a>
                    </li>
                    <li class="sidebar-dropdown">
                        <a href="#">
                            <i class="fa fa-tachometer-alt"></i>
                            <span>회원</span>
                        </a>
                        <div class="sidebar-submenu">
                            <ul>
                                <li>
                                    <a href="/admin/memberList">회원목록</a>
                                </li>
                                <li>
                                    <a href="/admin/memberRegistList">회원요청목록</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="sidebar-dropdown">
                        <a href="#">
                            <i class="fa fa-shopping-cart"></i>
                            <span>의료진</span>
                        </a>
                        <div class="sidebar-submenu">
                            <ul>
                                <li>
                                    <a href="/admin/doctorList">의료진목록</a>
                                </li>
                                <li>
                                    <a href="/admin/doctorRegistForm">의료진등록</a>
                                </li>
                                <li>
                                    <a href="/admin/doctorPerformance">의료진실적</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="sidebar-dropdown">
                        <a href="#">
                            <i class="far fa-gem"></i>
                            <span>결산</span>
                        </a>
                        <div class="sidebar-submenu">
                            <ul>
                                <li>
                                    <a href="/admin/totalSales">총매출</a>
                                </li>
                                <li>
                                    <a href="/admin/testSales">검사항목별매출</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="sidebar-dropdown">
                        <a href="#">
                            <i class="far fa-gem"></i>
                            <span>통계</span>
                        </a>
                        <div class="sidebar-submenu">
                            <ul>
                                <li>
                                    <a href="/admin/statics1">성별</a>
                                </li>
                                <li>
                                    <a href="/admin/statics2">연령별</a>
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