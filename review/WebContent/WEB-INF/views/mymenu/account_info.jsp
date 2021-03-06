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
	  <jsp:include page="/WEB-INF/views/template/topbar_mobile.jsp"/>
  <jsp:include page="/WEB-INF/views/template/bottombar.jsp"/>
  

	<!-- 메인 화면 시작 -->	
	<div class="container col-lg-offset-1 col-lg-10 col-md-offset-1 col-md-10  col-sm-11 col-xs-12">
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
		   	<hr/>	
		   	<div class="btn btn-link edit">
		   	<a href="${pageContext.request.contextPath}/mymenu/log_out"><font size="4" color="#2E2EFE">Log out</font></a>
		   	</div>
		   	<br  />		    	  
		</div>
		<!--// 왼쪽 정보편집부분 -->
			<!-- Account info-->	
		<div class="edit_form col-lg-offset-1 col-lg-6 col-md-offset-1 col-md-6 col-sm-12 col-xs-12">		
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
			  	<div class="form-group">
             <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="text-align:justify">              
               <button type="button" class="btn cancel form-control" onclick="history.back();"><font size="4" face="Helvetica"  color="#fff">Cancel</font></button>
               </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="text-align:justify">               
               <button type="submit" class="btn ok form-control"><font size="4"  face="Arial, Helvetica, sans-serif" color="#28282" ><B>Save Setting</B></font></button>
             </div>            
            </div>  	
                     </form>		
					</fieldset>
				
			</div>		
		<!--//  Account info -->			
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
<p class="pull-left"> &copy;Review&amp;Bang&ensp;</p>

</div>
</footer>
</div>
	<!--// footer -->			

	


	
	
	

</body>
</html>