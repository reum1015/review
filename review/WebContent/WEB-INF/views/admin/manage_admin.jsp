<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/legalmenu.css" />

<style type="text/css">
.legal_form  {
padding-left: 40px;
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/template/topbar.jsp" />
	<jsp:include page="/WEB-INF/views/template/bottombar.jsp" />


	<div class="containers" >
		<!-- 왼쪽 정보편집부분 -->
		<div id="" class="legal_basic col-lg-2 col-md-3 col-sm-3  hidden-xs">
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
		<div class="legal_form col-lg-9  col-md-8 col-sm-8 col-xs-12">
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
                     
                     <!-- 회원 리스트 -->
			
			<div class="form-group">
				<h2>user email list</h2>
				<hr/>
				<div class="table-responsive">
		<table class="table table-hover">
		    <thead>
		        <tr>
		            <th class="text-center" style="width: 60px">user id</th>
		            <th class="text-center">email</th>
		            <th class="text-center" style="width: 90px">name</th>
		            <th class="text-center" style="width: 90px">nickname</th>
		            <th class="text-center" style="width: 60px">member_level</th>		            
		        </tr>
		    </thead>
		    <tbody>
		    <c:url var="readUser" value="/mymenu/user_page_mobile">					            						            	
					            	<c:param name="member_id" value="${check_id.id}" />
					      </c:url>	
		    				<tr>
					            <td class="text-center"><a href="${readUser}">${check_id.id}</a></td>					            
					            <td class="text-center">${check_id.email}</td>
					            <td class="text-center">${check_id.name}</td>
					            <td class="text-center"><a href="${readUser}">${check_id.nick_name}</a></td>
					              <td class="text-center">${check_id.member_level}</td>
				        	</tr>
		    	
		    </tbody>
		</table>
	</div>
	 
			
			  </div>
			<!--// 회원 리스트  -->
                     
			<form class="form-horizontal" name="sign_up_form" method="post" id="myform"
      action="${pageContext.request.contextPath}/admin/manage_admin_update">
			<div class="form-groups">
				<h2>update administrator user</h2>			
				<div class="form-groups">				
			<div>
					<input type="text" id="id" name="id" style="margin-right: 50px;" class=" col-lg-4 col-md-4 col-sm-4 col-xs-4"
							value="${id}" placeholder="id" />
						
							<input type="text" id="member_level" name="member_level" class="col-offset-lg-2 col-lg-4 col-md-4 col-sm-4 col-xs-4"
							 placeholder="member_level" />					 
			  </div>
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
	                 
						<button type="submit" class="btn btn-warning btn-block">Admin update</button>							
                     </div>
                     </form>	
			</fieldset>
				<br/>	
    <br/>	
      <br/>	
      <br/>	
    <br/>	
			
		</div>		
		<!--// 오른쪽 내용 -->

	</div>

	<!-- footer -->

	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	<!--// footer -->

</body>
</html>