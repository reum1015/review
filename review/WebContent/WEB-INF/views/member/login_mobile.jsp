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
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/validate/jquery.validate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/validate/additional-methods.min.js"></script>

<script type="text/javascript">
$(function() {
		
	$.validator.addMethod( "pwd", function( value, element ) {
		return this.optional(element) ||  /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{3,25}$/i.test(value);
	});
	
	// form태그에 부여한 id속성에 대한 유효성 검사 함수 호출
	$("#myform").validate({
		/** 입력검사 규칙 */
		rules: {
			// 필수입력 + 이메일 형식 일치 필요
			email: {
				required: true,
				email: true
			},			
			// 필수입력 + 글자수 길이 제한
			user_pw: {
				required: true,
				pwd: true,
				minlength: 6,
				maxlength: 25
			},
			
			
			
		},
		/** 규칙이 맞지 않을 경우의 메시지 */
		messages: {
			email: {
				required: "email field is required.",
				email: "Enter a valid email address."
			},			
			user_pw: {
				required: "password field is required.",	
				pwd: "This password is too easy to guess. Please create a new one. ",
				minlength: "Create a password at least 6 characters long.",
				maxlength: "Create a password at most 25 characters long."
			},			
								
		}
	}); // end validate()
});
</script>
</head>
<body>
	  <jsp:include page="/WEB-INF/views/template/topbar.jsp"/>
	  <jsp:include page="/WEB-INF/views/template/bottombar.jsp"/>

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
          <form name="form" method="post" id="myform" 
          action="${pageContext.request.contextPath}/member/login_ok">
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