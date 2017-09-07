<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style type="text/css">
.navbar-fixed-bottom {
height: 30px;
border-top: -20px;
}



</style>
<!-- 메인 헤더 -->
<!-- 내용영역 -->

<nav class="navbar navbar-default navbar-fixed-bottom hidden-lg hidden-md" role="navigation">
		<div class="containers">		
	<c:choose>
<c:when test="${loginInfo == null }">
  <!-- not login bottom_bar -->	
 <div class="bottommenu-login hidden-lg col-md-12 col-sm-12 col-xs-12" style="margin-top:15px;">	
		<a class="bottommenu-sign col-md-4 col-sm-offset-3 col-sm-4 col-xs-offset-2 col-xs-5" style="font-size: 1.2em;" href="${pageContext.request.contextPath}/member/sign_up_mobile"><span class="glyphicon glyphicon-user"></span> Sign Up &nbsp;/</a>
	    <a class="bottomenu-log col-md-4 col-sm-4 col-xs-4" style="font-size: 1.2em;" href="${pageContext.request.contextPath}/member/login_mobile"> <span class="glyphicon glyphicon-log-in"></span> Log In</a>	  
	</div>
	<!--// not login bottom_bar -->	
		</c:when>
	
		<c:otherwise>
	<!-- login bottom_bar -->
		<div class=" hidden-lg col-md-12 col-sm-12 col-xs-12 pull-right" >		 				    
		 <!-- bottom_main -->
		 <div class="col-xs-offset-1 col-xs-2 col-sm-offset-1 col-sm-2">
		  <a class="navbar-brand glyphicon glyphicon-home" style="font-size: 1.5em; margin-left: -25px; " href="${pageContext.request.contextPath}/index"></a>
		  </div>
		   <!--// bottom_main -->
		    <!--bottom_search -->
		  <div class="col-xs-2 col-sm-2">
		  <a class="navbar-brand glyphicon glyphicon-search" style="font-size: 1.5em; margin-left: -18px; " href="${pageContext.request.contextPath}/article/article_list_main_mobile"></a>
		 </div>
		 <!--// bottom_search -->
		 <!-- bottom_write -->
		  <div class="col-xs-2 col-sm-2">
		  <a class="navbar-brand glyphicon glyphicon-edit" style="font-size: 1.8em; color:#FF8000; margin-left: -15px; " href="${pageContext.request.contextPath}/article/article_write_mobile"></a>
		  </div>
		  <!--// bottom_write -->
       <!-- bottom_invite -->
		 <div class="col-xs-2 col-sm-2">
		  <a class="navbar-brand glyphicon glyphicon-envelope" style="font-size: 1.5em; margin-left: -9px; " href="${pageContext.request.contextPath}/member/invite"></a>
		  </div>
		   <!-- bottom_invite -->       
		<!-- bottom_user -->
		<div class="col-xs-2 col-sm-2">
		  <a class="navbar-brand glyphicon glyphicon-user" style="font-size: 1.5em; margin-right: -25px; " href="${pageContext.request.contextPath}/mymenu/user_page_mobile?member_id=${loginInfo.id}"></a>
		  </div>
		<!--// bottom_user -->
		</div>
		<!--// login bottom_bar -->	
		</c:otherwise>
		</c:choose>
				
</div>
		</nav>

		
