<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>   
    <jsp:include page="/WEB-INF/views/template/head.jsp"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/eachMain.css" />
  <jsp:include page="/WEB-INF/views/template/topbarsearch.jsp"/>
  <jsp:include page="/WEB-INF/views/template/bottombar.jsp"/>
 
 
 <style type="text/css">
 /*mobile-start*/
 .main-toptext-mobile {
 margin-top: -20px;
}
 .main-toptexts-mobile {
 margin-top: -23px;
 margin-bottom: 12px;
}
.main-text-mobile {
 margin-top: -20px;
}
 .main-texts-mobile {
 margin-top: -33px;
 margin-bottom: 12px;
}
.main-bottom-mobile {
margin-bottom: -40px;
}
/*mobile end*/
/*web start*/
.main-text-web {
margin-top: -20px;
}
.main-text-bottom-web {
margin-bottom: -15px;
}
.main-bottom-web {
margin-bottom: -70px;
}
/*web end*/
</style>
  
</head>
<body>   

	<div class="container content_body">
		<!-- 점보트론 -->
			<div class="jumbotron">
				<p >
				  <font size="4"> Visit Review&Bang.com  </font>
				  <br />
				   <div class="hidden-xs main-text-web">	   
				   <font size="6" color="#484848"> Before or After doing something. </font>
				    </div>
				    <div class="hidden-lg hidden-md hidden-sm main-toptext-mobile">	   
				   <font size="5" color="#484848"> Before or After &emsp;</font>
				   </div>
				   <div class="hidden-lg hidden-md hidden-sm main-toptexts-mobile">
				   <font size="5" color="#484848"> doing something. </font>
				    </div>	
				  
				   <div class="hidden-xs main-text-bottom-web">	   
				   <font size="14" color="#0040FF">Share your Experience </font>
				    </div>
				    <div class="hidden-lg hidden-md hidden-sm main-text-mobile">	   
				   <font size="8" color="#0040FF">Share </font>
				   </div>
				   <div class="hidden-lg hidden-md hidden-sm main-texts-mobile">
				   <font size="5" color="#D0A9F5"> your Experience</font>
				    </div>							   
				    
				   <div class="hidden-xs main-text-bottom-web">	   
				   <font size="10" color="#585858">Product &nbsp;</font> <font size="5" color="#BDBDBD">that you’ve used</font>
				    </div>
				    <div class="hidden-lg hidden-md hidden-sm main-text-mobile">	   
				   <font size="6" color="#585858">Product &emsp;&emsp;&emsp;</font>
				   </div>
				   <div class="hidden-lg hidden-md hidden-sm main-texts-mobile">
				    <font size="4" color="#BDBDBD">that you’ve used</font>
				    </div>	
				    
				  <div class="hidden-xs main-text-bottom-web">	   
				   <font size="10" color="#585858">Movie &emsp;&nbsp;</font> <font size="5" color="#BDBDBD">that you’ve watched</font>
				    </div>
				    <div class="hidden-lg hidden-md hidden-sm main-text-mobile">	   
				   <font size="6" color="#585858">Movie &emsp;&emsp;&emsp;&emsp;</font>
				   </div>
				   <div class="hidden-lg hidden-md hidden-sm main-texts-mobile">
				    <font size="4" color="#BDBDBD">that you’ve watched</font>
				    </div>	
				    
				  <div class="hidden-xs main-text-bottom-web main-bottom-web">	   
				   <font size="10" color="#585858">Places &emsp;&nbsp;</font> <font size="5" color="#BDBDBD">that you’ve been</font>
				    </div>
				    <div class="hidden-lg hidden-md hidden-sm main-text-mobile">	   
				   <font size="6" color="#585858">Places &emsp;&emsp;&emsp;&emsp;</font>
				   </div>
				   <div class="hidden-lg hidden-md hidden-sm main-texts-mobile main-bottom-mobile">
				    <font size="4" color="#BDBDBD">that you’ve been</font>
				    </div>								 
				</p>
				
			</div>
			<!--// 점보트론 -->

			<!-- 그리드 시스템 (데스크탑 가로3칸) -->
			<div class="row multi-columns-row">
  			    <a href="${pageContext.request.contextPath}/article/article_list?keyword=iphone7">
				<div class="col-md-4 hidden-sm hidden-xs">
      <img alt="" src="${pageContext.request.contextPath}/assets/imgs/main/main1.jpg" class="img-responsive" width="300px" height="250px" >
        <div class="carousel-caption">    
     <h3 >iphone7</h3>
       </div>
				</div>
          </a>
           <a href="${pageContext.request.contextPath}/article/article_list?keyword=book">
				<div class="col-md-4 hidden-sm hidden-xs">
				 <img alt="" src="${pageContext.request.contextPath}/assets/imgs/main/main2.jpg" class="img-responsive" width="300px" height="250px" >
        <div class="carousel-caption">    
     <h3>book</h3>
       </div>					
				</div>
				</a>
				 <a href="${pageContext.request.contextPath}/article/article_list?keyword=movie">
				<div class="col-md-4 hidden-sm hidden-xs">
		<img alt="" src="${pageContext.request.contextPath}/assets/imgs/main/main3.jpg" class="img-responsive" width="300px" height="250px" >
        <div class="carousel-caption">    
     <h3>movie</h3>
       </div>
				</div>
				</a>
				 <a href="${pageContext.request.contextPath}/article/article_list?keyword=film">
				<div class="col-md-4 hidden-sm hidden-xs">
		<img alt="" src="${pageContext.request.contextPath}/assets/imgs/main/main4.jpg" class="img-responsive" width="300px" height="250px" >
        <div class="carousel-caption">    
     <h3>film</h3>
       </div>
				</div>	
				</a>
				<a href="${pageContext.request.contextPath}/article/article_list?keyword=foundation">
				<div class="col-md-4 hidden-sm hidden-xs">
		<img alt="" src="${pageContext.request.contextPath}/assets/imgs/main/main5.jpg" class="img-responsive" width="300px" height="250px" >
        <div class="carousel-caption">    
     <h3>foundation</h3>
       </div>
				</div>	
				</a>
				<a href="${pageContext.request.contextPath}/article/article_list?keyword=galaxyS8">
				<div class="col-md-4 hidden-sm hidden-xs">
		<img alt="" src="${pageContext.request.contextPath}/assets/imgs/main/main6.jpg" class="img-responsive" width="300px" height="250px" >
        <div class="carousel-caption">    
     <h3>galaxyS8</h3>
       </div>
				</div>	
				</a>				 
		
			</div>
			<!--// 그리드 시스템 -->
			
			
			
				<!-- 그리드 시스템 (모바일) -->
			<div class="row multi-columns-row">
  			    <a href="${pageContext.request.contextPath}/article/article_list_mobile?keyword=iphone7">
				<div class="hidden-lg hidden-md col-sm-6 col-xs-6">
      <img alt="" src="${pageContext.request.contextPath}/assets/imgs/main/main1.jpg" class="img-responsive" width="300px" height="250px" >
        <div class="carousel-caption">    
     <h3 >iphone7</h3>
       </div>
				</div>
          </a>
           <a href="${pageContext.request.contextPath}/article/article_list_mobile?keyword=book">
				<div class="hidden-md col-sm-6 col-xs-6">
				 <img alt="" src="${pageContext.request.contextPath}/assets/imgs/main/main2.jpg" class="img-responsive" width="300px" height="250px" >
        <div class="carousel-caption">    
     <h3>book</h3>
       </div>					
				</div>
				</a>
				 <a href="${pageContext.request.contextPath}/article/article_list_mobile?keyword=movie">
				<div class="hidden-md col-sm-6 col-xs-6">
		<img alt="" src="${pageContext.request.contextPath}/assets/imgs/main/main3.jpg" class="img-responsive" width="300px" height="250px" >
        <div class="carousel-caption">    
     <h3>movie</h3>
       </div>
				</div>
				</a>
				 <a href="${pageContext.request.contextPath}/article/article_list_mobile?keyword=film">
				<div class="hidden-md col-sm-6 col-xs-6">
		<img alt="" src="${pageContext.request.contextPath}/assets/imgs/main/main4.jpg" class="img-responsive" width="300px" height="250px" >
        <div class="carousel-caption">    
     <h3>film</h3>
       </div>
				</div>	
				</a>
				<a href="${pageContext.request.contextPath}/article/article_list_mobile?keyword=foundation">
				<div class="hidden-md col-sm-6 col-xs-6">
		<img alt="" src="${pageContext.request.contextPath}/assets/imgs/main/main5.jpg" class="img-responsive" width="300px" height="250px" >
        <div class="carousel-caption">    
     <h3>foundation</h3>
       </div>
				</div>	
				</a>
				<a href="${pageContext.request.contextPath}/article/article_list_mobile?keyword=galaxyS8">
				<div class="hidden-md col-sm-6 col-xs-6">
		<img alt="" src="${pageContext.request.contextPath}/assets/imgs/main/main6.jpg" class="img-responsive" width="300px" height="250px" >
        <div class="carousel-caption">    
     <h3>galaxyS8</h3>
       </div>
				</div>	
				</a>				 
		
			</div>
			<!-- 그리드 시스템 (모바일) -->
	</div>
	
	
	
	<jsp:include page="/WEB-INF/views/template/footer.jsp"/>
</body>
</html>