<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!-- 공통 하단 영역 -->

<div class="container" style="margin-top:20px; margin-bottom: -68px;">

<footer id="footer" >
<div>
<p class="pull-right"><a href="#">Back to top</a></p>
<p class="pull-left"> &copy;Review&amp;Bang&ensp;</p>
<p class="pull-left">
    <a href="${pageContext.request.contextPath}/legal/privacy">Privacy</a>&ensp; 
	<a href="${pageContext.request.contextPath}/legal/terms">Terms</a> &ensp;
	<a href="${pageContext.request.contextPath}/legal/feedback">Feedback</a>&ensp;
	 <c:if test="${loginInfo.member_level == 'BB'}">
	<a href="${pageContext.request.contextPath}/admin/admin_mobile">admin</a>
    	</c:if>
	
</p>
</div>
</footer>
</div>