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
<script src="${pageContext.request.contextPath}/assets/js/tab-x/bootstrap-tabs-x.min.js"></script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- StarRating -->
<link	href="${pageContext.request.contextPath}/assets/css/star-rating/star-rating.css"
	media="all" rel="stylesheet" type="text/css" />

<!-- optionally if you need to use a theme, then include the theme CSS file as mentioned below -->
<link	href="${pageContext.request.contextPath}/assets/css/star-rating/theme.css"
	media="all" rel="stylesheet" type="text/css" />


<link	href="${pageContext.request.contextPath}/assets/css/selectbox/css/bootstrap-select.css"
	media="all" rel="stylesheet" type="text/css" />

<!-- important mandatory libraries -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.js"></script>
<script src="${pageContext.request.contextPath}/assets/css/star-rating/star-rating.js"
	type="text/javascript"></script>

<!-- optionally if you need to use a theme, then include the theme JS file as mentioned below -->
<script src="${pageContext.request.contextPath}/assets/css/star-rating/theme.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

<!-- Multi-column -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/multi-column/ie-row-fix.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/plugins/multi-column/multi-columns-row.css" />

<!-- handlebars -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/handlebars/handlebars-v4.0.5.js"></script>

<!-- ajax -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/js/ajax/ajax_helper.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/ajax/ajax_helper.js"></script>

<!-- ajaxForm -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/ajax-form/jquery.form.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />


<style type="text/css">

.best-container {
margin-top: -35px;
}

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
					var article_id = $(this).attr('value');
			 			
						 console.log("article_id : " + article_id);
			 			//로그인 안된 상태
			 			if(member_id ==0){
			 				alert("LogIn is required.");
			 				return;
			 			//로그인 상태	
			 			}else{
			 				$.get("${pageContext.request.contextPath}/like/favoriteAdd", {member_id : member_id, article_id : article_id},
			 						function(data) {
			 							var isLikeState = data.isLikeState;
			 							var likeCount = data.likeCount;
			 							var articleTotal = $("#articleTotal_" + article_id).text();
										var articleListTotal = $("#articleListTotal_" + article_id).text();
			 							
			 							articleTotal = Number(articleTotal);
			 							articleListTotal = Number(articleListTotal);
			 							
			 	
			 							if(isLikeState){
			 								
			 								$("#article_" + article_id).empty().append('<span class="like_On pull-right" id="like_img"></span>');
			 								$("#articleList_" + article_id).empty().append('<span class="like_On pull-right" id="like_img"></span>');
			 								articleTotal++;
			 								articleListTotal++;
			 								
			 								$("#articleTotal_" + article_id).html(articleTotal);
			 								$("#articleListTotal_" + article_id).html(articleListTotal);
			 							}else{
			 								
			 								$("#article_" + article_id).empty().append('<span class="like_Off pull-right" id="like_img"></span>');
			 								$("#articleList_" + article_id).empty().append('<span class="like_Off pull-right" id="like_img"></span>');
			 								
			 								articleTotal--;
			 								articleListTotal--;
			 							
			 								$("#articleTotal_" + article_id).html(articleTotal);
			 								$("#articleListTotal_" + article_id).html(articleListTotal);
			 								
			 								
			 							}
			 				});
			 
			 			}
			 			
			 			
			 		});
		
		//Like 버튼 끝
		
		
		
		
		// Bookmark 버튼
		var bookmark_count = $("#bookmark_count").val();
		var member_id = $("#member_id").val();	
		var article_id = $("#article_id").val();
		var isBookMarkState = $("#isBookMarkState").val();
		
		
		
		//북마크 On 이면 마크 표시
		if(bookmark_count > 0){	
			$("#bookmark_img").removeClass("bookmark_Off").addClass("bookmark_On");	
			}else{
				$("#bookmark_img").removeClass("bookmark_On").addClass("bookmark_Off");
			}
		
		$(".bookmark_button").on('click',function(e){
			var member_id = $("#member_id").val();
			var article_id = $(this).attr('value');
			
			
			
				//var result = confirm("로그인이 필요한 서비스 입니다. 로그인 창으로 이동하시겠습니까?");
				
				if( member_id == 0){
					alert("LogIn is required.");
					return;
				}else{
					//북마크 On/Off
					$.get("${pageContext.request.contextPath}/article/addBookMark", 
							{member_id : member_id, article_id: article_id},
							function(data){
									var isBookMarkState = data.isBookMarkState;
									
									
									if(isBookMarkState){
										
		 								$("#bookmark_" + article_id).empty().append('<span class="bookmark_On pull-right" id="bookmark_img"></span>');
		 								$("#bookmarkList_" + article_id).empty().append('<span class="bookmark_On pull-right" id="bookmark_img"></span>');
									}else{						
										
		 								$("#bookmark_" + article_id).empty().append('<span class="bookmark_Off pull-right" id="bookmark_img"></span>');
		 								$("#bookmarkList_" + article_id).empty().append('<span class="bookmark_Off pull-right" id="bookmark_img"></span>');
									}
								});
				}
			
			
			
		});		
		// Bookmark 버튼
		
		
	/*
		좋아요 버튼
	*/
	var favoriteState= eval(${favoriteState});
	var favoriteStateLength = favoriteState.length;
	
	for(var i = 0; i <favoriteStateLength ; i++){
		var epid = favoriteState[i].article_id;
		var total_like = favoriteState[i].total_like;
		$("#article_" + epid).empty();
		$("#article_" + epid).append('<span class="like_On pull-right" id="like_img"></span>');
		$("#articleList_" + epid).empty();
		$("#articleList_" + epid).append('<span class="like_On pull-right" id="like_img"></span>');
	};
		
	var bookmarkState = eval(${bookMarkStateList});
	var bookmarkStateLength = bookmarkState.length;
	
	for(var i = 0; i <bookmarkStateLength ; i++){
		var epid = bookmarkState[i].article_id;
		$("#bookmark_" + epid).empty();
		$("#bookmark_" + epid).append('<span class="bookmark_On pull-right" id="bookmark_img"></span>');
		$("#bookmarkList_" + epid).empty();
		$("#bookmarkList_" + epid).append('<span class="bookmark_On pull-right" id="bookmark_img"></span>');
	};
	
		
	});
</script>


</head>
<body>


	<!-- 메인 화면 시작 -->

	<div class="container">

		<!-- Best Review category -->
		<div class="best-container ">
			<h1 class="page-header col-lg-offset-1 col-lg-10 col-md-offset-1 col-md-10 col-sm-offset-1 col-sm-10 col-xs-12">
				<small><font size="5" color="#FF8000">${keyword}</font> Best Review </small>
			</h1>			
			<!-- Best Review Content  -->
			<div class="review-content row multi-columns-row">
				<c:choose>
					<c:when test="${fn:length(selectArticleListForBest) > 0}">
						<c:forEach var="selectArticleListForBest" items="${selectArticleListForBest}">
							<div class="col-lg-offset-1 col-lg-10 col-md-offset-1 col-md-10 col-sm-offset-1 col-sm-10 col-xs-12">
								<div class="thumbnail col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<c:url var="readUrl" value="/article/article_read_mobile">
										<c:param name="article_id" value="${selectArticleListForBest.id}" />
									</c:url>
									<c:url var="readUser" value="/mymenu/user_page_mobile">
										<c:param name="member_id" value="${selectArticleListForBest.member_id}" />
									</c:url>
									<c:url var="searchButton" value="/article/article_search_button">
										<c:param name="keyword" value="${keyword}" />
									</c:url>
									<!-- 링크 + 썸네일 -->
									<a href="${readUrl}" class="col-lg-3 col-md-3 col-sm-3 col-xs-6"> 
									<c:choose>
											<c:when test="${selectArticleListForBest.imagePath != null}">
												<c:url var="downloadUrl" value="/download">
													<c:param name="file" value="${selectArticleListForBest.imagePath}" />
												</c:url>
												<img alt="article image" src="${downloadUrl}" class="img-responsive img-rounded" />
											</c:when>
											<c:otherwise>
												<img alt="noimage"
													src="${pageContext.request.contextPath}/assets/imgs/img/frog1.jpg"
													height="190px" width="220px" class="img-rounded img-responsive"/>
											</c:otherwise>
										</c:choose>
									</a>
									<!--// 링크 + 썸네일 -->
									<!-- 제목 + 작성자 + 조회수 -->
							<div class="item col-lg-9 col-md-9 col-sm-9 col-xs-6">
										<a href="${readUser}"><font size="4" color="#585858">${selectArticleListForBest.nick_name}</font></a>
										<%-- <div class="pull-right "><a href="${searchButton}" style="font-size: 1.0em;">							
							 <font size="4" color="#a0a0a0">More</font></a></div> --%>
										<div>
											<font size="4" color="#28282"> category: </font> <font
												size="4" color="#a0a0a0"> ${selectArticleListForBest.category}</font>
												
										</div>
										<div>
											<font size="4" color="#28282 ">title:</font><font size="4"
												color="#a0a0a0"> ${selectArticleListForBest.title} </font>
												<br/>
												<div class="pull-right">${selectArticleListForBest.reg_date}</div>
										</div>
										<hr />
<textarea readonly class="hidden-xs" style="overflow: auto; width: 100%; height: 180px; text-align: left; border: 0; resize: none; ">
${selectArticleListForBest.content}
</textarea>		
																					
										</div>
<textarea readonly class="hidden-lg hidden-md hidden-sm col-xs-12" style="overflow: auto; width: 100%; height: 180px; text-align: left;  border: 0; resize: none; ">
${selectArticleListForBest.content}
</textarea>		
									
										
									<!--// 제목 + 작성자 + 조회수 -->
									<br />
									<!-- like + comment + book mark 위에 화면-->
									<div class="btn-group btn-block col-lg-12 col-md-12 col-sm-12 col-xs-12">
									  <div class="col-lg-3 col-md-3 col-sm-3 col-xs-2" > 
											<font size="5" color="#FF0202" class="pull-right" id="articleTotal_${selectArticleListForBest.id}">${selectArticleListForBest.total_like}</font>
		                                </div>
										<a class="pull-left col-lg-1 col-md-1 col-sm-1 col-xs-1 btn btn-white btn-large like_button" id="article_${selectArticleListForBest.id}" value="${selectArticleListForBest.id}"> 
											<span class="like_Off pull-left" id="like_img"></span>
										</a> 
										
										<a href="${readUrl}" class="col-lg-3 col-md-3 col-sm-3 col-xs-4 btn btn-white btn-large">
											<font color="#a0a0a0"><i class="">Comment</i></font>
										</a>
										<a class="pull-right col-lg-3 col-md-3 col-sm-3 col-xs-3 btn btn-white btn-large bookmark_button" id="bookmark_${selectArticleListForBest.id}" 
											value="${selectArticleListForBest.id}"> 
											<span class="bookmark_Off pull-right" id="bookmark_img"></span>
										</a> 		
									</div>
									<!--// like + comment + book mark -->
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="col-lg-offset-1 col-lg-10 col-md-offset-1 col-md-10 col-sm-10 col-xs-12">
							<span class="text-center" style="line-height: 50px;">
								No Post about <font size="5" color="#FF8000">${keyword}</font>. 
								<br /> 
								Why don't you be a first best	reviewer about<font size="5" color="#FF8000">${keyword}</font>
							</span>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<!--// Best Review Content  -->
			<!-- Best page number -->
			<nav class="text-center">
				<ul class="pagination">
					<!-- 이전 그룹으로 이동 -->
					<c:choose>
						<c:when test="${pageHelper.prevPage > 0 }">
							<!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
							<!-- 이전 그룹으로 이동하기 위한 URL을 생성해서 "prevUrl"에 저장 -->
							<c:url var="prevUrl" value="/article/article_list_mobile">
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
						<c:url var="pageUrl" value="/article/article_list_mobile">
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
							<c:url var="nextUrl" value="/article/article_list_mobile">
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
			<!--// Best page number  -->			
		</div>
		<!--// Best Review category -->



		<!-- Recent Review category -->			
		<div class="recent-container">
			<h1 class="page-header col-lg-offset-1 col-lg-10 col-md-offset-1 col-md-10 col-sm-offset-1 col-sm-10 col-xs-12">
				<small><font size="5" color="#FF8000">${keyword}</font>review </small>
			</h1>			
			<!-- Recent Review Content  -->
			<div class="review-content row multi-columns-row">
				<c:choose>
					<c:when test="${fn:length(articleList) > 0}">
						<c:forEach var="article" items="${articleList}">
							<div class="col-lg-offset-1 col-lg-10 col-md-offset-1 col-md-10 col-sm-offset-1 col-sm-10 col-xs-12">
								<div class="thumbnail col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<c:url var="readUrl" value="/article/article_read_mobile">
										<c:param name="article_id" value="${article.id}" />
									</c:url>
									<c:url var="readUser" value="/mymenu/user_page_mobile">
										<c:param name="member_id" value="${article.member_id}" />
									</c:url>
									<c:url var="searchButton" value="/article/article_search_button">
										<c:param name="keyword" value="${keyword}" />
									</c:url>
									<!-- 링크 + 썸네일 -->
									<a href="${readUrl}" class="col-lg-3 col-md-3 col-sm-3 col-xs-6">  
									<c:choose>
											<c:when test="${article.imagePath != null}">
												<c:url var="downloadUrl" value="/download">
													<c:param name="file" value="${article.imagePath}" />
												</c:url>
												<img alt="article image" src="${downloadUrl}" class="img-responsive img-rounded" />
											</c:when>
											<c:otherwise>
												<img alt="noimage"
													src="${pageContext.request.contextPath}/assets/imgs/img/frog1.jpg"
													class="img-responsive" />
											</c:otherwise>
										</c:choose>
									</a>
									<!--// 링크 + 썸네일 -->
									<!-- 제목 + 작성자 + 조회수 -->
						<div class="item col-lg-9 col-md-9 col-sm-9 col-xs-6">
							<a href="${readUser}"><font size="4" color="#585858">${article.nick_name}</font></a>							
							<%-- <div class="pull-right "><a href="${searchButton}" style="font-size: 1.0em;">							
							 <font size="4" color="#FF8000">More</font></a></div>	 --%>						
										<div>
											<font size="4" color="#28282 "> category: </font>
											 <font size="4" color="#a0a0a0"> ${article.category}</font>
										</div>
										<div>
											<font size="4" color="#28282 ">title:</font>
											<font size="4" color="#a0a0a0"> ${article.title} </font>
											<br/>
											<div class="pull-right">${article.reg_date}</div>
										</div>
										<hr />
<textarea readonly class="hidden-xs" style="overflow: auto; width: 100%; height: 180px; text-align: left; border: 0; resize: none; ">
${article.content}
</textarea>											
										</div>
<textarea readonly class="hidden-lg hidden-md hidden-sm col-xs-12" style="overflow: auto; width: 100%; height: 180px; text-align: left;  border: 0; resize: none; ">
${article.content}
</textarea>
									<!--// 제목 + 작성자 + 조회수 -->
									<br />
									<!-- like + comment + book mark 위에 화면-->
									<div class="btn-group btn-block col-lg-12 col-md-12 col-sm-12 col-xs-12">
									    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-2" > 
											<font size="5" color="#FF0202" class="pull-right" id="articleListTotal_${article.id}">${article.total_like}</font>
		                                </div>
										<a class="pull-left col-lg-1 col-md-1 col-sm-1 col-xs-1 btn btn-white btn-large like_button" id="articleList_${article.id}" value="${article.id}"> 
											<span class="like_Off pull-left" id="like_img"></span>
										</a> 
										
										<a href="${readUrl}" class="col-lg-3 col-md-3 col-sm-3 col-xs-4 btn btn-white btn-large">
											<font color="#a0a0a0"><i class="">Comment</i></font>
										</a>
										<a class="pull-right col-lg-3 col-md-3 col-sm-3 col-xs-3 btn btn-white btn-large bookmark_button" id="bookmarkList_${article.id}" 
											value="${article.id}"> 
											<span class="bookmark_Off pull-right" id="bookmark_img"></span>
										</a> 		
										<input type="hidden" value="${article.total_like}" id="total_like"> 
										<input type="hidden" value="${member_id}" id="member_id">
										<input type="hidden" value="${bookmarkCount}"id="bookmark_count"> 
										<input type="hidden" value="${bookmarkCount}" id="total_bookmark"> 
										<input type="hidden" value="${isBookMarkState}" id="isBookMarkState">
										<input type="hidden" value="${likeCount}" id="like_count">
										<input type="hidden" value="${isLikeState}" id="isLikeState">
									</div>
									<!--// like + comment + book mark -->
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="col-lg-offset-1 col-lg-10 col-md-offset-1 col-md-10 col-sm-10 col-xs-12">
							<span class="text-center" style="line-height: 50px;">
								No Post about <font size="5" color="#FF8000">${keyword}</font>. 
								<br /> 
								Why don't you be a first reviewer about <font size="5" color="#FF8000">${keyword}</font>
							</span>
						</div>
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
							<c:url var="prevUrl" value="/article/article_list_mobile">
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
						<c:url var="pageUrl" value="/article/article_list_mobile">
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
							<c:url var="nextUrl" value="/article/article_list_mobile">
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
			<!--// Recent page number  -->			
		</div>
		<!--// Recent Review category -->
</div>
	<!-- 메인 화면 끝 -->

	<!-- footer -->
		<jsp:include page="/WEB-INF/views/template/topbar_mobile.jsp" />
	<jsp:include page="/WEB-INF/views/template/bottombar.jsp" />
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>





</body>
</html>