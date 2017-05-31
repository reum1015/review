<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
.container{
width: 80%;
height: auto;
}
body{
	padding-top: 50px;
	padding-bottom: 120px;
}

.navbar-fixed-top {
	max-height: 100%;
}

.topmenu-brands{
	margin-top: 5px;
}
.topmenu-search {
	margin-top: 10px;
}

.topmenu-login {
	margin-top: 15px;
}

</style>
<!-- 메인 헤더 -->
<!-- 내용영역 -->
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">		
	<c:choose>
<c:when test="${loginInfo == null }">
  <!-- not login top_bar -->	
 <div class="topmenu-main col-lg-12 col-md-12 col-sm-12 col-xs-12">
       <!-- top_main -->
       <div class="topmenu-brands col-lg-4 col-md-4 hidden-sm hidden-xs" >       
       <a class="topmenu-brands" href="${pageContext.request.contextPath}/main" >
	<img alt="main" src="${pageContext.request.contextPath}/assets/imgs/img/title.jpg"
	 height="50px" width="140px"  />
	</a>	
       </div>      
       <!--// top_main -->
       	<!-- top_search -->
      <div class="topmenu-search col-lg-4 col-md-4 hidden-sm hidden-xs">
       <form method="get" action="${pageContext.request.contextPath}/article/article_list" style="width:200px; height:50px; ">
<div class="input-group">
<input type="text" name="keyword" class="form-control"
placeholder="Search" value="${keyword}" />
<span class="input-group-btn">
<button class="btn btn-success" type="submit">
<i class="glyphicon glyphicon-search"></i>
</button>
</span>
</div>
</form>       
       </div>
        <div class="topmenu-search hidden-lg hidden-md col-sm-offset-3 col-sm-4 col-xs-offset-1 col-xs-5">
       <form method="get" action="${pageContext.request.contextPath}/article/article_list_mobile" style="width:200px; height:50px; ">
<div class="input-group">
<input type="text" name="keyword" class="form-control"
placeholder="Search" value="${keyword}" />
<span class="input-group-btn">
<button class="btn btn-success" type="submit">
<i class="glyphicon glyphicon-search"></i>
</button>
</span>
</div>
</form>       
       </div>
       <!--// top_search -->
       <!-- top_login -->
       <div class="topmenu-login  col-lg-4 col-md-4 hidden-sm hidden-xs">
       <a class="topmenu-sign" href="${pageContext.request.contextPath}/member/sign_up"><span class="glyphicon glyphicon-user"></span> Sign Up /</a>       
       <a class="topmenu-log" href="${pageContext.request.contextPath}/member/login"><span class="glyphicon glyphicon-log-in"></span> Log In</a>
       </div>	
       <!--// top_login -->    
	</div>
	<!--// not login top_bar -->	
		</c:when>	
		<c:otherwise>
	<!-- login top_bar -->
	<!-- top_main -->
<div class="topmenu-brands col-lg-4 col-md-4 hidden-sm hidden-xs" >       
       <a class="topmenu-brands" href="${pageContext.request.contextPath}/main" >
	<img alt="main" src="${pageContext.request.contextPath}/assets/imgs/img/title.jpg"
	 height="50px" width="140px"  />
	</a>	
       </div>
       <div class="hidden-lg hidden-md col-sm-offset-3 col-sm-4 col-xs-offset-1 col-xs-4">       
       <a class="topmenu-brands" href="${pageContext.request.contextPath}/main">
	<img alt="main" src="${pageContext.request.contextPath}/assets/imgs/img/title.jpg"
	height="42px" width="200px" />
	</a>
	</div>		
       <!--// top_main -->
       <!-- top_search -->
     <div class="topmenu-search col-lg-4 col-md-4 hidden-sm hidden-xs">
       <form method="get" action="${pageContext.request.contextPath}/article/article_list" style="width:200px; height:50px; ">
<div class="input-group">
<input type="text" name="keyword" class="form-control"
placeholder="Search" value="${keyword}" />
<span class="input-group-btn">
<button class="btn btn-success" type="submit">
<i class="glyphicon glyphicon-search"></i>
</button>
</span>
</div>
</form>       
       </div>
       <!--// top_search -->
       <!-- top_invite -->
       	
       <div class="col-lg-1 col-md-1 hidden-sm hidden-xs">
       <a href="${pageContext.request.contextPath}/member/invite" data-toggle="modal" data-target="" class="navbar-brand glyphicon glyphicon-envelope"></a>
       </div>
       <!-- top_invite -->
        <!-- top_article -->
		<div class="col-lg-1 col-md-1 hidden-sm hidden-xs">
		<a href="${pageContext.request.contextPath}/article/article_list_main" data-toggle="modal" data-target="" class="navbar-brand glyphicon glyphicon-search"></a>		
		</div>
		<!--// top_article -->
       <!-- top_write -->
		<div class="col-lg-1 col-md-1 hidden-sm hidden-xs">
		<a href="${pageContext.request.contextPath}/article/article_write" data-toggle="modal" data-target="" class="navbar-brand glyphicon glyphicon-edit"></a>		
		</div>
		<!--// top_write -->
		<!-- top_user -->
		 <div class="topmenu-user col-lg-1 col-md-1 hidden-sm hidden-xs">
		  <a class="navbar-brand glyphicon glyphicon-user" href="${pageContext.request.contextPath}/mymenu/my_page?member_id==loginInfo.id"></a>
		  </div>
		
		  <!--// top_user -->
		<!--// login top_bar -->	
		</c:otherwise>
		</c:choose>				
</div>
		</nav>		

		
		
	
		
		