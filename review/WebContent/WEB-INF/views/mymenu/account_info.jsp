<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/mymenu.css" />

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
	
		
	// form태그에 부여한 id속성에 대한 유효성 검사 함수 호출
	$("#myform").validate({
		/** 입력검사 규칙 */
		rules: {
			// 필수입력 + 이메일 형식 일치 필요
			email: {
				required: true,
				email: true
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
						
			
		},
		/** 규칙이 맞지 않을 경우의 메시지 */
		messages: {
			email: {
				required: "email field is required.",
				email: "Enter a valid email address."
			},			
				
			name: {
				required: "Username field is required.",
				engspace: "Usernames can only use letters."				
			},
			nick_name: {
				required: "Nickname field is required.",
				nick: "Nicknames can only use letters, number, '-', '_', '.'  ",
				minlength: "Create a nickname at least 3 characters long.",
				maxlength: "Create a nickname at most 20 characters long."
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
	<div class="container_edit">
		<!-- 왼쪽 정보편집부분 -->
		<div class="account_basic col-lg-3 col-md-3 hidden-sm hidden-xs">
		   	<div class="btn btn-link">
		   	<a href="${pageContext.request.contextPath}/mymenu/account_info"><font size="4" color="#2E2EFE">Account Info</font></a>
		   	</div>
		   	<br  />
		   	<div class="btn btn-link edit">
		   	<a href="${pageContext.request.contextPath}/mymenu/edit_profile"><font size="4" color="#2E2EFE">Edit Profile</font></a>
		   	</div>
		   	<br  />
		   	  	<div class="btn btn-link edit">
		   	<a href="${pageContext.request.contextPath}/mymenu/edit_pic?member_id=${loginInfo.id}"><font size="4" color="#2E2EFE">Change Picture</font></a>
		   	</div>
		   	<br  />
		   	<div class="btn btn-link edit">
		   	<a href="${pageContext.request.contextPath}/mymenu/log_out"><font size="4" color="#2E2EFE">Log out</font></a>
		   	</div>
		   	<br  />		    	  
		</div>
		<!--// 왼쪽 정보편집부분 -->
			<!-- Account info-->	
		<div class="edit_form col-lg-offset-1 col-lg-5 col-md-offset-1 col-md-5 col-sm-12 col-xs-12">		
				<fieldset>
						<legend>Account Info</legend>						
		<form class="form-horizontal" name="sign_up_form" method="post" id="myform"
      action="${pageContext.request.contextPath}/mymenu/account_info_ok">
			<div class="form-groups">
			<label for="email" class="pull-left">email</label>
			<input type="email" id="email" name="email" class="form-control" value="${loginInfo.email}" />
			</div>				
			  			
				<div class="form-groups">
				<label for="nick_name" class="pull-left">nickname</label>
					<input type="text" id="nick_name" name="nick_name" class="form-control"  
							 value="${loginInfo.nick_name}" />					 
			  </div>
			  <div class="form-groups">
				<label for="name" class="pull-left">name</label>
					<input type="text" id="name" name="name" class="form-control"
							value="${loginInfo.name}" />
			  </div>	
			  
				<label for="password" class="pull-left">password</label>
				<br />
			  	    <div class="btn btn-info form-groups form-control">			  	    
		        	<a href="${pageContext.request.contextPath}/mymenu/change_pw"><font size="4" color="#fff">Change Password</font></a>
		           	</div>  
			  	<br />
			  	<br />
			  	<br />	
			  	<br />
			  					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">               
               <button type="button" class="btn btn-danger form-control" onclick="history.back();">Cancel</button>
               </div>  				  									
	                 <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" >
	                 
						<button type="submit" class="btn btn-warning btn-block">Save Setting</button>							
                     </div>
                     </form>		
					</fieldset>
				
			</div>		
		<!--//  Account info -->				
		</div>
	</div>

	<!-- 메인 화면 끝 -->

	<!-- footer -->
	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	<!--// footer -->
	
	
	

</body>
</html>