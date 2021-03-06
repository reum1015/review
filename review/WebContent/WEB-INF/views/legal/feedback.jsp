<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/legalmenu.css" />

</head>
<body>
	<jsp:include page="/WEB-INF/views/template/topbar.jsp"/>
  <jsp:include page="/WEB-INF/views/template/bottombar.jsp"/>
	<!-- 메인 화면 시작 -->	
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
	<div class="row">
    <div class="col-lg-offset-1 col-md-offset-1  col-lg-6 col-md-6 col-sm-12 col-xs-12" style="margin-top: 40px;">
      <div ></div>
      <h1 class="page-header" style="text-align: center;">How can I help you?</h1>
      
      <!-- 이메일 주소 입력 폼 시작 -->
       <form name="myform" method="post" action="${pageContext.request.contextPath}/legal/feedback_ok">
        <div class="form-group"> 
            <p>Customer feedback is extremely important to us and 
            we'd love to hear about your customer experience.</p>
        </div>
        
         <div class="form-group">
          <div class="form-group">
          <input type="text" name="email" class="form-control" placeholder="Please enter the e-mail address." />
          <p>Please enter the e-mail address associated with your Review&Bang account.</p>
        </div>
         <h5><strong>Subject:</strong>Feedback to Review&Bang.com</h5>
          <textarea id="contents" name="contents" style="width: 100%; height: 150px;" placeholder="Comments"></textarea>
        </div>
        <div class="form-group">
             <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">               
               <button type="button" class="btn btn-danger form-control" onclick="history.back();">Cancel</button>
               </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">               
               <button type="submit" class="btn btn-primary form-control">Send Message</button>
             </div>            
            </div>
      </form>
      <!-- // 이메일 주소 입력폼 끝 -->
    </div>
  </div>				
		</div>
		<!-- 메인 화면 끝 -->

	<!-- footer -->
	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	<!--// footer -->
	
</body>
</html>
