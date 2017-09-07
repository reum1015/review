<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
 
 <!-- main css -->
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css"/>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/eachMain.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/login_main.css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/validate/jquery.validate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/validate/additional-methods.min.js"></script>

<script type="text/javascript">
$(function() {
	
	// 유효성 검사 추가 함수
	$.validator.addMethod( "engspace", function( value, element ) {
		return this.optional( element ) || /^[a-zA-Z\s]*$/i.test( value );
	});
		
	$.validator.addMethod( "nick", function( value, element ) {
		return this.optional( element ) || /^[a-z0-9_.-]*$/i.test( value );
	});
	
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
			
			// 필수 입력 + 한글 입력
			name: {
				required: true,
				engspace: true
			},
			nick_name: {
				required: true,
				nick: true,
				minlength: 3,
				maxlength: 20
			},
			// 필수 입력 + 한글 입력
			age: {
				required: true,
				digits: true
			},		
			// 필수 입력
			
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
			name: {
				required: "Username field is required.",
				engspace: "Usernames can only use letters."				
			},
			nick_name: {
				required: "Nickname field is required.",
				nick: "Nicknames can only use letters, number, '.', '_', '-', without space",
				minlength: "Create a nickname at least 3 characters long.",
				maxlength: "Create a nickname at most 20 characters long."
			},
			
			age: {
				required: "age field is required.",
				digits: "please enter a valid number."
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
		<!-- introduce -->
		<div class="login_intro col-lg-7 col-md-7 col-sm-7 hidden-xs">
			<a class="login_img" href="#">
	<img alt="signup" src="${pageContext.request.contextPath}/assets/imgs/img/login.png"
	height="400px" width="100%" />
	</a>
				</div>
		<!--// introduce -->		
				
		<!-- SignUp -->
	<div class="sign_up_form">
		<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">		
				<fieldset>
						<legend>Review&amp;Bang</legend>
						
			<form class="form-horizontal" name="sign_up_form" method="post" id="myform"
      action="${pageContext.request.contextPath}/member/sign_up_ok">
			<div class="form-groups">
			<input type="email" id="email" name="email" class="form-control" placeholder="email" autofocus />
			</div>
				<br />			
				<div class="form-groups">
					<input type="text" id="name" name="name" class="form-control"
							placeholder="Full Name" />
			  </div>					  
				<br />						
				<div class="form-groups">
					<input type="text" id="nick_name" name="nick_name" class="form-control"  
							 placeholder="Nickname" />					 
			  </div>					  
			  <br />
				<div class="form-groups">
					<input type="password" id="user_pw" name="user_pw"
							class="form-control" placeholder="Password" />
			  </div>
				<br />					
				<div class="form-groups-age">
				 <input type="text" id="age" name="age" class="form-control" 
					  placeholder="age" /> 
			  </div>					 
				<br />				
				<div class="form-groups">								
						<div class="btn-group btn-group-justified" role="group" aria-label="${pageContext.request.contextPath}.">
							  <div class="btn-group" role="group">
							  <label class="btn btn-link gender">
							  <input type="radio" name="gender" value="M" /><span>M</span></label>							  
							  </div>
							  <div class="btn-group" role="group">
							  <label class="btn btn-link gender">
							  <input type="radio" name="gender" value="F" /><span>F</span></label>		
							  </div>
							  <div class="btn-group" role="group">
							  <label class="btn btn-link gender">
							  <input type="radio" name="gender" value="Others" /><span>Others</span></label>		
							  </div>									  
							</div>								
						  </div>
						  <br />										
	                 <div class="btn_sign_up" >
						<button type="submit" class="btn btn-warning btn-block">Sign Up</button>							
                     </div>
                     <p>By signing up, you agree to the 
                     <a href="${pageContext.request.contextPath}/legal/Privacy">Privacy Policy</a>&amp; 
	                <a href="${pageContext.request.contextPath}/legal/Terms">Terms of Service.</a>
	                </p> 
                     </form>		
					</fieldset>
				
			
		</div>
		</div>
		<!--// Sign UP -->
		
					
		</div>
		<!-- 메인 화면 끝 -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	
	
</body>
</html>