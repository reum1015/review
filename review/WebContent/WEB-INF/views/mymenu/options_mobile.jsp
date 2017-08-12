<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/mymenu.css" />
</head>
<body>
	  <jsp:include page="/WEB-INF/views/template/topbar_mobile.jsp"/>
  <jsp:include page="/WEB-INF/views/template/bottombar.jsp"/>
  

	<!-- 메인 화면 시작 -->
	<div class="containers" style="min-height: 650px">	
	<div class="account_basic_mobile">
		<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 pull-left" >										
		<fieldset>
			<legend style="text-align: center">Options</legend>
			<label for="account" class="pull-left">Account  </label>
			<br  />			
			<form  name="form" method="post" action="${pageContext.request.contextPath}/mymenu/account_info">
			<button class="btn btn-block btn-lg btn-lblue-gray">		
			<div class="btn-text" style="text-align: left">Account Info</div>
			</button>
			</form>		
			<br  />   	
			<form  name="form" method="post" action="${pageContext.request.contextPath}/mymenu/edit_profile">
			<button class="btn btn-block btn-lblue-gray btn-lg">		
			<div class="btn-text" style="text-align: left">Edit Profile</div>
			</button>
			</form>
		   	<br  />
		   	<form  name="form" method="post" action="${pageContext.request.contextPath}/mymenu/edit_pic?member_id=${loginInfo.id}">
			<button class="btn btn-block btn-lblue-gray btn-lg">		
			<div class="btn-text" style="text-align: left">Change Picture</div>
			</button>
			</form>
		   	<br  />
		   	<br  />		  
		   	<label for="about" class="pull-left">About</label> 
		   	<br  />
		   	<form  name="form" method="post" action="${pageContext.request.contextPath}/mymenu/log_out">
			<button class="btn btn-block btn-lblue-gray btn-lg">		
			<div class="btn-text" style="text-align: left">Log Out</div>
			</button>
			</form>
		   	<br  />
			<br />	
			</fieldset>				
			</div>
			</div>
			</div>

	<!-- 메인 화면 끝 -->

	<!-- footer -->
	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	<!--// footer -->
	
	
	

</body>
</html>