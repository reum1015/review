<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
 
 <!-- main css -->
 
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/article_list_main.css" />

<style type="text/css">
.container {
margin-top: -35px;
}
</style>

</head>
<body>
	  <jsp:include page="/WEB-INF/views/template/topbar_mobile.jsp"/>
	  <jsp:include page="/WEB-INF/views/template/bottombar.jsp"/>

	<!-- 메인 화면 시작 -->
		<div class="container  col-lg-offset-1 col-lg-10 col-md-offset-1 col-md-10">		
		    <!-- Recent Review -->
		       <div class="recent-container">
		       <h1 class="page-header">
		       <small>Review List</small></h1>
		      <!--// Recent Review category -->
		      <!-- Recent Review Content  -->
		     <div class="review-content row multi-columns-row">
		       
		    	<c:choose>
		    		<c:when test="${fn:length(articleList) > 0}">
		    			<c:forEach var="article" items="${articleList}">
		    				<div class=" col-lg-3 col-md-3 col-sm-4 col-xs-6">
		    				<div class="thumbnail">
		    				<c:url var="readUrl" value="/article/article_read_mobile">
					            <c:param name="article_id" value="${article.id}" />
					            	</c:url>
					            	<c:url var="readUser" value="/mymenu/user_page_mobile">					            						            	
					            		<c:param name="member_id" value="${article.member_id}" />
					            	</c:url>
					            	<!-- 링크 + 썸네일 -->
					            	<a href="${readUrl}">
								<c:choose>
									<c:when test="${article.imagePath != null}">
										<c:url var="downloadUrl" value="/download">
											<c:param name="file" value="${article.imagePath}" />
										</c:url>
										<img alt="image" src="${downloadUrl}" class="img-responsive img-rounded"/>
									</c:when>
									<c:otherwise>
									<img alt="noimage" src="${pageContext.request.contextPath}/assets/imgs/img/no_image_article.png" height="190px" width="220px" class="img-rounded img-responsive"/>
									</c:otherwise>
								</c:choose>
							</a>
							<!--// 링크 + 썸네일 -->
					            	<!-- 제목 + 작성자 + 조회수 -->
					            <div class="item">
					            	<h6  ><font size="4" color="#FF8000">	${article.category}</font></h6>
								<h4 style="overflow:hidden;white-space:nowrap; text-overflow:ellipsis; width:auto;"><font size="4" color="#a0a0a0"> ${article.title} </font></h4>								
								<div><a href="${readUser}"><font size="4" color="#585858">${article.nick_name}</font></a></div>
								<div class="clearfix">	
								<div class="pull-right"><font size="2" color="#000">${article.reg_date}</font></div>
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
		   
		   
		      </div>		      
		      <!--// Recent Review Content  -->	
		      <!-- page number -->
		        <nav class="text-center">
		        <ul class="pagination">
<!-- 이전 그룹으로 이동 -->
<c:choose>
<c:when test="${pageHelper.prevPage > 0 }">
<!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
<!-- 이전 그룹으로 이동하기 위한 URL을 생성해서 "prevUrl"에 저장 -->
<c:url var="prevUrl" value="/article/article_list_main_mobile">
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
<c:url var="pageUrl" value="/article/article_list_main_mobile">
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
<c:url var="nextUrl" value="/article/article_list_main_mobile">
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
		      
		</div>
		<!-- 메인 화면 끝 -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	
	
</body>
</html>