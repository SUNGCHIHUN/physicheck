<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://kit.fontawesome.com/63d3d77b59.js" crossorigin="anonymous"></script>
    <script>
        jQuery(function ($) {
            $(".sidebar-dropdown > a").click(function () {
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

            $("#close-sidebar").click(function () {
                $(".page-wrapper").removeClass("toggled");
            });
            $("#show-sidebar").click(function () {
                $(".page-wrapper").addClass("toggled");
            });
        });
    </script>
</head>
<body>
<nav id="sidebar">
    <div class="sidebar-header">
        <a href="/main"><img src="${path}/resources/images/logo/logo1.png" style="width:100%;"></a>
        <strong><img src="${path}/resources/images/logo/logo8.png" style="width:100%;"></strong>
    </div>

    <ul class="list-unstyled components">
        <li>
            <a href="#menu1" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                <i class="fas fa-copy"></i>
                회원정보
            </a>
            <ul class="collapse list-unstyled" id="menu1">
                <li>
                    <a href="/customer/memberInfo">정보조회</a>
                </li>
            </ul>
        </li>

        <li>
            <a href="#menu2" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                <i class="fas fa-copy"></i>
                전자문진표
            </a>
            <ul class="collapse list-unstyled" id="menu2">
                <li>
                    <a href="/customer/mentalTest">심리검사</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="#menu3" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                <i class="fas fa-copy"></i>
                예약정보
            </a>
            <ul class="collapse list-unstyled" id="menu3">
                <li>
                    <a href="/customer/reserveList">예약내역</a>
                </li>
                <li>
                    <a href="/customer/reservePlay">예약하기</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="#menu4" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                <i class="fas fa-copy"></i>
                검사결과
            </a>
            <ul class="collapse list-unstyled" id="menu4">
                <li>
                    <a href="/customer/basicResultList">기초검사결과</a>
                </li>
                <li>
                    <a href="/customer/physicalResultList">운동검사결과</a>
                </li>
                <li>
                    <a href="/customer/mentalResultList">심리검사결과</a>
                </li>
                <li>
                    <a href="/customer/totalResultList">종합검사결과</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="#menu5" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                <i class="fas fa-copy"></i>
                검사안내
            </a>
            <ul class="collapse list-unstyled" id="menu5">
                <li>
                    <a href="/basicCheckup">기초검사</a>
                    <a href="/physicalCheckup">운동검사</a>
                    <a href="/mentalCheckup">심리검사</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="#menu6" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                <i class="fas fa-copy"></i>
                병원소개
            </a>
            <ul class="collapse list-unstyled" id="menu6">
                <li>
                    <a href="/comingWay">오시는길</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="#menu7" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                <i class="fas fa-copy"></i>
                공지사항
            </a>
            <ul class="collapse list-unstyled" id="menu7">
                <li>
                    <a href="/boardList">공지사항</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="#menu8" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                <i class="fas fa-copy"></i>
                리뷰
            </a>
            <ul class="collapse list-unstyled" id="menu8">
                <li>
                    <a href="/customer/reviewList">리뷰목록</a>
                </li>

                <li>
                    <a href="/customer/reviewAdd">리뷰등록</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="#menu9" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                <i class="fas fa-copy"></i>
                건강정보
            </a>
            <ul class="collapse list-unstyled" id="menu9">
                <li>
                    <a href="/customer/dietList">식사요법</a>
                </li>
            </ul>
        </li>
    </ul>
</nav>

</body>
</html>