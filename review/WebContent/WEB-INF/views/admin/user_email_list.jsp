<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>

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
			<h1><font size="15" color="#484848">User Email List</font></h1>
			<form class="form-horizontal" method="post" id="myform"
      action="${pageContext.request.contextPath}/admin/user_email_list_ok">			
			<div class="form-groups">				
			<div>
					<input type="text" id="reg_date1" name="reg_date1" style="margin-right: 50px;" class=" col-lg-4 col-md-4 col-sm-4 col-xs-4"
							value="${reg_date1}" placeholder="date1" />							
					<input type="text" id="reg_date2" name="reg_date2" class="col-offset-lg-2 col-lg-4 col-md-4 col-sm-4 col-xs-4"
							value="${reg_date2}" placeholder="date2"/>					 
			  </div>
			  </div>			 
			  <br/>	
			    <br/>	
			      <br/>			
			<hr/>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">               
               <button type="button" class="btn btn-danger form-control" onclick="history.back();">Cancel</button>
               </div>  				  									
	                 <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" >	                 
						<button type="submit" class="btn btn-warning btn-block">Save Setting</button>							
                     </div>
                     </form>
			</fieldset>
			     <div class="form-groups">
				<h2>user email list</h2>
				<hr/>
				<div class="table-responsive">
		<table class="table table-hover">
		    <thead>
		        <tr>
		            <th class="text-center" style="width: 100px">user id</th>
		            <th class="text-center">email</th>
		            <th class="text-center" style="width: 120px">name</th>
		            <th class="text-center" style="width: 100px">nickname</th>		            
		        </tr>
		    </thead>
		    <tbody>
		    	<c:choose>
		    		<c:when test="${fn:length(emailList) > 0}">
		    			<c:forEach var="member" items="${emailList}">
		    			<c:url var="readUser" value="/mymenu/user_page_mobile">					            						            	
					            	<c:param name="member_id" value="${member.id}" />
					      </c:url>		    			
		    				<tr>
					            <td class="text-center"><a href="${readUser}">${member.id}</a></td>					            
					            <td class="text-center">${member.email}</td>
					            <td class="text-center">${member.name}</td>
					            <td class="text-center">${member.nick_name}</td>
				        	</tr>
		    			</c:forEach>
		    		</c:when>
		    		<c:otherwise>
		    			<tr>
				            <td colspan="5" class="text-center" style="line-height: 100px;">
				                조회된 email 목록이 없습니다.</td>
				        </tr>
		    		</c:otherwise>
		    	</c:choose>
		    </tbody>
		</table>
	</div>
	  <!-- page number -->
		        <nav class="text-center">
		        <ul class="pagination">
<!-- 이전 그룹으로 이동 -->
<c:choose>
<c:when test="${pageHelper.prevPage > 0 }">
<!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
<!-- 이전 그룹으로 이동하기 위한 URL을 생성해서 "prevUrl"에 저장 -->
<c:url var="prevUrl" value="/admin/user_email_list">
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
<c:url var="pageUrl" value="/admin/user_email_list">
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
<c:url var="nextUrl" value="/admin/user_email_list">
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
			  			<br/>	
    <br/>	
      <br/>	
      <br/>	
    <br/>	
		</div>		
		<!-- 오른쪽 내용 --> 
</div>
	<!-- footer -->

	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	<!--// footer -->

</body>
</html>