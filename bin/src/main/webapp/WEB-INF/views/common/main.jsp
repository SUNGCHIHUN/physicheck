<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main</title>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
    </script>
</head>
<body>
<div class="wrapper">
    <!-- laftbar start -->
    <%@include file="/WEB-INF/views/common/leftbar.jsp" %>
    <!-- laftbar end -->

    <!-- Page Content start  -->
    <div id="content">

        <!-- header start -->
        <%@include file="/WEB-INF/views/common/header.jsp" %>
        <!-- hader end -->

        <!-- slider start -->
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="${path}/resources/images/test1.png" style="width:100%; height:500px;">
                    <div class="container">
                        <div class="carousel-caption text-left">
                            <h1>오시는길 안내</h1>
                            <p><a class="btn btn-lg btn-primary" href="/comingWay">오시는길</a></p>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="${path}/resources/images/test2.png" style="width:100%; height:500px;">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>우리는 이런 검사를 합니다.</h1>
                            <span style="margin-bottom: 0px">운동선수및 운동을 취미로 하는 사람들이 운동처방사에게 검사를 받아</span>
                            <span style="margin-bottom: 10px">개인의 몸상태에 맞춘 운동처방을 받을수 있게 한다.</span><br>
                            <a class="btn btn-lg btn-primary" href="/basicCheckup">기초검사 안내</a>
                            <a class="btn btn-lg btn-primary" href="/physicalCheckup">운동검사 안내</a>
                            <a class="btn btn-lg btn-primary" href="/mentalCheckup">심리검사 안내</a>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="${path}/resources/images/test3.png" style="width:100%; height:500px;">
                    <div class="container">
                        <div class="carousel-caption text-right">
                            <h1>맞춤형 식사요법</h1>
                            <span style="margin-bottom: 10px">개인의 지병에 맞춰 식사요법을 안내해 드립니다.</span>
                            <p style="color: #fff; font-weight: 600;"><a class="btn btn-lg btn-primary" href="/customer/dietList">식사요법 안내</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-target="#myCarousel" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-target="#myCarousel" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </button>
        </div>

        <hr class="featurette-divider">
        <!-- slider end -->
        <!-- footer start -->
        <%@include file="/WEB-INF/views/common/footer.jsp" %>
        <!-- footer end -->

    </div>
</div>
</div>

</body>
</body>
</html>