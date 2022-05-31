<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드 결제하기</title>

<!-- css -->

<!-- js -->
<!-- 아임포트 -->
<script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<!-- pay js -->
<c:set var="totalCost" value="${param.totalCost}"/>
<c:set var="reserveNo" value="${param.reserveNo}"/>

<script type="text/javascript">
var IMP = window.IMP; 
  IMP.init('imp36928521'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
  IMP.request_pay({
    pg: "html5_inicis",
    pay_method: "card",
    merchant_uid : 'merchant_'+new Date().getTime(),
    name : 'Physicheck검진Card',
    amount : ${totalCost},
    buyer_email : 'kosmo@gmail.com',
    buyer_name : 'hong',
    buyer_tel : '010-0000-0000',
    buyer_addr : '가산디지털단지역',
    buyer_postcode : '000',
    m_redirect_url : ''
  }, function (rsp) { // callback
      if (rsp.success) {
    	  var msg = '결제가 완료되었습니다.';
         	alert("${reserveNo}");
          alert("총금액 : " + ${totalCost});
          alert(msg);
          location.href="/customer/cardAction?reserveNo=${reserveNo}&totalCost=${totalCost}";
          
      } else {
    	  var msg = '결제에 실패하였습니다.';
          rsp.error_msg;
          location.href="/customer/reserveList";
      }
  });
</script>


</head>
<body>
	 
</body>
</html>