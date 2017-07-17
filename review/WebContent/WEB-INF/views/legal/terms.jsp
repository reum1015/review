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
				<a href="${pageContext.request.contextPath}/legal/privacy">
				<font	size="5">Privacy Policy</font></a>
			</div>
			<br />
			<div class="btn btn-link ">
				<a href="${pageContext.request.contextPath}/legal/terms"><font
					size="5">Terms of Use</font></a>
			</div>
			<br />
			<div class="btn btn-link">
				<a href="${pageContext.request.contextPath}/legal/feedback"><font
					size="5">Feedback</font></a>
			</div>
			<br /> <br />
		</div>
		<!--// 왼쪽 정보편집부분 -->		
		<div id="" class="legal_form col-lg-8  col-md-7 col-sm-12 col-xs-12">
			<fieldset>
				<legend><h1>Terms of Use</h1></legend>
				<p>Welcome to Review&Bang. Review&Bang provides a fast and fun
					way for you to share review through our content-sharing platform.
					Just share your experience, the look and feel, add comments (if you like)!</p>
				





			</fieldset>
		</div>		
		<!--//  Account info -->

	</div>

	<!-- footer -->

	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	<!--// footer -->

</body>
</html>