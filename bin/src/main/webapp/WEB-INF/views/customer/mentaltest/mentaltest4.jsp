<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table</title>


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
	      
      	$(function() {
    		var EndText = "입력하세요.";
    		$("#btnInsert").click(function(){

    			if($("input[name=q1]").is(":checked")){
    			}else{
    				alert("1번문항 "+EndText);
    				return false;
    			}
    			
    			if($("input[name=q2]").is(":checked")){
    			}else{
    				alert("2번문항 "+EndText);
    				return false;
    			}
    			
    			if($("input[name=q3]").is(":checked")){
    			}else{
    				alert("3번문항 "+EndText);
    				return false;
    			}
    			
    			if($("input[name=q4]").is(":checked")){
    			}else{
    				alert("4번문항 "+EndText);
    				return false;
    			}
    			
    			if($("input[name=q5]").is(":checked")){
    			}else{
    				alert("5번문항 "+EndText);
    				return false;
    			}
				document.mentalInsert4.submit(); /* action에서 지정한 페이지로 이동 */
    		});
    	});
	</script>    
<style>
	th{
		margin:10px;
		height:40px;
	}
	td{
		width:20%;
		height:30px;
		text-align:center;
	}
	.color{
		background-color:#e9ecef;
	}
	#long_button{
		font-size:22px;
		padding:0px 50px;
		margin:20px;
	}
</style>    
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
			
	        <!-- 내용 시작 -->
	        <div class="jumbotron">
				<div class="container">
					<h3 class="display-4">심리검사</h3>
				</div>
			</div>
	
			<div class="container">
				<div class="row">
					<table width="100%">
						<tr>
							<td align="left">
								<div class="input-group sm-3">
									<div class="container">
										<h4>심리검사</h4>
									</div><!-- h#보다 class에 따라 사이즈가 변함,  class="display-5" -->
								</div>
							</td>
						</tr>
					</table>
				</div>
				<!-- 테이블 내용 시작 -->					
				<div style="padding-top: 50px">
				
		 		<form action="/customer/mental_4Action?survey3No=${dto.survey3No}" name="mentalInsert4" method="post">
		 			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<table border="1" align="center" width="800px"><!--  class="table table-hover" -->
						
						<tr class="info">
							<th class="color" colspan="6">상황4. 시합출전 상황</th><!-- 이전 클래스 class="text-center" -->
						</tr>
						<tr>
							<th colspan="6">
								자신이 시합에서 그 동작을 수행한다고 상상해 보자.<br>
								이번에는 그 동작을 매우 능숙하게 해낸다. <br>
								관중과 동료가 잘 했다고 환호를 한다.<br>
								약 1분간 눈을 감고 이 상황을 가능한 선명하게 상상해보자.
							</th>
						</tr>
						
						<tr>
							<th colspan="6" class="color">문항 1) 이 상황에 처한 자신의 모습이 잘 보였는가?</th>
						</tr>
						<tr>
							<td class="text-center">매우 그렇지 않다</td>
							<td class="text-center">그렇지 않다</td>
							<td class="text-center">보통</td>
							<td class="text-center">그렇다</td>
							<td class="text-center">매우 그렇다</td>
						</tr>
						<tr class="color">
							<td class="text-center">1</td>
							<td class="text-center">2</td>
							<td class="text-center">3</td>
							<td class="text-center">4</td>
							<td class="text-center">5</td>
						</tr>
						<tr>
							<td class="text-center"><input type="radio" id="q1" name="q1" value="1" required></td>
							<td class="text-center"><input type="radio" id="q1" name="q1" value="2" required></td>
							<td class="text-center"><input type="radio" id="q1" name="q1" value="3" required></td>
							<td class="text-center"><input type="radio" id="q1" name="q1" value="4" required></td>
							<td class="text-center"><input type="radio" id="q1" name="q1" value="5" required></td>
						</tr>	
						
						
						<tr>
							<th colspan="6" class="color">문항 2) 이 상황에서 소리는 잘 들렸는가?</th>
						</tr>
						<tr>
							<td class="text-center">매우 그렇지 않다</td>
							<td class="text-center">그렇지 않다</td>
							<td class="text-center">보통</td>
							<td class="text-center">그렇다</td>
							<td class="text-center">매우 그렇다</td>
						</tr>
						<tr class="color">
							<td class="text-center">1</td>
							<td class="text-center">2</td>
							<td class="text-center">3</td>
							<td class="text-center">4</td>
							<td class="text-center">5</td>
						</tr>
						<tr>
							<td class="text-center"><input type="radio" id="q2" name="q2" value="1" required></td>
							<td class="text-center"><input type="radio" id="q2" name="q2" value="2" required></td>
							<td class="text-center"><input type="radio" id="q2" name="q2" value="3" required></td>
							<td class="text-center"><input type="radio" id="q2" name="q2" value="4" required></td>
							<td class="text-center"><input type="radio" id="q2" name="q2" value="5" required></td>
						</tr>	
						
						
						
						<tr>
							<th colspan="6" class="color">문항 3) 동작을 수행하는 느낌이 잘 느껴졌는가?</th>
						</tr>
						<tr>
							<td class="text-center">매우 그렇지 않다</td>
							<td class="text-center">그렇지 않다</td>
							<td class="text-center">보통</td>
							<td class="text-center">그렇다</td>
							<td class="text-center">매우 그렇다</td>
						</tr>

						<tr class="color">
							<td class="text-center">1</td>
							<td class="text-center">2</td>
							<td class="text-center">3</td>
							<td class="text-center">4</td>
							<td class="text-center">5</td>
						</tr>
						<tr>
							<td class="text-center"><input type="radio" id="q3" name="q3" value="1" required></td>
							<td class="text-center"><input type="radio" id="q3" name="q3" value="2" required></td>
							<td class="text-center"><input type="radio" id="q3" name="q3" value="3" required></td>
							<td class="text-center"><input type="radio" id="q3" name="q3" value="4" required></td>
							<td class="text-center"><input type="radio" id="q3" name="q3" value="5" required></td>
						</tr>	
						
						
						
						<tr>
							<th colspan="6" class="color">문항 4) 이 상황에서 기분상태가 잘 느껴졌는가?</th>
						</tr>
						<tr>
							<td class="text-center">매우 그렇지 않다</td>
							<td class="text-center">그렇지 않다</td>
							<td class="text-center">보통</td>
							<td class="text-center">그렇다</td>
							<td class="text-center">매우 그렇다</td>
						</tr>
						<tr class="color">
							<td class="text-center">1</td>
							<td class="text-center">2</td>
							<td class="text-center">3</td>
							<td class="text-center">4</td>
							<td class="text-center">5</td>
						</tr>
						<tr>
							<td class="text-center"><input type="radio" id="q4" name="q4" value="1"></td>
							<td class="text-center"><input type="radio" id="q4" name="q4" value="2"></td>
							<td class="text-center"><input type="radio" id="q4" name="q4" value="3"></td>
							<td class="text-center"><input type="radio" id="q4" name="q4" value="4"></td>
							<td class="text-center"><input type="radio" id="q4" name="q4" value="5"></td>
						</tr>															
		
		
						<tr>
						<th colspan="6" class="color">문항 5) 이미지를 잘 조절할 수 있었는가?</th>
						</tr>
						<tr>
							<td class="text-center">매우 그렇지 않다</td>
							<td class="text-center">그렇지 않다</td>
							<td class="text-center">보통</td>
							<td class="text-center">그렇다</td>
							<td class="text-center">매우 그렇다</td>
						</tr>
						<tr class="color">
							<td class="text-center">1</td>
							<td class="text-center">2</td>
							<td class="text-center">3</td>
							<td class="text-center">4</td>
							<td class="text-center">5</td>
						</tr>
						<tr>
							<td class="text-center"><input type="radio" id="q5" name="q5" value="1"></td>
							<td class="text-center"><input type="radio" id="q5" name="q5" value="2"></td>
							<td class="text-center"><input type="radio" id="q5" name="q5" value="3"></td>
							<td class="text-center"><input type="radio" id="q5" name="q5" value="4"></td>
							<td class="text-center"><input type="radio" id="q5" name="q5" value="5"></td>
						</tr>
						
						<tr>
							<td colspan="6" align="center">
								<input type="button" class="long_button" value="제출" id="btnInsert">
							</td>
						</tr>
			
					</table>
					</form>
				</div>
				<!-- 테이블 내용 끝 -->
			</div> <!-- ./container -->
		    <!-- 내용 끝 -->
		     
     		<hr class="featurette-divider">
     		
     		 <!-- footer start -->	
		      <%@include file = "/WEB-INF/views/common/footer.jsp" %>
			<!-- footer end -->	
     
        </div>
    </div>

</body>
</body>
</html>