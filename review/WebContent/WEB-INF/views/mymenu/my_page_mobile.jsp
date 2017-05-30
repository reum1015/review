<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/mypage.css" />

<style type="text/css">
  
</style>

</head>
<body>
	  <jsp:include page="/WEB-INF/views/template/topbar.jsp"/>
  <jsp:include page="/WEB-INF/views/template/bottombar.jsp"/>
  

	<!-- 메인 화면 시작 -->
	<div class="container">
	<div class="container_mypage">
		<div class="profile_img">
		<div class="topmenu-user col-lg-5col-md-5 col-sm-5 col-xs-5">
		  <a class="navbar-brand" href="#">
		     <!--  프로필 이미지 표시 -->
		     
		     <!--//  프로필 이미지 표시 끝-->		      		   
		   </a>
		  </div>
		</div>
		<!-- setting -->
	<div class="topmenu-user pull-right col-lg-1 col-md-1 hidden-sm hidden-xs">
	  <a class="navbar-brand glyphicon glyphicon-cog" href="${pageContext.request.contextPath}/mymenu/account_info" style="font-size: 1.5em;"></a>
	  </div>
		  <!--// setting -->
		<!-- page header -->
		<div class="profile_part">
		 ${loginInfo.nick_name}		 
		
		</div>
		<!--// page header -->
		
		<!-- page menu bar -->
		<div class="breadcrumb btn-group btn-block">
				<a href="${pageContext.request.contextPath}/mymenu/my_page" class="col-lg-4 col-md-4 col-sm-4 col-xs-4 btn btn-white btn-large"><i class="glyphicon glyphicon-th-large" style="font-size: 1.5em;"></i></a>
				<a href="${pageContext.request.contextPath}/mymenu/my_page2" class="col-lg-4 col-md-4 col-sm-4 col-xs-4 btn btn-white btn-large"><i class="glyphicon glyphicon-th-list" style="font-size: 1.5em;"></i></a>
				<a href="#" class="col-lg-4 col-md-4 col-sm-4 col-xs-4 btn btn-white btn-large"><i class="glyphicon glyphicon-bookmark" style="font-size: 1.5em;"></i></a>
		</div>
		
		<!--// page menu bar -->
				
					
		</div>
	</div>

	<!-- 메인 화면 끝 -->

	<!-- footer -->
	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	<!--// footer -->
	
	
	

</body>
</html>