<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!-- 메인 헤더 -->
<!-- 내용영역 -->

<nav class="navbar navbar-default navbar-fixed-bottom hidden-lg hidden-md" role="navigation">
		<div class="containers">		
	<c:choose>
<c:when test="${loginInfo == null }">
  <!-- not login bottom_bar -->	
 <div class="bottommenu-login hidden-lg col-md-12 col-sm-12 col-xs-12" style="margin-top:15px;">	
		<a class="bottommenu-sign col-md-6 col-sm-offset-3 col-sm-4 col-xs-offset-2 col-xs-5" href="${pageContext.request.contextPath}/member/sign_up_mobile"><span class="glyphicon glyphicon-user"></span> Sign Up /</a>
	    <a class="bottomenu-log col-md-6 col-sm-4 col-xs-5" href="${pageContext.request.contextPath}/member/login_mobile"><span class="glyphicon glyphicon-log-in"></span> Log In</a>
	</div>
	<!--// not login bottom_bar -->	
		</c:when>
	
		<c:otherwise>
	<!-- login bottom_bar -->
		<div class="hidden-lg col-md-12 col-sm-12 col-xs-12 pull-right" style="margin-top: 5px;">		 				    
		 <!-- bottom_main -->
		 <div class="col-xs-offset-1 col-xs-2 col-sm-offset-1 col-sm-2">
		  <a class="navbar-brand glyphicon glyphicon-home" href="${pageContext.request.contextPath}/index"></a>
		  </div>
		   <!--// bottom_main -->
		    <!--bottom_search -->
		  <div class="col-xs-2 col-sm-2">
		  <a class="navbar-brand glyphicon glyphicon-search" href="${pageContext.request.contextPath}/article/article_list_main_mobile"></a>
		 </div>
		 <!--// bottom_search -->
		 <!-- bottom_write -->
		  <div class="col-xs-2 col-sm-2">
		  <a class="navbar-brand glyphicon glyphicon-edit" href="${pageContext.request.contextPath}/article/article_write"></a>
		  </div>
		  <!--// bottom_write -->
       <!-- bottom_invite -->
		 <div class="col-xs-2 col-sm-2">
		  <a class="navbar-brand glyphicon glyphicon-envelope" href="${pageContext.request.contextPath}/member/invite"></a>
		  </div>
		   <!-- bottom_invite -->       
		<!-- bottom_user -->
		<div class="col-xs-2 col-sm-2">
		  <a class="navbar-brand glyphicon glyphicon-user" href="${pageContext.request.contextPath}/mymenu/user_page_mobile?member_id=${loginInfo.id}"></a>
		  </div>
		<!--// bottom_user -->
		</div>
		<!--// login bottom_bar -->	
		</c:otherwise>
		</c:choose>
				
</div>
		</nav>

		
