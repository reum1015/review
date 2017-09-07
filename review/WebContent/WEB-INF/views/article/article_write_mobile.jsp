<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
 
 <!-- main css -->
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/article.css" />


<style type="text/css">
.cancel {
background-color: #585858;
}
.ok {
background-color: #FF8000;
}
</style>

</head>
<body>
	  <jsp:include page="/WEB-INF/views/template/topbar_mobile.jsp"/>
	  <jsp:include page="/WEB-INF/views/template/bottombar.jsp"/>

	<!-- 메인 화면 시작 -->
		<div class="container">		
		<div class="container_write">
		      <!-- Write Review -->
		   <form class="form-horizontal" method="post" enctype="multipart/form-data"
            action="${pageContext.request.contextPath}/article/article_write_mobile_ok">
            <!-- file upload -->
            <div class="form-group">
            <label for="file" class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >Photo <font size="2" color="#A4A4A4" class="share">(under 6mb)</font></label>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <input type="file" class="form-control" id=file name="file" />
            </div>
            </div>            
             <!-- category -->
              <div class="form-group">
            <label for="category" class="col-lg-12 col-md-12 col-sm-12 hidden-xs" >category</label>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <input type="text" class="form-control col-xs-4" id="category" name="category" placeholder="category" />
            </div>
            </div>           
            <!-- title -->
             <div class="form-group">
            <label for="title" class="col-lg-12 col-md-12 col-sm-12 hidden-xs" >title</label>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <input type="text" class="form-control" id="title" name="title" placeholder="title" />
            </div>
             </div>
            <!-- content -->
             <div class="form-group">
            <label for="content" class="col-lg-12 col-md-12 col-sm-12 hidden-xs" >content</label>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <textarea id="content" name="content" style="width: 100%; height: 150px; resize: none;" placeholder="what's your experience?"></textarea>
            </div>
            </div>
            <div class="form-group">
             <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">               
               <button type="button" class="btn cancel form-control" onclick="history.back();"><font size="4"  color="#fff">Cancel</font></button>
               </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">               
               <button type="submit" class="btn ok form-control"><font size="4" color="#28282"> Post</font></button>
             </div>            
            </div>
		      </form>
		      <!--// Write Review -->		 
		      </div>     
		</div>
		<!-- 메인 화면 끝 -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	
	
</body>
</html>