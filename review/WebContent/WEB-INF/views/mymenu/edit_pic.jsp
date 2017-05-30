<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/mymenu.css" />



</head>
<body>
	  <jsp:include page="/WEB-INF/views/template/topbar.jsp"/>
  <jsp:include page="/WEB-INF/views/template/bottombar.jsp"/>
  

	<!-- 메인 화면 시작 -->
	<div class="container">
	<div class="container_edit">
		<!-- 왼쪽 정보편집부분 -->
		<div class="account_basic col-lg-3 col-md-3 hidden-sm hidden-xs">
		   	<div class="btn btn-default edit">
		   	<a href="${pageContext.request.contextPath}/mymenu/account_info"><font size="4" color="#2E2EFE">Account Info</font></a>
		   	</div>
		   	<br  />
		   	<div class="btn btn-default edit">
		   	<a href="${pageContext.request.contextPath}/mymenu/edit_profile"><font size="4" color="#2E2EFE">Edit Profile</font></a>
		   	</div>
		   	<br  />
		   	  	<div class="btn btn-default edit">
		   	<a href="${pageContext.request.contextPath}/mymenu/edit_pic"><font size="4" color="#2E2EFE">Change Picture</font></a>
		   	</div>
		   	<br  />
		   	<div class="btn btn-default edit">
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
			<input type="file" id="file" name="file" class="form-control" />
			
				<c:if test="${fileList != null}">
					<c:forEach var="file" items="${fileList}">
	            		<!-- 이미지를 다운받기 위한 URL 구성 -->
		            	<c:url value="/download.do" var="downloadUrl">
		            		<c:param name="file" value="${file.fileDir}/${file.fileName}" />
		            	</c:url>
		            	
		            	<div class="checkbox">
			            	<label>
			            		<input type="checkbox" name="del_file" id="img_del" value="${file.id}" /> 
			            		${file.originName} Delete
			            		<a href="${downloadUrl}">[download]</a>
			            	</label>
			            </div>
					</c:forEach>
				</c:if>
			</div>			
				<br />
				<br />		
			<div class="form-groups">
			<label for="about" class="pull-left">About you</label>
			<textarea class="form-control" id="introduce" name="introduce" >
			${loginInfo.introduce}
			</textarea> 
			  </div>	
			 	<br />	
				<br />										
	              <div class="btn_sign_up" >
				<button type="submit" class="btn btn-warning btn-block">Save Setting</button>							
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