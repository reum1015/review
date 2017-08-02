<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
<!-- Javascript -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/tab-x/bootstrap-tabs-x.min.js"></script>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- StarRating -->
<link
	href="${pageContext.request.contextPath}/assets/css/star-rating/star-rating.css"
	media="all" rel="stylesheet" type="text/css" />

<!-- optionally if you need to use a theme, then include the theme CSS file as mentioned below -->
<link
	href="${pageContext.request.contextPath}/assets/css/star-rating/theme.css"
	media="all" rel="stylesheet" type="text/css" />


<link
	href="${pageContext.request.contextPath}/assets/css/selectbox/css/bootstrap-select.css"
	media="all" rel="stylesheet" type="text/css" />

<!-- important mandatory libraries -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/css/star-rating/star-rating.js"
	type="text/javascript"></script>

<!-- optionally if you need to use a theme, then include the theme JS file as mentioned below -->
<script
	src="${pageContext.request.contextPath}/assets/css/star-rating/theme.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

<!-- Multi-column -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/plugins/multi-column/ie-row-fix.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/js/plugins/multi-column/multi-columns-row.css" />

<!-- handlebars -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/plugins/handlebars/handlebars-v4.0.5.js"></script>

<!-- ajax -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/js/ajax/ajax_helper.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/ajax/ajax_helper.js"></script>

<!-- ajaxForm -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/ajax-form/jquery.form.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

<!-- main css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/article_list.css" />

<style type="text/css">
.chk_bookmark label {
	position: absolute;
	top: 0;
	left: 0;
	cursor: pointer;
}

.icon_bookmark2 {
	width: 19px;
	height: 29px;
	background-image: url(../assets/imgs/clipping/sp_icon.png);
	background-position: -90px -290px;
}

.bookmark_On {
	width: 19px;
	height: 29px;
	background-image: url(../assets/imgs/clipping/sp_icon.png);
	background-position: -60px -290px;
}

.bookmark_Off {
	width: 19px;
	height: 29px;
	background-image: url(../assets/imgs/clipping/sp_icon.png);
	background-position: -90px -290px;
}

.bmk {
	overflow: hidden;
}

[class^=icon_] {
	font-size: 0;
	line-height: 0;
	vertical-align: top;
	color: rgba(1, 0, 0, 0) !important;
	display: inline-block;
	overflow: hidden;
}

/* 관심등록 Off 일때*/
.like_Off {
	display: inline-block;
	zoom: 1;
	width: 23px;
	height: 21px;
	background-image: url(../assets/imgs/clipping/sp_likeit2.png);
	background-position: 0 0;
}

/* 관심등록 On 일때*/
.like_On {
	display: inline-block;
	zoom: 1;
	width: 23px;
	height: 21px;
	background-image: url(../assets/imgs/clipping/sp_likeit2.png);
	background-position: -30px 0px;
}

.btn_h3 {
	padding-top: 15px;
}

.total {
	font-size: 18px;
	color: #999;
	font-family: arial;
	font-weight: normal;
}
</style>

<script type="text/javascript">
	$(function() {
		var member_id = $("#member_id").val();
		
		var likeCount = $("#likeCount").val();
		var member_id = $("#member_id").val();
		var totalLike = $("#totalLike").val();
		var article_id = $("#article_id").val();
		var isLikeState = $("#isLikeState").val();


		//관심등록 On 이면 마크 표시
		if(likeCount > 0){
		$("#like_img").removeClass("like_Off").addClass("like_On");
				}else{
		$("#like_img").removeClass("like_On").addClass("like_Off");
				}
		
		$('.like_button').on('click', function(e) {
					var member_id = $("#member_id").val();
						var article_id = $(this).attr('id');
			 			
			 			//로그인 안된 상태
			 			if(member_id ==0){
			 				alert("LogIn is required.");
			 				return;
			 			//로그인 상태	
			 			}else{
			 				$.get("${pageContext.request.contextPath}/like/favoriteAdd", 
			 						{member_id : member_id, article_id : article_id},
			 						function(data) {
			 							var isLikeState = data.isLikeState;
			 							var likeCount = data.likeCount;
			 	
			 							if(isLikeState){
			 								alert("Like added");
			 								$("#" + article_id).empty().append('<span class="like_On pull-right" id="like_img"></span>')

			 							}else{
			 								alert("Like removed");
			 								$("#" + article_id).empty().append('<span class="like_Off pull-right" id="like_img"></span>')

			 							}
			 				});
			 
			 			}
			 			
			 			
			 		});
		//Like 버튼 끝
		
		// Bookmark 버튼
		var bookmark_count = $("#bookmark_count").val();
		var member_id = $("#member_id").val();
		var total_bookmark = $("#total_bookmark").val();		
		var article_id = $("#article_id").val();
		var isBookMarkState = $("#isBookMarkState").val();
		
		//북마크 On 이면 마크 표시
		if(bookmark_count > 0){	
			$("#bookmark_img").removeClass("bookmark_Off").addClass("bookmark_On");	
			}else{
				$("#bookmark_img").removeClass("bookmark_On").addClass("bookmark_Off");
			}
		
		$("#bookmark_button").on('click',function(e){
			e.preventDefault();
			if(member_id == 0){
				var result = confirm("로그인이 필요한 서비스 입니다. 로그인 창으로 이동하시겠습니까?");
				
				if(result){
					location.replace('/review/member/login?article_id=' + article_id );
					return false;
				}else{
					return false;
				}
			}
			
			//북마크 On/Off
			$.get("${pageContext.request.contextPath}/article/addBookMark", 
					{bookmark_count : bookmark_count, member_id : member_id, total_bookmark : total_bookmark, article_id: article_id},
					function(data){
							var isBookMarkState = data.isBookMarkState;
							 total_bookmark=data.total_bookmark;
							 bookmark_count = data.bookmark_count;
						
							$("#bookmark_count").attr("value", bookmark_count);
							$("#concernCount").text(total_bookmark);
							
							
							if(isBookMarkState){							
								$("#bookmark_img").removeClass("bookmark_Off").addClass("bookmark_On");
							}else{							
								$("#bookmark_img").removeClass("bookmark_On").addClass("bookmark_Off");
							}
						});
		});		
		// Bookmark 버튼
		
		
		/*
		구매목록 리스트
		구매목록에 구매 완료 표시
	*/
	var favoriteState= eval(${favoriteState});
	var favoriteStateLength = favoriteState.length;
	
	for(var i = 0; i <favoriteStateLength ; i++){
		var epid = favoriteState[i].article_id;
		$("#" + epid).empty();
		$("#" + epid).append('<span class="like_On pull-right" id="like_img"></span>')
	};
		
		
	
		
		
	});
</script>


</head>
<body>
	<jsp:include page="/WEB-INF/views/template/topbar.jsp" />
	<jsp:include page="/WEB-INF/views/template/bottombar.jsp" />

	<!-- 메인 화면 시작 -->

	<div class="container">

		<!-- Best Review category -->
		<div class="best-container">
			<h1 class="page-header">
				<small>Best Review about <font size="5" color="#282828">${keyword}</font></small>
			</h1>
			<!--// Best Review category -->
			<!-- Best Review Content  -->
			<div class="review-content row multi-columns-row">

				<c:choose>
					<c:when test="${fn:length(favoriteList) > 0}">
						<c:forEach var="favorite" items="${selectArticleListForBest}">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="thumbnail col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<c:url var="readUrl" value="/article/article_read">
										<c:param name="article_id" value="${favorite.id}" />
									</c:url>
									<c:url var="readUser" value="/mymenu/user_page">
										<c:param name="member_id" value="${favorite.member_id}" />
									</c:url>
									<!-- 링크 + 썸네일 -->
									<a href="${readUrl}" class="col-lg-4 col-md-4 col-sm-4"> <c:choose>
											<c:when test="${favorite.imagePath != null}">
												<c:url var="downloadUrl" value="/download">
													<c:param name="file" value="${favorite.imagePath}" />
												</c:url>
												<img src="${downloadUrl}" class="img-responsive img-rounded" />
											</c:when>
											<c:otherwise>
												<img
													src="${pageContext.request.contextPath}/assets/imgs/img/frog1.jpg"
													class="img-responsive" />
											</c:otherwise>
										</c:choose>
									</a>
									<!--// 링크 + 썸네일 -->
									<!-- 제목 + 작성자 + 조회수 -->
									<div class="item col-lg-8 col-md-8 col-sm-7">
										<a href="${readUser}"><font size="4" color="#000000">${favorite.nick_name}</font></a>
										<div class="pull-right">${favorite.reg_date}</div>
										<div>
											<font size="4" color="#A0A0FF "> keyword: </font> <font
												size="4" color="#000069"> ${favorite.category}</font>
										</div>
										<div>
											<font size="4" color="#A0A0FF ">title:</font><font size="4"
												color="#000069"> ${favorite.title} </font>
										</div>
										<hr />
										<div style="overflow: auto; width: 100%; max-height: 180px;">
											${favorite.content}</div>
									</div>
									<!--// 제목 + 작성자 + 조회수 -->
									<br />
									<!-- like + comment + book mark -->
									<div class="btn-group btn-block">

										<a class="col-lg-4 col-md-4 col-sm-4 col-xs-4 btn btn-white btn-large like_button" id="${favorite.id}"> 
											<span class="like_Off pull-right" id="like_img"></span>
										</a> 
										
										<a href="#" class="col-lg-4 col-md-4 col-sm-4 col-xs-4 btn btn-white btn-large">
											<font color="#a0a0a0"><i class="">Comment</i></font>
										</a> 
										
										<a id="bookmark_button" class="col-lg-4 col-md-4 col-sm-4 col-xs-4 btn btn-white btn-large" id="${favorite.id }"> 
											<span class="bookmark_Off pull-right" id="bookmark_img"></span>
										</a> 
										
										<input type="hidden" value="${readArticle.total_like}" id="total_like"> 
										<input type="hidden" value="${member_id}" id="member_id"> 
										<input type="hidden" value="${article_id}" id="article_id">
										<input type="hidden" value="${bookmarkCount}"id="bookmark_count"> 
										<input type="hidden" value="${bookmarkCount}" id="total_bookmark"> 
										<input type="hidden" value="${isBookMarkState}" id="isBookMarkState">
										<input type="hidden" value="${likeCount}" id="total_like">
										<input type="hidden" value="${likeCount}" id="like_count">
										<input type="hidden" value="${isLikeState}" id="isLikeState">
									</div>
									<!--// like + comment + book mark -->

								</div>
							</div>
						</c:forEach>

					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5" class="text-center" style="line-height: 100px;">
								No Post about ${keyword}. <br /> Why don't you be a first best
								reviewer about ${keyword}
							</td>
						</tr>
					</c:otherwise>
				</c:choose>


			</div>

			<!--// Recent Review Content  -->

			<!-- Recent page number -->
			<nav class="text-center">
				<ul class="pagination">
					<!-- 이전 그룹으로 이동 -->
					<c:choose>
						<c:when test="${pageHelper.prevPage > 0 }">
							<!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
							<!-- 이전 그룹으로 이동하기 위한 URL을 생성해서 "prevUrl"에 저장 -->
							<c:url var="prevUrl" value="/article/article_list">
								<c:param name="keyword" value="${keyword}"></c:param>
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
						<c:url var="pageUrl" value="/article/article_list">
							<c:param name="keyword" value="${keyword}"></c:param>
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
							<c:url var="nextUrl" value="/article/article_list">
								<c:param name="keyword" value="${keyword}"></c:param>
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
			<!--// Best Review Content  -->
		</div>
		<!--// Best Review category -->

		<!-- Recent Review category -->
		<div class="recent-container">
			<h1 class="page-header">
				<small>Review about <font size="5" color="#282828">${keyword}</font></small>
			</h1>
			<!--// Recent Review category -->
			<!-- Recent Review Content  -->
			<div class="review-content row multi-columns-row">

				<c:choose>
					<c:when test="${fn:length(articleList) > 0}">
						<c:forEach var="article" items="${articleList}">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="thumbnail col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<c:url var="readUrl" value="/article/article_read">
										<c:param name="article_id" value="${article.id}" />
									</c:url>
									<c:url var="readUser" value="/mymenu/user_page">
										<c:param name="member_id" value="${article.member_id}" />
									</c:url>
									<!-- 링크 + 썸네일 -->
									<a href="${readUrl}" class="col-lg-4 col-md-4 col-sm-4"> <c:choose>
											<c:when test="${article.imagePath != null}">
												<c:url var="downloadUrl" value="/download">
													<c:param name="file" value="${article.imagePath}" />
												</c:url>
												<img src="${downloadUrl}" class="img-responsive img-rounded" />
											</c:when>
											<c:otherwise>
												<img
													src="${pageContext.request.contextPath}/assets/imgs/img/frog1.jpg"
													class="img-responsive" />
											</c:otherwise>
										</c:choose>
									</a>
									<!--// 링크 + 썸네일 -->
									<!-- 제목 + 작성자 + 조회수 -->
									<div class="item col-lg-8 col-md-8 col-sm-7">
										<a href="${readUser}"><font size="4" color="#000000">${article.nick_name}</font></a>
										<div class="pull-right">${article.reg_date}</div>
										<div>
											<font size="4" color="#A0A0FF "> keyword: </font> <font
												size="4" color="#000069"> ${article.category}</font>
										</div>
										<div>
											<font size="4" color="#A0A0FF ">title:</font><font size="4"
												color="#000069"> ${article.title} </font>
										</div>
										<hr />
										<div style="overflow: auto; width: 100%; max-height: 180px;">
											${article.content}</div>
									</div>
									<!--// 제목 + 작성자 + 조회수 -->
									<br />
									<!-- like + comment + book mark -->
									<div class="btn-group btn-block">
										<a class="col-lg-4 col-md-4 col-sm-4 col-xs-4 btn btn-white btn-large like_button" id="${article.id }"> 
											<span class="like_Off  pull-right" id="like_img"></span> 
											<font color="#FF0040 ">
												<span class="pull-right" id="concernCount">${article.total_like}</span>
											</font>
										</a> 
										
										
										<a href="#" class="col-lg-4 col-md-4 col-sm-4 col-xs-4 btn btn-white btn-large">
											<font color="#a0a0a0"><i class="">Comment</i></font>
										</a> 
										
										<a id="bookmark_button" class="col-lg-4 col-md-4 col-sm-4 col-xs-4 btn btn-white btn-large" id="${article.id }"> 
											<span class="bookmark_Off pull-right" id="bookmark_img"></span>
										</a> 
										
										<input type="hidden" value="${article.total_like}" id="total_like"> 
										<input type="hidden" value="${member_id}" id="member_id"> 
										<input type="hidden" value="${article_id}" id="article_id">
										<input type="hidden" value="${bookmarkCount}"id="bookmark_count"> 
										<input type="hidden" value="${bookmarkCount}" id="total_bookmark"> 
										<input type="hidden" value="${isBookMarkState}" id="isBookMarkState">
										<input type="hidden" value="${likeCount}" id="total_like">
										<input type="hidden" value="${likeCount}" id="like_count">
										<input type="hidden" value="${isLikeState}" id="isLikeState">
									</div>
									<!--// like + comment + book mark -->

								</div>
							</div>
						</c:forEach>

					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5" class="text-center" style="line-height: 100px;">
								No Post about ${keyword}. <br /> Why don't you be a first
								reviewer about ${keyword}
							</td>
						</tr>
					</c:otherwise>
				</c:choose>


			</div>

			<!--// Recent Review Content  -->

			<!-- Recent page number -->
			<nav class="text-center">
				<ul class="pagination">
					<!-- 이전 그룹으로 이동 -->
					<c:choose>
						<c:when test="${pageHelper.prevPage > 0 }">
							<!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
							<!-- 이전 그룹으로 이동하기 위한 URL을 생성해서 "prevUrl"에 저장 -->
							<c:url var="prevUrl" value="/article/article_list">
								<c:param name="keyword" value="${keyword}"></c:param>
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
						<c:url var="pageUrl" value="/article/article_list">
							<c:param name="keyword" value="${keyword}"></c:param>
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
							<c:url var="nextUrl" value="/article/article_list">
								<c:param name="keyword" value="${keyword}"></c:param>
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
			<!--// Recent page number -->
		</div>
		<!--// Recent Review -->
	</div>

	<!-- 메인 화면 끝 -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


</body>
</html>