<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/mymenu.css" />

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
	  <jsp:include page="/WEB-INF/views/template/topbar.jsp"/>
  <jsp:include page="/WEB-INF/views/template/bottombar.jsp"/>
  

	<!-- 메인 화면 시작 -->
	<div class="container">
	<div class="container_edit">
		<!-- 왼쪽 정보편집부분 -->
		<div class="account_basic col-lg-3 col-md-3 hidden-sm hidden-xs">
		   	<div class="btn btn-link edit">
		   	<a href="${pageContext.request.contextPath}/mymenu/account_info"><font size="4" color="#2E2EFE">Account Info</font></a>
		   	</div>
		   	<br  />
		   	<div class="btn btn-link edit">
		   	<a href="${pageContext.request.contextPath}/mymenu/edit_profile"><font size="4" color="#2E2EFE">Edit Profile</font></a>
		   	</div>
		   	<br  />
		   	  	<div class="btn btn-link edit">
		   	<a href="${pageContext.request.contextPath}/mymenu/edit_pic?member_id=${loginInfo.id}"><font size="4" color="#2E2EFE">Change Picture</font></a>
		   	</div>
		   	<br  />
		   	<div class="btn btn-link edit">
		   	<a href="${pageContext.request.contextPath}/mymenu/log_out"><font size="4" color="#2E2EFE">Log out</font></a>
		   	</div>
		   	<br  />		    	  
		</div>
		<!--// 왼쪽 정보편집부분 -->
			<!-- Edit account-->	
		<div class="edit_form col-lg-offset-1 col-lg-5 col-md-offset-1 col-md-5 col-sm-12 col-xs-12">		
				<fieldset>
						<legend>Edit Profile</legend>						
		<form class="form-horizontal" name="sign_up_form" method="post"
      action="${pageContext.request.contextPath}/mymenu/edit_pic_ok" enctype="multipart/form-data">
				
							
				
			<div class="form-groups">
			<label for="picture" class="pull-left">Picture</label>
			</div>
			<br />
			<div class="form-groups">			
			<input type="file" id="article_img" name="article_img" class="form-control" />
			
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
				<br />			
			 	<br />	
				<br />	 
				<div class="form-group">
             <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">               
               <button type="button" class="btn cancel form-control" onclick="history.back();"><font size="4" face="Helvetica"  color="#fff">Cancel</font></button>
               </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">               
               <button type="submit" class="btn ok form-control"><font size="4"  face="Arial, Helvetica, sans-serif" color="#28282"><B>Save Setting</B></font></button>
             </div>            
            </div>  	
                     </form>		
					</fieldset>
				
			</div>		
		<!--// Edit account -->				
		</div>
	</div>

	<!-- 메인 화면 끝 -->

	<!-- footer -->
	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	<!--// footer -->
	
	
	

</body>
</html>