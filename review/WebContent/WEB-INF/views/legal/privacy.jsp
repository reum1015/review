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
				<legend><h1>Privacy Policy</h1></legend>
				<p>Welcome to Review&Bang. Review&Bang provides a fast and fun
					way for you to share review through our content-sharing platform.
					Just share your experience, the look and feel, add comments (if you like)!</p>
				<ul>
					<li>Our Privacy Policy explains how we and some of the
						companies we work with collect, use, share and protect information
						in relation to our mobile services, web site, and any software
						provided on or in connection with Review&Bang services, and your
						choices about the collection and use of your information.</li>
					<li>By using our Service you understand and agree that we are
						providing a platform for you to post content, including photos,
						comments and other materials , to the Service and to share User
						Content publicly. This means that other Users may search for, see,
						use, or share any of your User Content that you make publicly
						available through the Service, consistent with the terms and
						conditions of this Privacy Policy and our Terms of Use.</li>
					<li>Our Policy applies to all visitors, users, and others who access the Service ("Users").</li>						
				</ul>
				<br />				
				<h4>INFORMATION WE COLLECT</h4>
				<p>We collect and use your information below to provide, understand, and improve our Services.</p>
				<strong>Information you provide us directly:</strong>
				<ul>
				<li>Your username, password and e-mail address when you register for an Review&Bang account.</li>
				<li>Profile information that you provide for your user profile (e.g., first and last name, picture, phone number). This information allows us to help you or others be "found" on Review&Bang.</li>
				<li>User Content (e.g., photos, comments, and other materials) that you post to the Service.</li>
				<li>Communications between you and Review&Bang. For example, we may send you Service-related emails (e.g., account verification, changes/updates to features of the Service, technical and security notices). Note that you may not opt out of Service-related e-mails.</li>				
				</ul>
				
				<strong>Finding your friends on Review&Bang:</strong>
				<ul>
				<li>If you choose to find your friends through (i) your device's contacts list, then Review&Bang will access your contacts list to determine whether or not someone associated with your contact is using Review&Bang.</li>
				<li>If you choose to find your friends through a (ii) third-party social media site, then you will be prompted to set up a link to the third-party service and you understand that any information that such service may provide to us will be governed by this Privacy Policy.</li>
				<li>If you choose to find your friends (iii) through a search of names or usernames on Review&Bang then simply type a name to search and we will perform a search on our Service.</li>
				<li><strong>Note about "Invite Friends" feature: </strong>If you choose to invite someone to the Service through our "Invite friends" feature, you may select a person directly from the contacts list on your device and send a text or email from your personal account. You understand and agree that you are responsible for any charges that apply to communications sent from your device, and because this invitation is coming directly from your personal account, Review&Bang does not have access to or control this communication. </li>
				</ul>
				
				<strong>Analytics information:</strong>
				<ul>
				<li>We use third-party analytics tools to help us measure traffic and usage trends for the Service. These tools collect information sent by your device or our Service, including the web pages you visit, add-ons, and other information that assists us in improving the Service. We collect and use this analytics information with analytics information from other Users so that it cannot reasonably be used to identify any particular individual User.</li>				
				</ul>
				
				<strong>Cookies and similar technologies:</strong>
				<ul>
				<li>When you visit the Service, we may use cookies and similar technologies like pixels, web beacons, and local storage to collect information about how you use Review&Bang and provide features to you.</li>
				<li>We may ask advertisers or other partners to serve ads or services to your devices, which may use cookies or similar technologies placed by us or the third party.</li>
				<li>More information is available in our About Cookies section</li>				
				</ul>





			</fieldset>
		</div>		
		<!--//  Account info -->

	</div>

	<!-- footer -->

	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	<!--// footer -->

</body>
</html>