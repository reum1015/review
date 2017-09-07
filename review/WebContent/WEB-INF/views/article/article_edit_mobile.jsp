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
   .container_write {
   width: 90%;
      margin-top: 60px;
      }
     
</style>

</head>
<body>
	  <jsp:include page="/WEB-INF/views/template/topbar_mobile.jsp"/>
	  <jsp:include page="/WEB-INF/views/template/bottombar.jsp"/>

	<!-- 메인 화면 시작 -->
		<div class="container">		
		<div class="container_write">
		<h1 class="page-header">
			<small>Post edit</small>
			</h1>
		      <!-- Write Review -->
		   <form class="form-horizontal" method="post" enctype="multipart/form-data"
            action="${pageContext.request.contextPath}/article/article_edit_mobile_ok">
            
            <input type="hidden" name="article_id" value="${readArticle.id}" />

         <!-- 파일업로드 -->
		<div class="form-group">
			<label for="file" class="col-sm-2 control-label">photo</label>
			<div class="col-sm-10">
				<input type="file" class="form-control" id="article_img" name="article_img"  />
				
				<!-- 첨부파일 리스트가 존재할 경우만 삭제할 항목 선택 가능 -->
				<c:if test="${fileList != null}">
					<c:forEach var="file" items="${fileList}">
	            		<!-- 이미지를 다운받기 위한 URL 구성 -->
		            	<c:url value="/download" var="downloadUrl">
		            		<c:param name="file" value="${file.fileDir}/${file.fileName}" />
		            	</c:url>
		            	
		            	<div class="checkbox">
			            	<label>
			            		<input type="checkbox" name="del_file" id="img_del" value="${file.id}" /> 
			            		${file.originName} Delete
			            		<a href="${downloadUrl}">[download]</a>
			            	</label>
			            	<script type="text/javascript">
			            	  $(function() {
			            		  // 이미지가 등록된 상태이므로, 파일의 신규 등록을 방지
			            		  $("#article_img").prop("disabled", true);
			            		  $("#img_del").change(function() {
			            			  $("#article_img").prop("disabled", !$(this).is(":checked"));
			            		  });
			            	  });			            	  
			            	</script>
			            </div>
					</c:forEach>
				</c:if>
			</div>
		</div>       
     <!-- keyword -->
		<div class="form-group">
			<label for="category" class="col-sm-2 control-label">category</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="category" name="category"  value="${readArticle.category}"/>
			</div>
		</div>
        <!-- 제목 -->
		<div class="form-group">
			<label for="title" class="col-sm-2 control-label">title</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="title" name="title"  value="${readArticle.title}"/>
			</div>
		</div>
		<!-- 내용 -->
		<div class="form-group">
			<label for="content" class="col-sm-2 control-label">content</label>
			<div class="col-sm-10">
			<textarea id="content" name="content" style="width: 100%; height: 240px;" placeholder="what's your experience?">${readArticle.content}</textarea>			
			</div>
		</div>		

		<!-- 버튼들 -->
		<div class="form-group ">
             <div class="col-lg-offset-2 col-md-offset-2 col-lg-5 col-md-5 col-sm-6 col-xs-6">               
               <button type="button" class="btn btn-danger form-control" onclick="history.back();">Cancel</button>
               </div>
                <div class="col-lg-5 col-md-5 col-sm-6 col-xs-6">               
               <button type="submit" class="btn btn-primary form-control">Save</button>
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