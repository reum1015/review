<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>   
    <jsp:include page="/WEB-INF/views/template/head.jsp"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/eachMain.css" />
  <jsp:include page="/WEB-INF/views/template/topbar.jsp"/>
  <jsp:include page="/WEB-INF/views/template/bottombar.jsp"/>
 
 
 <style type="text/css">
  .image {
    position:relative;
    float:left; /* optional */
}
.image .text {
    position:absolute;
    top:10px; /* in conjunction with left property, decides the text position */
    left:10px;
    width:300px; /* optional, though better have one */
}
</style> 
 
  
</head>
<body>   

	<div class="container content_body">
		<!-- 점보트론 -->
			<div class="jumbotron">
				<p>
				  <font size="4"> Visit Review&Bang.com  </font>
				  <br />
				   <font size="6"> Before or After doing something </font> 
				   <br />
				   <br />				   
				   <font size="6" color="#0000ff"> Share</font> <font size="4" color="ff6600"> your Experience </font>
				    <br />
					<font size="6" color="#0000ff"> product</font> <font size="4" color="ff6600">what you used  </font>
					<br />
					<font size="6" color="#0000ff"> movie</font> <font size="4" color="ff6600"> what you watched </font>
					 <br />
					<font size="6" color="#0000ff"> travel </font> <font size="4" color="ff6600"> what you felt</font>
					<br />				 
				</p>
				
			</div>
			<!--// 점보트론 -->

			<!-- 그리드 시스템 (데스크탑 가로3칸) -->
			<div class="row">
				<div class="image col-md-4 col-sm-6 col-xs-6">			
      <img alt="" src="${pageContext.request.contextPath}/assets/imgs/img/frog1.jpg" width="100%" height="100%"/>
        <div class="text">    
     <p>iphone7</p>
       </div>
				</div>
				<div class="col-md-4 col-sm-6 col-xs-6">
					<h2>HTML5</h2>					
					<a href="#" role="button">galaxys8</a>
				</div>
				<div class="col-md-4 col-sm-6 col-xs-6">
					<h2>HTML5</h2>					
					<a href="#" role="button">movie</a>
				</div>
				<div class="col-md-4 col-sm-6 col-xs-6">
					<h2>HTML5</h2>					
					<a href="#" role="button">mobile</a>
				</div>				
				<div class="col-md-4 col-sm-6 col-xs-6">
					<h2>HTML5</h2>					
					<a href="#" role="button">nexus7</a>
				</div>
				<div class="col-md-4 col-sm-6 col-xs-6">
					<h2>HTML5</h2>					
					<a href="#" role="button">cleanser</a>
				</div>
				
			</div>
			<!--// 그리드 시스템 -->
	</div>
	
	
	
	<jsp:include page="/WEB-INF/views/template/footer.jsp"/>
</body>
</html>