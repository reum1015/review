<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>   
    <jsp:include page="/WEB-INF/views/template/head.jsp"/>
   
  <jsp:include page="/WEB-INF/views/template/topbar_mobile.jsp"/>
  <jsp:include page="/WEB-INF/views/template/bottombar.jsp"/>
 
 
 <style type="text/css">
 .jumbotron {
 margin-top: -20px;
 background-color: #fff;
 }
 /*mobile-start*/
 .main-toptext-mobile {
 margin-top: -20px;
}
 .main-toptexts-mobile {
 margin-top: -23px;
 margin-bottom: 12px;
}
.main-text-mobile-share {
 margin-top: -30px;
}
.main-text-mobile {
 margin-top: -20px;
}
 .main-texts-mobile {
 margin-top: -33px;
 margin-bottom: 12px;
}
.main-bottom-mobile {
margin-bottom: -110px;
}
/*mobile end*/
/*web start*/
.main-text-web {
margin-top: -30px;
}
.main-text-bottom-webs {
margin-top: -15px;
margin-bottom: -15px;
}
.main-text-bottom-web {
margin-top: -15px;
margin-bottom: -15px;
margin-left: 4px;
}
.main-bottom-web {
margin-bottom: -100px;
}
/*web end*/
.share {
font-style: italic;
}

@IMPORT url("https://fonts.googleapis.com/earlyaccess/opensanshebrew.css");

.font {
	font-family: 'Open Sans Hebrew', sans-serif Semi-Bold italic ;		
}
</style>
  
</head>
<body>   

	<div class="container content_body col-lg-offset-2 col-lg-8 col-md-offset-1 col-md-10 ">
		<!-- 점보트론 -->
			<div class="jumbotron">
				<p>
				  <font size="4"> Visit Review&amp;Bang.com  </font>
				  <br />
				   <div class="hidden-xs main-text-web">	   
				   <font size="6" color="#484848"> Before or After doing something. </font>
				    </div>
				   <div class="hidden-xs main-text-bottom-webs">	   
				   <font size="14" color="#FF8000" class="share">Share your Experience </font>
				    </div>
				    <div class="hidden-lg hidden-md hidden-sm main-text-mobile-share">	   
				   <font size="8" color="#FF8000" class="share">Share </font> <font size="5" color="#FF8000" class="share"> your Experience</font>
				   </div>
				   <div class="hidden-lg hidden-md hidden-sm main-texts-mobile">
				   
				    </div>							   
				    
				   <div class="hidden-xs main-text-bottom-web">	   
				   <font size="6" color="#585858">Product &nbsp;&nbsp;&nbsp;</font> <font size="4" color="#A4A4A4">that you’ve used</font>
				    </div>
				    <div class="hidden-lg hidden-md hidden-sm main-text-mobile">	   
				   <font size="6" color="#585858">Product &ensp;</font><font size="4" color="#A4A4A4">that you’ve used</font>
				   </div>
				   <div class="hidden-lg hidden-md hidden-sm main-texts-mobile">
				    
				    </div>	
				    
				  <div class="hidden-xs main-text-bottom-web">	   
				   <font size="6" color="#585858">Movie &emsp;&nbsp;&nbsp;</font> <font size="4" color="#A4A4A4">that you’ve watched</font>
				    </div>
				    <div class="hidden-lg hidden-md hidden-sm main-text-mobile">	   
				   <font size="6" color="#585858">Movie &emsp;&nbsp;</font><font size="4" color="#A4A4A4">that you’ve watched</font>
				   </div>
				   <div class="hidden-lg hidden-md hidden-sm main-texts-mobile">
				    
				    </div>	
				    
				  <div class="hidden-xs main-text-bottom-web main-bottom-web">	   
				   <font size="6" color="#585858">Places &emsp;&nbsp;</font><font size="4" color="#A4A4A4">that you’ve been</font>
				    </div>
				    <div class="hidden-lg hidden-md hidden-sm main-text-mobile">	   
				   <font size="6" color="#585858">Places &emsp;</font><font size="4" color="#A4A4A4">that you’ve been</font>
				   </div>
				   <div class="hidden-lg hidden-md hidden-sm main-texts-mobile main-bottom-mobile">

				    </div>								 
				</p>
				
			</div>
			<!--// 점보트론 -->

			<!-- 그리드 시스템 (데스크탑 가로3칸) -->
			<h1 class="page-header  col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<small><font size="6" color="#FF0040">Best Category</font> </small>
			</h1>	
			<div class="row multi-columns-row" style="margin-left:5px;">
  			    <a href="${pageContext.request.contextPath}/article/article_list?keyword=galaxynote8">
				<div class="col-lg-4 col-md-4 col-sm-6  hidden-xs">
      <img alt="" src="${pageContext.request.contextPath}/assets/imgs/main/main1.png" class="img-responsive" >
        <div class="carousel-caption">    
     <h3 >Galaxy Note 8</h3>
       </div>
				</div>
          </a>
           <a href="${pageContext.request.contextPath}/article/article_list?keyword=cosmetics">
				<div class="col-lg-4 col-md-4 col-sm-6  hidden-xs">
				 <img alt="" src="${pageContext.request.contextPath}/assets/imgs/main/main2.png" class="img-responsive" >
        <div class="carousel-caption">    
     <h3>Cosmetics</h3>
       </div>					
				</div>
				</a>
				 <a href="${pageContext.request.contextPath}/article/article_list?keyword=book">
				<div class="col-lg-4 col-md-4 col-sm-6  hidden-xs">
		<img alt="" src="${pageContext.request.contextPath}/assets/imgs/main/main3.png" class="img-responsive" >
        <div class="carousel-caption">    
     <h3>Book</h3>
       </div>
				</div>
				</a>
				 <a href="${pageContext.request.contextPath}/article/article_list?keyword=movie">
				<div class="col-lg-4 col-md-4 col-sm-6  hidden-xs">
		<img alt="" src="${pageContext.request.contextPath}/assets/imgs/main/main4.png" class="img-responsive" >
        <div class="carousel-caption">    
     <h3>Movie</h3>
       </div>
				</div>	
				</a>
				<a href="${pageContext.request.contextPath}/article/article_list?keyword=game">
				<div class="col-lg-4 col-md-4 col-sm-6  hidden-xs">
		<img alt="" src="${pageContext.request.contextPath}/assets/imgs/main/main5.png" class="img-responsive" >
        <div class="carousel-caption">    
     <h3>Game</h3>
       </div>
				</div>	
				</a>
				<a href="${pageContext.request.contextPath}/article/article_list?keyword=gameofthrones7">
				<div class="col-lg-4 col-md-4 col-sm-6 hidden-xs">
		<img alt="" src="${pageContext.request.contextPath}/assets/imgs/main/main6.png" class="img-responsive" >
        <div class="carousel-caption">    
     <h3>Game Of Thrones 7</h3>
       </div>
				</div>	
				</a>				 
		
			</div>
			<!--// 그리드 시스템 -->
			
			
			
				<!-- 그리드 시스템 (모바일) -->
			<div class="row multi-columns-row" >
  			    <a href="${pageContext.request.contextPath}/article/article_list_mobile?keyword=galaxynote8">
				<div class="hidden-lg hidden-md hidden-sm col-xs-6">
      <img alt="" src="${pageContext.request.contextPath}/assets/imgs/main/main1.png" class="img-responsive" >
        <div class="carousel-caption">    
     <h3 >Galaxy<br/>Note8</h3>
       </div>
				</div>
          </a>
           <a href="${pageContext.request.contextPath}/article/article_list_mobile?keyword=cosmetics">
				<div class="hidden-lg hidden-md hidden-sm col-xs-6">
				 <img alt="" src="${pageContext.request.contextPath}/assets/imgs/main/main2.png" class="img-responsive" >
        <div class="carousel-caption">    
     <h3>Cosmetics</h3>
       </div>					
				</div>
				</a>
				 <a href="${pageContext.request.contextPath}/article/article_list_mobile?keyword=book">
				<div class="hidden-lg hidden-md hidden-sm col-xs-6">
		<img alt="" src="${pageContext.request.contextPath}/assets/imgs/main/main3.png" class="img-responsive" >
        <div class="carousel-caption">    
     <h3>Book</h3>
       </div>
				</div>
				</a>
				 <a href="${pageContext.request.contextPath}/article/article_list_mobile?keyword=movie">
				<div class="hidden-lg hidden-md hidden-sm col-xs-6">
		<img alt="" src="${pageContext.request.contextPath}/assets/imgs/main/main4.png" class="img-responsive" >
        <div class="carousel-caption">    
     <h3>Movie</h3>
       </div>
				</div>	
				</a>
				<a href="${pageContext.request.contextPath}/article/article_list_mobile?keyword=game">
				<div class="hidden-lg hidden-md hidden-sm col-xs-6">
		<img alt="" src="${pageContext.request.contextPath}/assets/imgs/main/main5.png" class="img-responsive" >
        <div class="carousel-caption">    
     <h3>Game</h3>
       </div>
				</div>	
				</a>
				 
				<div class="hidden-lg hidden-md hidden-sm col-xs-6">
				<a href="${pageContext.request.contextPath}/article/article_list_mobile?keyword=gameofthrones7">
		<img alt="" src="${pageContext.request.contextPath}/assets/imgs/main/main6.png" class="img-responsive" >
        <div class="carousel-caption" style="margin-top:50px;">   
     <h3>Game Of
     <br/>Thrones 7</h3>
       </div>
       </a>		
				</div>	
						 
		
			</div>
			<!-- 그리드 시스템 (모바일) -->
			<div class="container" style="margin-top:20px; margin-bottom: -68px;">

<footer id="footer" >
<div>
<p class="pull-right"><a href="#">Back to top</a></p>
<p class="pull-left"> &copy;Review&amp;Bang&ensp;</p>
<p class="pull-left">
    <a href="${pageContext.request.contextPath}/legal/privacy">Privacy</a>&ensp; 
	<a href="${pageContext.request.contextPath}/legal/terms">Terms</a> &ensp;
	<a href="${pageContext.request.contextPath}/legal/feedback">Feedback</a>&ensp;
	 <c:if test="${loginInfo.member_level == 'BB'}">
	<a href="${pageContext.request.contextPath}/admin/admin_mobile">admin</a>
    	</c:if>
	
</p>
</div>
</footer>
</div>
	</div>
	
	
	
</body>
</html>