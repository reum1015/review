<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style type="text/css">

body{
	padding-top: 50px;
	padding-bottom: 120px;
}
.navbar-fixed-top {
    height: 56px;
	max-height: 100%;
	margin-bottom: -10px;
}

.topmenu-brands{
	margin-top: 5px;
	margin-left: 130px;
}
.topmenu-brands-sm{
	margin-top: 5px;
	margin-left: 80px;
}
.topmenu-icon{
    margin-top: 5px;
	margin-left: -5px;
}
.topmenu-search {
	margin-top: 10px;
}

.topmenu-login {
	margin-top: 15px;
}
.topmenu-icons {
	margin-right: 30px;
	margin-left: 5px;
}

</style>
<!-- 메인 헤더 -->
<!-- 내용영역 -->
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="containers">		
	<c:choose>
<c:when test="${loginInfo == null }">
  <!-- not login top_bar -->	
 <div class="topmenu-main col-lg-12 col-md-12 col-sm-12 col-xs-12">
     <!-- top_main big-->
	<div class="col-lg-4 hidden-md hidden-sm hidden-xs">       
       <a class="topmenu-brands" href="${pageContext.request.contextPath}/index">
	<img alt="title" src="${pageContext.request.contextPath}/assets/imgs/img/title.png"
	height="55px" width="200px" style="margin-top: 5px;" />
	</a>
	</div>	
       <!--// top_main big-->
        <!-- top_main sm-->
	<div class="hidden-lg col-md-3 col-sm-4 hidden-xs">       
       <a class="topmenu-brands-sm" href="${pageContext.request.contextPath}/index">
	<img alt="title" src="${pageContext.request.contextPath}/assets/imgs/img/title.png"
	height="55px" width="200px" style="margin-top: 5px;" />
	</a>
	</div>	
       <!--// top_main sm-->              
       <!-- top_search big-->
        <div class="topmenu-search col-lg-3 col-md-3 col-sm-offset-1 col-sm-2  hidden-xs">
       <form method="post" action="${pageContext.request.contextPath}/article/article_list" style="width:200px; height:50px; ">
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
       <!--// top_search big -->       
         <!-- top_main small-->
       <div class="topmenu-icon hidden-lg hidden-md hidden-sm col-xs-1" >       
       <a class="topmenu-icon" href="${pageContext.request.contextPath}/index" >
	<img alt="reviewicon" src="${pageContext.request.contextPath}/assets/icon/reviewicon.png"
	 height="45px" width="50px" style="margin-top: 3px;" />
	</a>	
       </div>
       <!--// top_main small-->
       	<!-- top_search small-->
          <div class="topmenu-search hidden-lg hidden-md hidden-sm col-xs-offset-2 col-xs-4">
       <form method="post" action="${pageContext.request.contextPath}/article/article_list_mobile" style="width:200px; height:50px;  ">
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
       	<!--// top_search small-->
       <!-- top_login -->
       <div class="topmenu-login  col-lg-2 col-md-3 hidden-sm hidden-xs">
       <a class="topmenu-sign" href="${pageContext.request.contextPath}/member/sign_up"><span class="glyphicon glyphicon-user"></span> Sign Up /</a>       
       <a class="topmenu-log" href="${pageContext.request.contextPath}/member/login"><span class="glyphicon glyphicon-log-in"></span> Log In</a>
       </div>	
       <!--// top_login -->  
       <!-- top_article -->
        <div class="col-lg-1 col-md-1 hidden-sm hidden-xs pull-right" style="margin-right: 10px;">
		<a href="${pageContext.request.contextPath}/article/article_list_main" data-toggle="modal" data-target="" class="navbar-brand glyphicon glyphicon-th-list" style="color:#DF0101"></a>		
		</div>
       <div class="hidden-lg hidden-md col-sm-1 col-xs-1 pull-right" style="margin-right: 10px;">
		<a href="${pageContext.request.contextPath}/article/article_list_main_mobile" data-toggle="modal" data-target="" class="navbar-brand glyphicon glyphicon-th-list" style="color:#DF0101"></a>		
		</div>
		<!--// top_article -->    
	</div>
	<!--// not login top_bar -->	
		</c:when>	
		<c:otherwise>
	<!-- login top_bar -->
	<!-- top_main big-->
	<div class="col-lg-3 col-md-3 hidden-sm hidden-xs">       
       <a class="topmenu-brands" href="${pageContext.request.contextPath}/index">
	<img alt="title" src="${pageContext.request.contextPath}/assets/imgs/img/title.png"
	height="55px" width="200px" style="margin-top: 5px;" />
	</a>
	</div>	
       <!--// top_main big-->
       <!-- top_main sm-->
	<div class="hidden-lg hidden-md  col-sm-4 hidden-xs">       
       <a class="topmenu-brands-sm" href="${pageContext.request.contextPath}/index">
	<img alt="title" src="${pageContext.request.contextPath}/assets/imgs/img/title.png"
	height="55px" width="200px" style="margin-top: 5px;" />
	</a>
	</div>	
       <!--// top_main sm-->
       <!-- top_search big-->
      <div class="topmenu-search col-lg-3 col-md-3 col-sm-offset-1 col-sm-2  hidden-xs">
       <form method="post" action="${pageContext.request.contextPath}/article/article_list" style="width:200px; height:50px; ">
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
       <!--// top_search big -->       
         <!-- top_main small-->
       <div class="topmenu-icon hidden-lg hidden-md hidden-sm  col-xs-1" >       
       <a class="topmenu-icon" href="${pageContext.request.contextPath}/index" >
	<img alt="reviewicon" src="${pageContext.request.contextPath}/assets/icon/reviewicon.png"
	 height="45px" width="50px" style="margin-top: 3px;" />
	</a>	
       </div>
       <!--// top_main small-->            
       	<!-- top_search small-->
          <div class="topmenu-search hidden-lg hidden-md hidden-sm col-xs-offset-2 col-xs-4">
       <form method="post" action="${pageContext.request.contextPath}/article/article_list_mobile" style="width:200px; height:50px;">
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
       	<!--// top_search small-->       
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
		 <div class="topmenu-icons topmenu-user col-lg-1 col-md-1 hidden-sm hidden-xs">
		  <a class="navbar-brand glyphicon glyphicon-user" href="${pageContext.request.contextPath}/mymenu/user_page?member_id=${loginInfo.id}"></a>
		  </div>
		
		  <!--// top_user -->
		<!--// login top_bar -->	
		</c:otherwise>
		</c:choose>				
</div>
		</nav>		

		
		
	
		
		