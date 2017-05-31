<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
 
 <!-- main css -->
 

<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/template/topbar.jsp"/>
  <jsp:include page="/WEB-INF/views/template/bottombar.jsp"/>
	<!-- 메인 화면 시작 -->	
		<div class="container" style="min-height: 500px;">		
	<div class="row">
    <div class="col-lg-6 col-md-6 col-md-offset-3 col-sm-12 col-xs-12" style="margin-top: 40px;">
      <h2 class="page-header">Introduce Review&Bang to your friends</h2>
      
      <!-- 이메일 주소 입력 폼 시작 -->
       <form name="myform" method="post" action="${pageContext.request.contextPath}/member/invite_ok">
        <div class="form-group">
          <input type="text" name="email" class="form-control" placeholder="your friend's email" />
        </div>
        
         <div class="form-group">
          <textarea id="contents" name="contents" style="width: 100%; height: 150px;" placeholder="Introduce Review&bang"></textarea>
        </div>
        <div class="form-group">
             <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">               
               <button type="button" class="btn btn-danger form-control" onclick="history.back();">Cancel</button>
               </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">               
               <button type="submit" class="btn btn-primary form-control">Invite</button>
             </div>            
            </div>
      </form>
      <!-- // 이메일 주소 입력폼 끝 -->
    </div>
  </div>				
		</div>
		<!-- 메인 화면 끝 -->




		 
		 
		 
		 	<!-- 메인 화면 끝 -->

	<!-- footer -->
	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	<!--// footer -->
	
	
	

</body>
</html>
