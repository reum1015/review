<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
 
 <!-- main css -->
 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/login_main_mobile.css" />

<style type="text/css">

</style>

</head>
<body>
	  <jsp:include page="/WEB-INF/views/template/topbar.jsp"/>
  
  

	<!-- 메인 화면 시작 -->
	
		<div class="container">	
		<div class="container_sgin">	
		        <!-- introduce -->
				<div class="login_intro col-lg-7 col-md-7 col-sm-7 hidden-xs">
			<a class="login_img" href="#">
	<img alt="main" src="${pageContext.request.contextPath}/assets/imgs/img/login.png"
	height="480px" width="100%" />
	</a>
				</div>
			<!--// introduce -->	
			
				<!-- Login -->
	<div class="login_form" style="min-height: 420px">
		<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">										
			
					<fieldset>
						<legend>Review&Bang</legend>
          <form name="form" method="post" action="${pageContext.request.contextPath}/member/login_ok">
						<div class="form-groups">
							<input type="email" id="email" name="email" class="form-control" placeholder="email" autofocus>
						</div>
						<br />						
						<div class="form-groups">
							<input type="password" id="user_pw" name="user_pw" class="form-control" placeholder="password" />
						</div>
						<a href="${pageContext.request.contextPath}/member/forgot_pw">Forgot password?</a>
						<br />
						<br />
						<div class="btn_login">
						<button type="submit" class=" btn-primary btn-lg btn-block">Log in</button>
						</div>
						<br>
					<div class="login_button" style="text-align: center; width: 100%;">					
						<ol class="list-inline">							
							<li>Don't have an account?</li>							
							<li><a href="${pageContext.request.contextPath}/member/sign_up_mobile">Sign Up</a></li>
						</ol>						
					</div>
					</form>
					</fieldset>
				
			</div>
				</div>
				<!--// Login -->
				</div>
		</div>
		<!-- 메인 화면 끝 -->
	


	

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	
	
</body>
</html>