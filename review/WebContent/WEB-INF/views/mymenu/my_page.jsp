<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/mypage.css" />



</head>
<body>
	  <jsp:include page="/WEB-INF/views/template/topbar.jsp"/>
  <jsp:include page="/WEB-INF/views/template/bottombar.jsp"/>
  

	<!-- 메인 화면 시작 -->
	<div class="container">
	<div class="container_mypage ">
	<!-- page header -->
	 <div class="my_page_box row col-lg-12 col-md-12 col-sm-12 col-xs-12">
	 <!-- profile image  -->
	 <c:url var="downloadUrl" value="/download">
				 <c:param name="file" value="${readArticle.imagePath}" />
			</c:url>
			         <a class="profile_img col-lg-4 col-md-4 col-sm-4 col-xs-4">
			      <img src="${downloadUrl}" class="img-responsive" style="margin: auto" />
			      </a>			
	<!--// profile image -->	
	<!-- profile part-->	
	<div class="profile_part col-lg-4 col-md-4">
		 ${loginInfo.nick_name}
		 <br />
		 ${loginInfo.introduce}
		</div>
		<!--// profile part-->	
		<!-- setting -->	
	  <div class="topmenu-user pull-right col-lg-1 col-md-1 col-sm-1 col-xs-1">	  
	  <a class="navbar-brand glyphicon glyphicon-cog" href="${pageContext.request.contextPath}/mymenu/account_info" style="font-size: 1.5em;"></a>	  
	  </div> 
		<!--// setting -->		
		<!--// page header -->
		</div>
		<!-- page menu bar -->
		<!-- 추가 : article.member_id와 loginInfo의 id를 비교하여 버튼을 노출할 것인지를 판단 -->
		<div class="breadcrumb btn-group btn-block">
				<a href="${pageContext.request.contextPath}/mymenu/my_page" class="col-lg-4 col-md-4 col-sm-4 col-xs-4 btn btn-white btn-large"><i class="glyphicon glyphicon-th-large" style="font-size: 1.5em;"></i></a>
				<a href="${pageContext.request.contextPath}/mymenu/my_page2" class="col-lg-4 col-md-4 col-sm-4 col-xs-4 btn btn-white btn-large"><i class="glyphicon glyphicon-th-list" style="font-size: 1.5em;"></i></a>
	           <!-- 이부분 login info 가 아니라 몬가로 바꿔야함 -->		
				
				<a href="#" class="col-lg-4 col-md-4 col-sm-4 col-xs-4 btn btn-white btn-large"><i class="glyphicon glyphicon-bookmark" style="font-size: 1.5em;"></i></a>
               	
		</div>		
		<!--// page menu bar -->
		<!-- member article  -->
			   <div class="recent-container">
		      <!-- Recent Review Content  -->
		   
		       
		    	<c:choose>
		    		<c:when test="${fn:length(articleList) > 0}">
		    			<c:forEach var="article" items="${articleList}">
		    				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
		    				<div class="thumbnail">
		    				<c:url var="readUrl" value="/article/article_read">
					            		<c:param name="article_id" value="${article.id}" />
					      </c:url>
					            	<!-- 링크 + 썸네일 -->
					            	<a href="${readUrl}">
								<c:choose>
									<c:when test="${article.imagePath != null}">
										<c:url var="downloadUrl" value="/download">
											<c:param name="file" value="${article.imagePath}" />
										</c:url>
										<img src="${downloadUrl}" class="img-responsive"/>
									</c:when>
									<c:otherwise>
										<img src="${pageContext.request.contextPath}/assets/imgs/img/frog1.jpg" class="img-responsive"/>
									</c:otherwise>
								</c:choose>
							</a>
							<!--// 링크 + 썸네일 -->
					            	<!-- 제목 + 작성자 + 조회수 -->
					            	<div class="item">
								<h4><font size="4" color="#000069"> ${article.title} </font></h4>
								<div><font size="4" color="#000000">${article.nick_name}</font></div>
								<div class="clearfix">
									<div class="pull-left">${article.reg_date}</div>
									<div class="pull-right"><font size="4" color="#000069">	${article.category}</font></div>
								</div>
							</div>
							<!--// 제목 + 작성자 + 조회수 -->
		    				</div>
		    				</div>
		    				</c:forEach>
		    			
		    		</c:when>
		    		<c:otherwise>
		    			<tr>
				            <td colspan="5" class="text-center" style="line-height: 100px;">
				                No Post</td>
				        </tr>
		    		</c:otherwise>
		    	</c:choose>
		   
		   
		     		      
		      <!--// Recent Review Content  -->	
		      <!-- page number -->
		        <nav class="text-center">
		        <ul class="pagination">
<!-- 이전 그룹으로 이동 -->
<c:choose>
<c:when test="${pageHelper.prevPage > 0 }">
<!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
<!-- 이전 그룹으로 이동하기 위한 URL을 생성해서 "prevUrl"에 저장 -->
<c:url var="prevUrl" value="/mymenu/my_page">
<c:param name="keyword" value="${keyword}"></c:param>
<c:param name="page" value="${pageHelper.prevPage }"></c:param>
</c:url>
<li><a href="${prevUrl }">&laquo;</a></li>
</c:when>
<c:otherwise>
<!-- 이전 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
<li class="disabled"><a href="#">&laquo;</a></li>
</c:otherwise>
</c:choose>

<!-- 페이지 번호 -->
<!-- 현재 그룹의 시작페이지~끝페이지 사이를 1씩 증가하면서 반복 -->
<c:forEach var="i" begin="${pageHelper.startPage}" 
end="${pageHelper.endPage }" step="1">

<!-- 각 페이지 번호로 이동할 수 있는 URL을 생성하여 page_url에 저장 -->
<c:url var="pageUrl" value="/mymenu/my_page">
<c:param name="keyword" value="${keyword}"></c:param>
<c:param name="page" value="${i}"></c:param>
</c:url>

<!-- 반복중의 페이지 번호와 현재 위치한 페이지 번호가 같은 경우에 대한 분기 -->
<c:choose>
<c:when test="${pageHelper.page == i }">
<li class="active"><a href="#">${i}</a></li>
</c:when>
<c:otherwise>
<li><a href="${pageUrl }">${i}</a></li>
</c:otherwise>
</c:choose>
</c:forEach>
<!-- 다음 그룹으로 이동  -->
<c:choose>
<c:when test="${pageHelper.nextPage > 0 }">
<!-- 다음 그룹에 대한 페이지 번호가 존재한다면? -->
<!-- 다음 그룹으로 이동하기 위한 URL을 생성해서 "nextUrl"에 저장 -->
<c:url var="nextUrl" value="/mymenu/my_page">
<c:param name="keyword" value="${keyword}"></c:param>
<c:param name="page" value="${pageHelper.nextPage }"></c:param>
</c:url>
<li><a href="${nextUrl }">&raquo;</a></li>
</c:when>
<c:otherwise>
<!-- 이전 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
<li class="disabled"><a href="#">&raquo;</a></li>
</c:otherwise>
</c:choose>
</ul>
		        </nav>
		      <!--// page number -->           
		      </div>
		      <!--// Recent Review -->
		<!--// member article -->				
					
		</div>
	</div>

	<!-- 메인 화면 끝 -->

	<!-- footer -->
	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	<!--// footer -->
	
	
	

</body>
</html>