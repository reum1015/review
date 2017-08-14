<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/legalmenu.css" />


</head>
<body>
	<jsp:include page="/WEB-INF/views/template/topbar.jsp" />
	<jsp:include page="/WEB-INF/views/template/bottombar.jsp" />


	<div class="containers" >
		<!-- 왼쪽 정보편집부분 -->
		<div id="" class="legal_basic col-lg-2 col-md-3 hidden-sm hidden-xs">
			<div class="btn btn-link">
				<a href="${pageContext.request.contextPath}/admin/manage_article">
				<font	size="5">Manage Article</font></a>
			</div>
			<br />
			<div class="btn btn-link ">
				<a href="${pageContext.request.contextPath}/admin/manage_user"><font
					size="5">Manage User</font></a>
			</div>			
			<br />
			<div class="btn btn-link">
				<a href="${pageContext.request.contextPath}/admin/manage_admin">
				<font	size="5">Manage Admin</font></a>
			</div>
			<br />			
			<div class="btn btn-link">
				<a href="${pageContext.request.contextPath}/admin/user_email_list">
				<font	size="5">User Email List</font></a>
			</div>
			<br />
			 <br />
		</div>
		<!--// 왼쪽 정보편집부분 -->	
		<!-- 오른쪽 내용 -->	
		<div id="" class="legal_form col-lg-8  col-md-7 col-sm-12 col-xs-12">
			<fieldset>
				<legend><h1>Manage User</h1></legend>
			<form class="form-horizontal" name="sign_up_form" method="post" id="myform"
      action="${pageContext.request.contextPath}/admin/manage_admin_check">
      	<div class="form-groups">
				<h2>check user Id  <font size="15" color="#484848">${check_id.id}</font></h2>
			<div>
					<input type="text" id="nick_name" name="nick_name" style="margin-right: 50px;" class=" col-lg-6 col-md-6 col-sm-6 col-xs-6"
							value="${nick_name}" placeholder="nick_name" />
							<button type="submit" class="btn-warning col-lg-3 col-md-3 col-sm-3 col-xs-3">Id Check</button>							
				</div>
							
			  </div>	
			  <br />	         
                       <br />				
			   <hr/>
                     </form>	
			<form class="form-horizontal" name="sign_up_form" method="post" id="myform"
      action="${pageContext.request.contextPath}/admin/manage_admin_update">
			<div class="form-groups">
				<h2>update administrator user</h2>			
			<div>
					<input type="text" id="id" name="id" style="margin-right: 50px;" class=" col-lg-6 col-md-6 col-sm-6 col-xs-6"
							value="${id}" placeholder="id" />							
				</div>
			  </div>	
			 
			  	<br />			  	
			  	<br />
			  	<br />	
			  	<br />
			  					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">               
               <button type="button" class="btn btn-danger form-control" onclick="history.back();">Cancel</button>
               </div>  				  									
	                 <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" >
	                 
						<button type="submit" class="btn btn-warning btn-block">Save Setting</button>							
                     </div>
                     </form>	

			</fieldset>
		</div>		
		<!-- 오른쪽 내용 -->

	</div>

	<!-- footer -->

	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	<!--// footer -->

</body>
</html>