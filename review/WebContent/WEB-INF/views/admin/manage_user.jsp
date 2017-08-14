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
      action="${pageContext.request.contextPath}/admin/manage_user_ok">
			<div class="form-groups">
			<h2>Total Sign Up User <font size="15" color="#484848">${total_count}</font></h2>			
			</div>				
			<hr/>
			<div class="form-groups">
				<h2>Sign Up User <font size="15" color="#484848">${total_article_date}</font></h2>
			<div>
					<input type="text" id="reg_date1" name="reg_date1" style="margin-right: 50px;" class=" col-lg-4 col-md-4 col-sm-4 col-xs-4"
							value="${reg_date1}" placeholder="date1" />							
					<input type="text" id="reg_date2" name="reg_date2" class="col-offset-lg-2 col-lg-4 col-md-4 col-sm-4 col-xs-4"
							value="${reg_date2}" placeholder="date2"/>					 
			  </div>
			  </div>
			  <br/>
			  <br/>
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