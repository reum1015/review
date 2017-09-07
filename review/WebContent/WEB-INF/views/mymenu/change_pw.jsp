<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/mymenu.css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/validate/jquery.validate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/validate/additional-methods.min.js"></script>

<style type="text/css">
.cancel {
background-color: #585858;
}
.ok {
background-color: #FF8000;
}
</style>
<script type="text/javascript">
$(function() {	
	// 유효성 검사 추가 함수	
	$.validator.addMethod( "pwd", function( value, element ) {
		return this.optional(element) ||  /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{3,25}$/i.test(value);
	});
	
	// form태그에 부여한 id속성에 대한 유효성 검사 함수 호출
	$("#myform").validate({
		/** 입력검사 규칙 */
		rules: {				
			// 필수입력 + 글자수 길이 제한
			user_pw: {
				required: true,
				pwd: true,
				minlength: 6,
				maxlength: 25
			},
			
			new_user_pw: {
				required: true,
				pwd: true,
				minlength: 6,
				maxlength: 25
			},
			new_user_pw_re: {
				required: true,
				equalTo: "#new_user_pw"
			},
		},
		/** 규칙이 맞지 않을 경우의 메시지 */
		messages: {					
			user_pw: {
				required: "password field is required.",
				pwd: "This password is too easy to guess. Please create a new one. ",
				minlength: "Create a password at least 6 characters long.",
				maxlength: "Create a password at most 25 characters long."
			},		
			new_user_pw: {
				required: "New password field is required.",
				pwd: "This new  password is too easy to guess. Please create a new one. ",
				minlength: "Create a new password at least 6 characters long.",
				maxlength: "Create a new  password at most 25 characters long."
			},			
						
			new_user_pw_re: {
				required: "Confirm new password field is required.",
				equalTo: "Confirm new passwords  don’t match"
			},
		
		}
	}); // end validate()
});
</script>

</head>
<body>
	  <jsp:include page="/WEB-INF/views/template/topbar_mobile.jsp"/>
  <jsp:include page="/WEB-INF/views/template/bottombar.jsp"/>
  

	<!-- 메인 화면 시작 -->
	<div class="container col-lg-offset-1 col-lg-10 col-md-offset-1 col-md-10  col-sm-11 col-xs-12">
	<div class="container_edit">
		<!-- 왼쪽 정보편집부분 -->
		<div class="account_basic col-lg-3 col-md-3 hidden-sm hidden-xs">
		   	<div class="btn btn-link edit">
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
		   	<hr/>	
		   	<div class="btn btn-link edit">
		   	<a href="${pageContext.request.contextPath}/mymenu/log_out"><font size="4" color="#2E2EFE">Log out</font></a>
		   	</div>
		   	<br  />		    	  
		</div>
		<!--// 왼쪽 정보편집부분 -->
			<!-- Edit account-->	
		<div class="edit_form col-lg-offset-1 col-lg-6 col-md-offset-1 col-md-6 col-sm-12 col-xs-12">		
				<fieldset>
						<legend>Change Password</legend>						
			<form class="form-horizontal" name="sign_up_form" method="post" id="myform"
      action="${pageContext.request.contextPath}/mymenu/change_pw_ok">
											
				<div class="form-groups">
				<label for="gender" class="pull-left">Old Password</label>
				 <input type="password" id="user_pw" name="user_pw" class="form-control" 
					  placeholder="old password" /> 
			  </div>					 
				<br />	
				<div class="form-groups">
				<label for="gender" class="pull-left">New Password</label>
				 <input type="password" id="new_user_pw" name="new_user_pw" class="form-control" 
					  placeholder="new password" /> 
			  </div>					 
				<br />	
				<div class="form-groups">
				<label for="gender" class="pull-left"> Confirm New Password</label>
				 <input type="password" id="new_user_pw_re" name="new_user_pw_re" class="form-control" 
					  placeholder="confirm new password " /> 
			  </div>					 
				<br />	
				<br />	
				<br />				
							<div class="form-group">
             <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="text-align:justify">               
               <button type="button" class="btn cancel form-control" onclick="history.back();"><font size="4" face="Helvetica"  color="#fff">Cancel</font></button>
               </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="text-align:justify">               
               <button type="submit" class="btn ok form-control"><font size="4"  face="Arial, Helvetica, sans-serif" color="#28282"><B>Save Setting</B></font></button>
             </div>            
            </div>  				
                     </form>		
					</fieldset>
				
			</div>		
		<!--// Edit account -->	
		</div>
	</div>
	<!-- 메인 화면 끝 -->
	<!-- footer -->
		<div class="containers col-lg-offset-1 col-lg-10 col-md-offset-1 col-md-10 col-sm-10 col-xs-12" style="margin-top:20px; margin-bottom: -68px;">
		<footer id="footer" >
<div>
<p class="pull-left">
    <a href="${pageContext.request.contextPath}/legal/privacy">Privacy</a>&ensp; 
	<a href="${pageContext.request.contextPath}/legal/terms">Terms</a> &ensp;
	<a href="${pageContext.request.contextPath}/legal/feedback">Feedback</a>&ensp;
	 <c:if test="${loginInfo.member_level == 'BB'}">
	<a href="${pageContext.request.contextPath}/admin/admin_mobile">admin</a>
    	</c:if>	
</p>
<p class="pull-right"><a href="#">Back to top</a></p>
<p class="pull-left"> &copy;Review&Bang&ensp;</p>
</div>
</footer>
</div>
	<!--// footer -->	
	
	
	

</body>
</html>