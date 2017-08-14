<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/mymenu.css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/validate/jquery.validate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/validate/additional-methods.min.js"></script>

<style type="text/css">
.cancel {
background-color: #585858;
}
.ok {
background-color: #FF8000;
}
</style>

<script type="text/javascript">
$(function() {
	// form태그에 부여한 id속성에 대한 유효성 검사 함수 호출
	$("#myform").validate({
		/** 입력검사 규칙 */
		rules: {			
			age: {
				required: true,
				digits: true,
				min: 13
			},					
			
		},
		/** 규칙이 맞지 않을 경우의 메시지 */
		messages: {
			
			age: {
				required: "age field is required.",
				digits: "please enter a valid number.",
				min: "You must be over 13 years old. "
			},
					
		}
	}); // end validate()
});
</script>

</head>
<body>
	  <jsp:include page="/WEB-INF/views/template/topbar.jsp"/>
  <jsp:include page="/WEB-INF/views/template/bottombar.jsp"/>
  

	<!-- 메인 화면 시작 -->
	<div class="container">
	<div class="container_edit">
		<!-- 왼쪽 정보편집부분 -->
		<div class="account_basic col-lg-3 col-md-3 hidden-sm hidden-xs">
		   	<div class="btn btn-link edit">
		   	<a href="${pageContext.request.contextPath}/mymenu/account_info"><font size="4" color="#2E2EFE">Account Info</font></a>
		   	</div>
		   	<br  />
		   	<div class="btn btn-link edit">
		   	<a href="${pageContext.request.contextPath}/mymenu/edit_profile"><font size="4" color="#2E2EFE">Edit Profile</font></a>
		   	</div>
		   	<br  />
		   	  	<div class="btn btn-link edit">
		   	<a href="${pageContext.request.contextPath}/mymenu/edit_pic?member_id=${loginInfo.id}"><font size="4" color="#2E2EFE">Change Picture</font></a>
		   	</div>
		   	<br  />
		   	<div class="btn btn-link edit">
		   	<a href="${pageContext.request.contextPath}/mymenu/log_out"><font size="4" color="#2E2EFE">Log out</font></a>
		   	</div>
		   	<br  />		    	  
		</div>
		<!--// 왼쪽 정보편집부분 -->
			<!-- Account info-->	
		<div class="edit_form col-lg-offset-1 col-lg-5 col-md-offset-1 col-md-5 col-sm-12 col-xs-12">		
				<fieldset>
						<legend>Edit Profile</legend>						
		<form class="form-horizontal" name="sign_up_form" method="post" id="myform"
      action="${pageContext.request.contextPath}/mymenu/edit_profile_ok">
				
				
				
				<div class="form-groups-age">
				<label for="age" class="pull-left">age</label>
				 <input type="text" id="age" name="age" class="form-control" 
					  value="${loginInfo.age}" /> 
			  </div>		
			  <br />
			    	<div class="form-groups">
			 <label for="about" class="pull-left">About you</label>
			<textarea class="form-control" id="introduce" name="introduce"  placeholder="about you">
			${loginInfo.introduce}
			</textarea> 
			  </div>	
			  
			  
			  		<br />
				<div class="form-groups">		
				<label for="gender" class="pull-left">gender</label>						
						<div class="btn-group btn-group-justified" role="group" aria-label="${pageContext.request.contextPath}.">
							  <div class="btn-group" role="group">
							  <label class="btn btn-link gender">
							  <input type="radio" name="gender" value="M" 
							  <c:if test="${loginInfo.gender == 'M'}">checked</c:if> /><span>M</span></label>							  
							  </div>
							  <div class="btn-group" role="group">
							  <label class="btn btn-link gender">
							  <input type="radio" name="gender" value="F" 
							  <c:if test="${loginInfo.gender == 'F'}">checked</c:if>/><span>F</span></label>		
							  </div>
							  <div class="btn-group" role="group">
							  <label class="btn btn-link gender">
							  <input type="radio" name="gender" value="Others" 
							  <c:if test="${loginInfo.gender == 'Others'}">checked</c:if>/><span>Others</span></label>		
							  </div>									  
							</div>								
						  </div>
						  	<br />	
						 	<div class="form-group">
             <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">               
               <button type="button" class="btn cancel form-control" onclick="history.back();"><font size="4" face="Helvetica"  color="#fff">Cancel</font></button>
               </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">               
               <button type="submit" class="btn ok form-control"><font size="4"  face="Arial, Helvetica, sans-serif" color="#28282"><B>Save Setting</B></font></button>
             </div>            
            </div>  							
                     </form>		
					</fieldset>
				
			</div>		
		<!--//  Account info -->				
		</div>
	</div>

	<!-- 메인 화면 끝 -->

	<!-- footer -->
	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	<!--// footer -->
	
	
	

</body>
</html>