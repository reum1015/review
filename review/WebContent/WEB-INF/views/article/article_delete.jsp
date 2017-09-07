<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>

<!-- main css -->
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/assets/css/article_list.css" />

</head>
<body>
	<jsp:include page="/WEB-INF/views/template/topbar.jsp" />
	<jsp:include page="/WEB-INF/views/template/bottombar.jsp" />

	<!-- 메인 화면 시작 -->
	
	<div class="container">
      
      <form name="myform" method="post" action="${pageContext.request.contextPath}/article/article_delete_ok">
      <input type="hidden" name="article_id" value="${article_id}" />
      <div class="" style='width: 300px; margin: 200px auto;'>
			<!-- 자신의 글인 경우와 아닌 경우에 대한 분기 -->	
			<c:choose>
				<c:when test="${myArticle == true}">
					<!-- 자신의 글에 대한 삭제 -->
					<p>Do you want to delete post?</p>
				</c:when>
				<c:otherwise>					
				</c:otherwise>
			</c:choose>
			<div class="form-group">
				<button type='submit' class='btn btn-danger btn-block'>delete</button>
				<button type='button' class='btn btn-primary btn-block' 
					onclick="history.back()">cancel</button>
			</div>
		</div>
      
      </form>		
		
	</div>

	<!-- 메인 화면 끝 -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


</body>
</html>