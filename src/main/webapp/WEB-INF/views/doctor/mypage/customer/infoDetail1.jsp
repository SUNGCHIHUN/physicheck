<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>담당회원정보상세</title>
    <!-- css -->
    <link rel="stylesheet" href="${path}/resources/css/adminCSS/admin.css">
    <link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">

    <!-- js -->
    <script src="${path}/resources/js/bootstrap.min.js"></script>
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

            $("#basicBtn").click(function () {
                window.open("basicDetialModify?reserveNo=${param.reserveNo}", '기본검사수정', 'width=800px,height=900px');
            });
        });
</script>
</head>
<body>
<header class="header">
    <%@include file="/WEB-INF/views/doctor/common/header.jsp" %>
</header>
<div class="page-wrapper chiller-theme toggled">
    <a id="show-sidebar" class="btn btn-sm" href="#" style="background:#606ea8;">
        <i class="fas fa-bars"></i>
    </a>
    <%@include file="/WEB-INF/views/doctor/common/leftbar.jsp" %>
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
                                <input type="button" name="button" id="basicBtn" class="btn btn-primary" value="수정">
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
                                <c:set var="now" value="<%=new java.util.Date()%>"/>
                                <c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy"/></c:set>
                                <c:set var="year" value="${fn:substring(sysYear,2,4)}"/>

                                <!-- 나이 구하기 -->
                                <c:set value="${fn:substring(jumin,0,2)}" var="frontJumin"/>
                                <c:set var="age1" value="${100-frontJumin+1}"/>
                                <!-- 계산한나이-->
                                <c:set var="age" value="${age1+year}"/>
                                <c:set var="age2" value="${age-1}"/>
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
                    <table class="table table-bordered">
                        <tr align="center">
                            <th width="10%">구분</th>
                            <th width="15%">검사항목</th>
                            <th width="10%">결과</th>
                            <th width="18%">정상수치</th>
                            <th width="15%">건강주의수치</th>
                            <th width="20%">비고</th>
                        </tr>

                        <!-- 기초검사  -->
                        <tr>
                            <td width="10%" rowspan="6" align="center" style="vertical-align: middle">기초검사</td>
                            <td width="10%">신장(cm)</td>
                            <td width="10%">${bmi.height}</td>
                            <td width="10%" colspan="3" align="center" style="vertical-align: middle">-</td>
                        </tr>
                        <tr>
                            <td width="10%">체중(kg)</td>
                            <td width="10%">${bmi.weight}</td>
                            <td width="10%" colspan="3" align="center" style="vertical-align: middle">-</td>
                        </tr>

                        <tr>
                            <td width="10%">체질량(BMI)(kg/m2)</td>
                            <td width="10%">${bmi.bmi}</td>
                            <td width="10%" align="center" style="vertical-align: middle"> 18.5 이상 22.9 미만</td>
                            <td width="10%" align="center" style="vertical-align: middlel;">
                                <c:choose>
                                    <c:when test="${bmi.bmi < 18.5}">
                                        저체중
                                    </c:when>
                                    <c:when test="${bmi.bmi < 22.9}">
                                        정상
                                    </c:when>
                                    <c:when test="${bmi.bmi < 24.9}">
                                        과체중
                                    </c:when>
                                    <c:when test="${bmi.bmi < 29.9}">
                                        경도비만(1단계 비만)
                                    </c:when>
                                    <c:when test="${bmi.bmi < 34.9}">
                                        중도비만(2단계 비만)
                                    </c:when>
                                    <c:when test="${bmi.bmi > 35}">
                                        고도비만
                                    </c:when>
                                    <c:otherwise>
                                        X
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td width="10%" align="center" style="vertical-align: middle">-</td>
                        </tr>
                        <tr>
                            <td width="10%">체지방(g/cm3)</td>
                            <td width="10%">${bmi.bodyFat}</td>
                            <td width="10%"></td>
                            <td width="10%"></td>
                            <td width="10%"></td>
                        </tr>

                        <tr>
                            <td width="10%">근량(kg)</td>
                            <td width="10%">${bmi.bodyMuscle}</td>
                            <td width="10%"></td>
                            <td width="10%"></td>
                            <td width="10%"></td>
                        </tr>
                        <tr>
                            <td width="10%">체수분량(ml)</td>
                            <td width="10%">${bmi.bodyWater}</td>
                            <td width="10%"></td>
                            <td width="10%"></td>
                            <td width="10%"></td>
                        </tr>

                        <!-- 혈압검사  -->
                        <tr>
                            <td rowspan="2" align="center" style="vertical-align: middle">혈압검사</td>
                            <td width="10%">최고혈압(mmHg)</td>
                            <td width="10%">${pressure.pressureHigh}</td>
                            <td width="10%" rowspan="2" align="center" style="vertical-align: middle">
                                최고혈압 : 130mmHg미만 <br>
                                최저혈압 : 130mmHg미만
                            </td>
                            <td width="10%" rowspan="2" align="center" style="vertical-align: middle">
                                <c:choose>
                                    <c:when test="${pressure.pressureHigh < 130 && pressure.pressureLow < 130}">
                                        정상혈압
                                    </c:when>
                                    <c:when test="${pressure.pressureHigh < 139 && pressure.pressureLow < 139}">
                                        고혈압 전단계
                                    </c:when>
                                    <c:when test="${pressure.pressureHigh < 159 && pressure.pressureLow < 159}">
                                        고혈압 1단계(경증)
                                    </c:when>
                                    <c:when test="${pressure.pressureHigh < 179 && pressure.pressureLow < 179}">
                                        고혈압 2단계(중등증)
                                    </c:when>
                                    <c:when test="${pressure.pressureHigh < 209 && pressure.pressureLow > 209}">
                                        고혈압 3단계(중증)
                                    </c:when>
                                    <c:otherwise>
                                        문제있음(고혈압)
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td width="10%" rowspan="2" align="center" style="vertical-align: middle">
                                <c:choose>
                                    <c:when test="${pressure.pressureHigh > 130 && pressure.pressureLow > 130}">
                                        동맥경화나 협심증, 심근경색, 뇌졸중 위험
                                    </c:when>
                                    <c:otherwise>
                                        -
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td width="10%">최저혈압(mmHg)</td>
                            <td width="10%">${pressure.pressureLow}</td>
                        </tr>

                        <!-- 혈액검사 -->
                        <tr>
                            <td rowspan="5" align="center" style="vertical-align: middle">혈액검사</td>
                            <td width="10%" style="vertical-align: middle">적혈구수(10^6 /㎣)</td>
                            <td width="10%">${blood.redBloodCell}</td>
                            <td width="10%" align="center" style="vertical-align: middle">
                                남성 : 4.2~6.3 (10^6/㎣)<br>
                                여성 : 4.0~5.4 (10^6/㎣)
                            </td>
                            <td width="10%" align="center" style="vertical-align: middle">
                                <c:set var="gender" value="${mdto.gender}"/>
                                <c:if test="${gender eq '남성'}">
                                    <c:choose>
                                        <c:when test="${blood.redBloodCell >= 4.2 && blood.redBloodCell < 6.3}">
                                            정상
                                        </c:when>
                                        <c:when test="${blood.redBloodCell < 4.2}">
                                            감소
                                        </c:when>
                                        <c:when test="${blood.redBloodCell > 6.3}">
                                            증가
                                        </c:when>
                                        <c:otherwise>
                                            문제있음(적혈구수)
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                                <c:if test="${gender eq '여성'}">
                                    <c:choose>
                                        <c:when test="${blood.redBloodCell >= 4.0 && blood.redBloodCell < 5.4}">
                                            정상
                                        </c:when>
                                        <c:when test="${blood.redBloodCell < 4.0}">
                                            감소
                                        </c:when>
                                        <c:when test="${blood.redBloodCell > 5.4}">
                                            증가
                                        </c:when>
                                        <c:otherwise>
                                            문제있음(적혈구수)
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </td>
                            <td width="10%" align="center" style="vertical-align: middle">
                                <c:set var="gender" value="${mdto.gender}"/>
                                <c:if test="${gender eq '남성'}">
                                    <c:choose>
                                        <c:when test="${blood.redBloodCell >= 4.2 && blood.redBloodCell < 6.3}">
                                            -
                                        </c:when>
                                        <c:when test="${blood.redBloodCell < 4.2}">
                                            빈혈 의심
                                        </c:when>
                                        <c:when test="${blood.redBloodCell > 6.3}">
                                            적혈구 증가증 의심
                                        </c:when>
                                        <c:otherwise>
                                            문제있음(적혈구수)
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                                <c:if test="${gender eq '여성'}">
                                    <c:choose>
                                        <c:when test="${blood.redBloodCell >= 4.0 && blood.redBloodCell < 5.4}">
                                            -
                                        </c:when>
                                        <c:when test="${blood.redBloodCell < 4.0}">
                                            빈혈 의심
                                        </c:when>
                                        <c:when test="${blood.redBloodCell > 5.4}">
                                            적혈구 증가증 의심
                                        </c:when>
                                        <c:otherwise>
                                            문제있음(적혈구수)
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td width="10%" style="vertical-align: middle">백혈구 수(10^3/㎣)</td>
                            <td width="10%">${blood.whiteBloodCell}</td>
                            <td width="10%" align="center" style="vertical-align: middle">
                                4.0(10^3/㎣) 이상<br>
                                4.0(10^3/㎣) 이하
                            </td>
                            <td width="10%" align="center" style="vertical-align: middle">
                                <c:choose>
                                    <c:when test="${blood.whiteBloodCell >= 4.0 && blood.whiteBloodCell <= 10.0}">
                                        정상
                                    </c:when>
                                    <c:when test="${blood.whiteBloodCell < 4.0}">
                                        감소
                                    </c:when>
                                    <c:when test="${blood.whiteBloodCell > 10.0}">
                                        증가
                                    </c:when>
                                    <c:otherwise>
                                        문제있음(백혈구)
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td width="10%" align="center" style="vertical-align: middle">
                                <c:choose>
                                    <c:when test="${blood.whiteBloodCell >= 4.0 && blood.whiteBloodCell <= 10.0}">
                                        -
                                    </c:when>
                                    <c:when test="${blood.whiteBloodCell < 4.0}">
                                        재생불량성 빈혈, 방사선 조사, 비장의 기능 항진 등 의심
                                    </c:when>
                                    <c:when test="${blood.whiteBloodCell > 10.0}">
                                        백혈병, 골수 증식성 질환, 감염증, 악성 종양의 전이, 감염증, 자가면역성 질환,
                                        골수 증식성 질환, 약물 사용(특히 corticosteroids), 용혈성 빈혈, 수혈 직후, 알러지 등 의심
                                    </c:when>
                                    <c:otherwise>
                                        문제있음(백혈구)
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td width="10%" style="vertical-align: middle">혈소판 수(10^3/㎣)
                            </th>
                            <td width="10%" style="vertical-align: middle">${blood.bloodPlatelet}</td>
                            <td width="10%" align="center" style="vertical-align: middle">
                                130(10^3/㎣)이상<br>
                                350(10^3/㎣)미만
                            </td>
                            <td width="10%" align="center" style="vertical-align: middle">
                                <c:choose>
                                    <c:when test="${blood.bloodPlatelet >= 130 && blood.bloodPlatelet <= 350}">
                                        정상
                                    </c:when>
                                    <c:when test="${blood.bloodPlatelet < 130}">
                                        감소
                                    </c:when>
                                    <c:when test="${blood.bloodPlatelet > 350}">
                                        증가
                                    </c:when>
                                    <c:otherwise>
                                        <p>문제있음(혈소판)</p>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td width="10%" align="center" style="vertical-align: middle">
                                <c:choose>
                                    <c:when test="${blood.bloodPlatelet >= 130 && blood.bloodPlatelet <= 350}">
                                        -
                                    </c:when>
                                    <c:when test="${blood.bloodPlatelet < 130}">
                                        재생불량성 빈혈, 방사성 노출 후, 백혈병, 암의 전이, 골수 섬유증, 다발성 골수종,
                                        거대 적아구성 빈혈, 특발성 혈소판 감소성 자반증(ITP), 전신성 홍반성 낭창(SLE)
                                        악성 림프종, 만성 림프구성 백혈병, 미만성 혈관내 응고(DIC), 패혈증 등 의심
                                    </c:when>
                                    <c:when test="${blood.bloodPlatelet > 350}">
                                        골수 증식성 질환, 원발성 혈소판 증가증, 진성 다혈증, 만성 과립구성 백혈병 등 의심
                                    </c:when>
                                    <c:otherwise>
                                        <p>문제있음(혈소판)</p>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td width="10%" style="vertical-align: middle">혈색소(10^3/㎣)</td>
                            <td width="10%" style="vertical-align: middle">${blood.liverFunction}</td>
                            <td width="10%" align="center" style="vertical-align: middle">
                                13.0(10^3/㎣) 이상
                                17.0(10^3/㎣) 미만
                            </td>
                            <td width="10%" align="center" style="vertical-align: middle">
                                <c:if test="${gender eq '남성'}">
                                    <c:choose>
                                        <c:when test="${blood.liverFunction >= 13.0 && blood.liverFunction < 17.0}">
                                            정상
                                        </c:when>
                                        <c:when test="${blood.liverFunction < 13.0}">
                                            감소
                                        </c:when>
                                        <c:when test="${blood.liverFunction > 17.0}">
                                            증가
                                        </c:when>
                                        <c:otherwise>
                                            문제있음(혈색소)
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                                <c:if test="${gender eq '여성'}">
                                    <c:choose>
                                        <c:when test="${blood.liverFunction > 12.0 && blood.liverFunction < 16.0}">
                                            정상
                                        </c:when>
                                        <c:when test="${blood.liverFunction < 12.0}">
                                            감소
                                        </c:when>
                                        <c:when test="${blood.liverFunction > 16.0}">
                                            증가
                                        </c:when>
                                        <c:otherwise>
                                            문제있음(혈색소)
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </td>
                            <td width="10%" align="center" style="vertical-align: middle">
                                <c:if test="${gender eq '남성'}">
                                    <c:choose>
                                        <c:when test="${blood.liverFunction >= 13.0 && blood.liverFunction < 17.0}">
                                            정상
                                        </c:when>
                                        <c:when test="${blood.liverFunction < 13.0}">
                                            중증 철결핍성 빈혈, 재생 불량성 빈혈, 호흡곤란, 오심, 구토, 발열 등 의심
                                        </c:when>
                                        <c:when test="${blood.liverFunction > 17.0}">
                                            위성 다혈증(stress, 다혈증, 탈수 등),
                                            진성 다혈증(고지대 거주자, 만성 순환장애, 만성 호흡장애 등) 등 의심
                                        </c:when>
                                        <c:otherwise>
                                            문제있음(혈색소)
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                                <c:if test="${gender eq '여성'}">
                                    <c:choose>
                                        <c:when test="${blood.liverFunction > 12.0 && blood.liverFunction < 16.0}">
                                            정상
                                        </c:when>
                                        <c:when test="${blood.liverFunction < 12.0}">
                                            중증 철결핍성 빈혈, 재생 불량성 빈혈, 임신, 호흡곤란, 오심, 구토, 발열 등 의심
                                        </c:when>
                                        <c:when test="${blood.liverFunction > 16.0}">
                                            위성 다혈증(stress, 다혈증, 탈수 등)<br>
                                            진성 다혈증(고지대 거주자, 만성 순환장애, 만성 호흡장애 등) 등 의심
                                        </c:when>
                                        <c:otherwise>
                                            문제있음(혈색소)
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td width="10%">혈당(mg/dL)</td>
                            <td width="10%">${blood.bloodGlucose}</td>
                            <td width="10%" align="center" style="vertical-align: middle">
                                126mg/dL 정상
                            </td>
                            <td width="10%" align="center" style="vertical-align: middle">
                                <c:choose>
                                    <c:when test="${blood.bloodGlucose >= 100 && blood.bloodGlucose <= 125}">
                                        감소
                                    </c:when>
                                    <c:when test="${blood.bloodGlucose < 126}">
                                        정상
                                    </c:when>
                                    <c:when test="${blood.bloodPlatelet >= 126}">
                                        증가
                                    </c:when>
                                    <c:otherwise>
                                        문제있음(혈당)
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td width="10%" align="center" style="vertical-align: middle">
                                <c:choose>
                                    <c:when test="${blood.bloodGlucose >= 100 && blood.bloodGlucose <= 125}">
                                        공복혈당장애 의심
                                    </c:when>
                                    <c:when test="${blood.bloodGlucose < 126}">
                                        -
                                    </c:when>
                                    <c:when test="${blood.bloodPlatelet >= 126}">
                                        당뇨병 의심
                                    </c:when>
                                    <c:otherwise>
                                        문제있음(혈당)
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>

                        <!-- 소변검사  -->
                        <tr>
                            <td rowspan="3" align="center" style="vertical-align: middle">소변검사</td>
                            <td width="10%">요단백(mg/dL)</td>
                            <td width="10%">${urine.urineProtein}</td>
                            <td width="10%" align="center" style="vertical-align: middle"> 10mg/dL 이하</td>
                            <td width="10%" align="center" style="vertical-align: middle">
                                <c:choose>
                                    <c:when test="${urine.urineProtein <= 10}">
                                        음성
                                    </c:when>
                                    <c:when test="${urine.urineProtein > 10}">
                                        양성
                                    </c:when>
                                    <c:otherwise>
                                        문제있음(요단백)
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td width="10%" align="center" style="vertical-align: middle">
                                <c:choose>
                                    <c:when test="${urine.urineProtein <= 10}">
                                        -
                                    </c:when>
                                    <c:when test="${urine.urineProtein > 10}">
                                        요로 감염증, 방광염, 신장염, 신증후군, 신장 경화증, 임신 중독증 등 의심
                                    </c:when>
                                    <c:otherwise>
                                        문제있음(요단백)
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td width="10%" style="vertical-align: middle">요산(mg/dL)</td>
                            <td width="10%">${urine.urineAcid}</td>
                            <td width="10%" align="center" style="vertical-align: middle">
                                250mg/dL 이상
                                750mg/dL 이하
                            </td>
                            <td width="10%" align="center" style="vertical-align: middle">
                                <c:choose>
                                    <c:when test="${urine.urineAcid >= 250 && urine.urineAcid <= 750 }">
                                        정상
                                    </c:when>
                                    <c:when test="${urine.urineAcid < 250}">
                                        낮음
                                    </c:when>
                                    <c:when test="${urine.urineAcid > 750 }">
                                        높음
                                    </c:when>
                                    <c:otherwise>
                                        문제있음(요산)
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td width="10%" align="center" style="vertical-align: middle">-</td>
                        </tr>
                        <tr>
                            <td width="10%" style="vertical-align: middle">요당(mg/dL)</td>
                            <td width="10%">${urine.urineGlucose}</td>
                            <td width="10%" align="center" style="vertical-align: middle">
                                30mg/dL 이하
                            </td>
                            <td width="10%" align="center" style="vertical-align: middle">
                                <c:choose>
                                    <c:when test="${urine.urineGlucose <= 30}">
                                        음성
                                    </c:when>
                                    <c:when test="${urine.urineGlucose > 30}">
                                        양성
                                    </c:when>
                                    <c:otherwise>
                                        문제있음(요산)
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td width="10%" align="center" style="vertical-align: middle">
                                <c:choose>
                                    <c:when test="${urine.urineGlucose < 30}">
                                        -
                                    </c:when>
                                    <c:when test="${urine.urineGlucose > 30}">
                                        당뇨병, 저혈당증 및 각종 내분비질환 등 의심
                                    </c:when>
                                    <c:otherwise>
                                        문제있음(요산)
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </table>
                </div>

                <hr class="featurette-divider">
                <table class="table table-hover">
                    <h5>이전 검사 내역</h5>
                    <tr class="info">
                        <th class="text-center">번호</th>
                        <th class="text-center">예약번호</th>
                        <th class="text-center">이름</th>
                        <th class="text-center">검진날짜</th>
                    </tr>

                    <c:forEach var="dto" items="${list}">
                        <tr>
                            <td align="center">${dto.memberNo}</td>
                            <td align="center">${dto.reserveNo}</td>
                            <td align="center"><a
                                    href="customerDetail1?reserveNo=${dto.reserveNo}&memberNo=${dto.memberNo}">${dto.name}</a>
                            </td>
                            <td align="center">${dto.reserveDate}</td>
                        </tr>
                    </c:forEach>

                    <tr>
                        <c:if test="${paging.startPage != 0 && paging.endPage != 0 }">
                            <td colspan="4" align="center">
                                <!-- 페이징 처리 -->
                                <!-- 이전버튼 활성화 여부 -->
                                <c:if test="${paging.startPage > 10}">
                                    <a href="/doctor/customerDetail1?pageNum=${paging.prev}&reserveNo=${mdto.reserveNo}&memberNo=${mdto.memberNo}">[이전]</a>
                                </c:if>

                                <!-- 페이지번호 처리 -->
                                <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
                                    <a href="/doctor/customerDetail1?pageNum=${num}&reserveNo=${mdto.reserveNo}&memberNo=${mdto.memberNo}">${num}</a>
                                </c:forEach>
                                    ${num}
                                <c:if test="${paging.endPage < paging.pageCount}">
                                    <a href="/doctor/customerDetail1?pageNum=${paging.next}&reserveNo=${mdto.reserveNo}&memberNo=${mdto.memberNo}">[다음]</a>
                                </c:if>
                            </td>
                        </c:if>
                        <c:if test="${paging.startPage == 0 && paging.endPage == 0 }">
                        </c:if>
                    </tr>
                </table>
            </div>
            <hr>
            <!-- 테이블 내용 끝 -->
            <%@include file="/WEB-INF/views/common/footer.jsp" %>
        </div>
    </main>
    <!-- page-content -->
</div>
</body>
</html>