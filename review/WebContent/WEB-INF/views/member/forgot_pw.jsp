<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
 
 <!-- main css -->
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css"/>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/eachMain.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/login_main.css" />

<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/template/topbar.jsp"/>
  <jsp:include page="/WEB-INF/views/template/bottombar.jsp"/>
	<!-- 메인 화면 시작 -->	
		<div class="container" style="min-height: 450px;">		
	<div class="row">
    <div class="col-lg-6 col-md-6 col-md-offset-3" style="margin-top: 80px;">
      <h1 class="page-header">Reset Password</h1>
      <p>
            We can help you find your password using your 
            Review&Bang email address linked to your account.
      </p>
      
      <!-- 이메일 주소 입력 폼 시작 -->
      <form name="myform" method="post" action="${pageContext.request.contextPath}/member/forgot_pw_ok">
        <div class="form-group">
          <input type="text" name="email" class="form-control" placeholder="email" />
        </div>
        <div class="form-group">
          <button type="submit" class="btn btn-warning btn-block">Reset Password</button>
        </div>
      </form>
      <!-- // 이메일 주소 입력폼 끝 -->
    </div>
  </div>				
		</div>
		<!-- 메인 화면 끝 -->
	


	

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	
	
</body>
</html>