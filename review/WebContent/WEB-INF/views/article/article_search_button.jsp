<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
 
 <!-- main css -->

<style type="text/css">
 .jumbotrons {
 width: 100%;
 background-color: #fff;
 }
  .form-group {
 margin-top: 3px;
 margin-bottom: 12px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/template/topbar_mobile.jsp"/>
  <jsp:include page="/WEB-INF/views/template/bottombar.jsp"/>
	<!-- 메인 화면 시작 -->	
		<div class="container" style="min-height: 450px;">		
	<div class="row">
    <div class="col-lg-10 col-md-offset-1 col-md-10 col-sm-offset-1 col-sm-11 " style="margin-top: 5px;">
       <h1 class="page-header col-lg-10 col-md-10  col-sm-11 "><small >Do you need more information about <font size="20" color="#FF8000">${keyword}</font>?</small></h1>
        <input type="hidden" name="keyword" value="${keyword}" />
     
        	<!-- 점보트론 -->
			<div class="jumbotrons">
			   <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">	   
				  <a href="https://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Daps&field-keywords=${keyword}">
				   <img alt="" src="${pageContext.request.contextPath}/assets/imgs/search/amazon.png" class="img-responsive"  width="130px" height="150px" style="margin-top: 8px; display: block;">
				   </a>
				    </div>
			 	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">	 				    
				  <a href="https://www.google.co.kr/search?q=${keyword}&oq=${keyword}&aqs=chrome..69i57j69i60l4j0.571j0j9&sourceid=chrome&ie=UTF-8">
				  <img alt="" src="${pageContext.request.contextPath}/assets/imgs/search/google.png" class="img-responsive"  width="130px" height="150px" style="margin-top: 8px; display: block; ">
				  </a>
				    </div> 
				     
				     <%--  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				  <a href="https://www.alibaba.com/trade/search?fsb=y&IndexArea=product_en&CatId=&SearchText=${keyword}">
				  <img alt="" src="${pageContext.request.contextPath}/assets/imgs/search/alibaba.png" class="img-responsive"  width="130px" height="150px" style="margin-top: 8px; display: block;">
				  </a>
				    </div>
				      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">   				      
				  <a href="https://search.yahoo.com/search;_ylc=X3oDMTFiN25laTRvBF9TAzIwMjM1MzgwNzUEaXRjAzEEc2VjA3NyY2hfcWEEc2xrA3NyY2h3ZWI-?p=${keyword}&fr=yfp-t&fp=1&toggle=1&cop=mss&ei=UTF-8">
				  <img alt="" src="${pageContext.request.contextPath}/assets/imgs/search/yahoo.png" class="img-responsive"  width="130px" height="150px" style="margin-top: 8px; display: block;">
				  </a>
				    </div>
			       <div class="col-lg-6 col-md-6 col-sm-6 col-xs-4">			       
				  <a href="https://www.bing.com/search?q=${keyword}&qs=n&form=QBLH&sp=-1&pq=${keyword}&sc=8-4&sk=&cvid=5B06039D4EC94E7D8B852BF32D833637">
				  <img alt="" src="${pageContext.request.contextPath}/assets/imgs/search/bing.png" class="img-responsive"  width="130px" height="150px" style="margin-top: 8px; display: block;">
				  </a>
				    </div>
				    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6"> 
				        <a href=" https://www.tripadvisor.com/Search?geo=&latitude=&longitude=&searchNearby=&pid=3825&redirect=&startTime=1502896830186&uiOrigin=MASTHEAD&q=${keyword}&returnTo=__2F__&searchSessionId=95A673D3E690F8388A9B020776450F5C1502896820826ssid#&ssrc=a&o=0">
				  <img alt="" src="${pageContext.request.contextPath}/assets/imgs/search/tripadvisor.png" class="img-responsive"  width="130px" height="150px" style="margin-top: 8px; display: block;">
				  </a>
				
				    </div>
				    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-4"> 				    
				  <a href="https://www.iherb.com/search?kw=${keyword}">
				  <img alt="" src="${pageContext.request.contextPath}/assets/imgs/search/iherb.jpg" class="img-responsive"  width="130px" height="150px" style="margin-top: 8px; display: block;">
				  </a>
				    </div>
				     <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">   				      
				  <a href="https://www.ebay.com/sch/i.html?_from=R40&_trksid=p2050601.m570.l1313.TR0.TRC0.H0.X${keyword}.TRS0&_nkw=${keyword}&_sacat=0">
				  <img alt="" src="${pageContext.request.contextPath}/assets/imgs/search/ebay.jpg" class="img-responsive"  width="130px" height="150px" style="margin-top: 8px; display: block;">
				  </a>
				    </div>
				    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				    <a href="http://www.6pm.com/${keyword}">
				  <img alt="" src="${pageContext.request.contextPath}/assets/imgs/search/6pm.png" class="img-responsive"  width="130px" height="150px" style="margin-top: 8px; display: block; ">
				  </a>
				    </div>
				    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-4">
				     <a href="https://en.wikipedia.org/wiki/${keyword}">
				  <img alt="" src="${pageContext.request.contextPath}/assets/imgs/search/wikipedia.jpg" class="img-responsive"  width="130px" height="150px" style="margin-top: 8px; display: block;">
				  </a>				  
				    </div>
					 --%>
			</div>
			<!--// 점보트론 -->
        
        <div class="form-group col-lg-11 col-md-11 col-sm-11 col-xs-12">
             <div class="">
             <hr />               
               <button type="button" class="btn btn-danger form-control" onclick="history.back();">Back</button>
               </div>          
            </div>
        
      

    </div>
  </div>				
		</div>
		<!-- 메인 화면 끝 -->
	


	

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	
	
</body>
</html>