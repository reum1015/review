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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/article.css" />


<style type="text/css">
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/template/topbarsearch.jsp" />
	<jsp:include page="/WEB-INF/views/template/bottombar.jsp" />

	<!-- 메인 화면 시작 -->
	<div class="container">
		<div class="container_write">
			<!-- Write Review -->
			<form class="form-horizontal" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/article/article_edit_ok">
				<input type="hidden" name="article_id" value="${article_id}" />
				<!-- file upload -->
				<div class="form-group">
					<label for="file" class="col-lg-12 col-md-12 col-sm-12 hidden-xs">Photo</label>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<input type="file" class="form-control" id=file name="file" />

						<!-- 첨부파일 리스트가 존재할 경우만 삭제할 항목 선택 가능 -->
						<c:if test="${readArticle != null}">
							<c:forEach var="file" items="${readArticle}">
								<!-- 이미지를 다운받기 위한 URL 구성 -->
								<c:url value="/download" var="downloadUrl">
									<c:param name="file" value="${file.imagePath}" />
								</c:url>

								<div class="checkbox">
									<label> <input type="checkbox" name="del_file"
										id="img_del" value="${file.id}" /> ${file.imagePath} 삭제하기 <a
										href="${downloadUrl}">[다운받기]</a>
									</label>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<!-- category -->
				
				
				<c:if test="${readArticle != null}">
							<c:forEach var="file" items="${readArticle}">
				
				<div class="form-group">
					<label for="category"
						class="col-lg-12 col-md-12 col-sm-12 hidden-xs">keyword</label>
					<div class="col-lg-12 col-md-12 col-sm-8 col-xs-8">
						<input type="text" class="form-control col-xs-4" id="category" name="category" value="${file.category}" />
					</div>
				</div>
				<!-- title -->
				<div class="form-group">
					<label for="title" class="col-lg-12 col-md-12 col-sm-12 hidden-xs">title</label>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<input type="text" class="form-control" id="title" name="title"
							value="${file.title}" />
					</div>
				</div>
				<!-- content -->
				<div class="form-group">
					<label for="content"
						class="col-lg-12 col-md-12 col-sm-12 hidden-xs">content</label>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<textarea id="content" name="content"
							style="width: 100%; height: 150px;">${file.content}</textarea>
					</div>
				</div>
				
				</c:forEach>
					</c:if>
				<div class="form-group">
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
						<button type="button" class="btn btn-danger form-control"
							onclick="history.back();">Cancel</button>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
						<button type="submit" class="btn btn-primary form-control">Post</button>
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