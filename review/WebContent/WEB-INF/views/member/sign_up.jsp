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

<style type="text/css">

</style>

</head>
<body>
	  <jsp:include page="/WEB-INF/views/template/topbar.jsp"/>
  <jsp:include page="/WEB-INF/views/template/bottombar.jsp"/>
  

	<!-- 메인 화면 시작 -->
	
		<div class="container">	
		<!-- introduce -->
		<div class="login_intro col-lg-7 col-md-7 col-sm-7 hidden-xs">
			<a class="login_img" href="#">
	<img alt="main" src="${pageContext.request.contextPath}/assets/imgs/img/login.png"
	height="480px" width="100%" />
	</a>
				</div>
		<!--// introduce -->		
				
		<!-- SignUp -->
	<div class="sign_up_form">
		<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">		
				<fieldset>
						<legend>Review&Bang</legend>
						
			<form class="form-horizontal" name="sign_up_form" method="post"
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
							  <label class="btn btn-default gender">
							  <input type="radio" name="gender" value="M" /><span>M</span></label>							  
							  </div>
							  <div class="btn-group" role="group">
							  <label class="btn btn-default gender">
							  <input type="radio" name="gender" value="F" /><span>F</span></label>		
							  </div>
							  <div class="btn-group" role="group">
							  <label class="btn btn-default gender">
							  <input type="radio" name="gender" value="Others" /><span>Others</span></label>		
							  </div>									  
							</div>								
						  </div>
						  <br />										
	                 <div class="btn_sign_up" >
						<button type="submit" class="btn btn-warning btn-block">Sign Up</button>							
                     </div>
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