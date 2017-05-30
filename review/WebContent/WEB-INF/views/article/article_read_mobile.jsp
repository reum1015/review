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
.container {
height: auto;
}
.thumbnail {
margin-top: 30px;
}
</style>

</head>
<body>
	  <jsp:include page="/WEB-INF/views/template/topbarsearch.jsp"/>
	  <jsp:include page="/WEB-INF/views/template/bottombar.jsp"/>

	<!-- 메인 화면 시작 -->
		<div class="container">			
		       <!-- content head  -->
		        <hr />		       
		     <!--// content head  -->		
		       	<!-- Review Content  -->		     
		      <!-- content body -->
		      <div class="content_body">		    
		    <!-- content body picture -->		          
		<div class="review-content row multi-columns-row">		       
		    	<c:choose>
		    		<c:when test="${fn:length(readArticle) > 0}">
		    			<c:forEach var="article" items="${readArticle}">
		    				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		    				<div class="thumbnail col-lg-12 col-md-12 col-sm-12 col-xs-12">
		    				<c:url var="readUrl" value="/article/article_read">
					            		<c:param name="article_id" value="${article.id}" />
					            	</c:url>
					            	<!-- 링크 + 썸네일 -->
					            	<div class="read-container" >
			                 <h3 class="page-header" style="text-align: left; margin-top: 15px;"> 
			                 ${article.nick_name}  
			                 <span class="pull-right"> 
												<!--  ** 페이지 호출 할 때 article_id를 url에 포함하여 삭제 페이지를 호출 할 때 article_id를 넘겨주는 소스입니다.  --> 
												<!-- 추가 : article.member_id와 loginInfo의 id를 비교하여 버튼을 노출할 것인지를 판단 -->
												<c:if test="${article.member_id==loginInfo.id}">
													<a href="${pageContext.request.contextPath}/article/article_edit?article_id=${article.id}">
						                  				<i class="glyphicon glyphicon-edit"></i></a>
						                  	 		<a href="${pageContext.request.contextPath}/article/article_delete?article_id=${article.id}">
						                  	  			<i class="glyphicon glyphicon-remove"></i></a>
												</c:if>
											</span> <br /> 		
				 <small>${article.reg_date}</small>
				 <small class="pull-right"> Hit: ${article.hit}</small>
				 <br />			
				 <small><font size="4" color="#28282 "> keyword: </font> <font size="4" color="#a0a0a0">	${article.category}</font></small>
				 <br />			
				 <small><font size="4" color="#28282 ">title:</font><font size="4" color="#a0a0a0"> ${article.title} </font></small>
			            </h3>						
		</div>		     
					            <a href="${readUrl}" class="col-lg-4 col-md-4 col-sm-4">
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
					            	<div class="item col-lg-8 col-md-8 col-sm-7">
								<div style="overflow: auto; width:100%; max-height: 350px;">								
								${article.content}
								</div>
								</div>							
							<!--// 제목 + 작성자 + 조회수 -->
							<br/>
							<!-- like + comment + book mark -->		
							<div class="btn-group btn-block">
							 <a href="#" class="col-xs-4 btn btn-white btn-large"><i class="">Like</i></a>
							 <a href="#" class="col-xs-4 btn btn-white btn-large"><i class="">Comment</i></a>
							 <a href="#" class="col-xs-4 btn btn-white btn-large"><i class="">Book mark</i></a>
							</div>					
								    				
		    				<!--// like + comment + book mark -->
		    				</div>
		    				</div>
		    				</c:forEach>		    			
		    		</c:when>
		    		<c:otherwise>
		    			<tr>
				            <td colspan="5" class="text-center" style="line-height: 100px;">
				                조회된 글이 없습니다.</td>
				        </tr>
		    		</c:otherwise>
		    	</c:choose>		   
		      </div>			 
	 <!--// content body picture -->	   
		      </div>
		       <!--// content body -->    		     	      
		      <!--// Review Content  -->
		      <!-- comment -->
		      <div>
		      
		      </div>
		      <!--// comment -->   
		      </div>
		
		<!-- 메인 화면 끝 -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	
	
</body>
</html>