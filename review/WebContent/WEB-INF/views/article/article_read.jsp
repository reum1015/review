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
	<link href="${pageContext.request.contextPath}/assets/css/star-rating/star-rating.css" media="all" rel="stylesheet" type="text/css" />    		
	    		
	<!-- optionally if you need to use a theme, then include the theme CSS file as mentioned below -->
	<link href="${pageContext.request.contextPath}/assets/css/star-rating/theme.css" media="all" rel="stylesheet" type="text/css" />
	
	
	<link href="${pageContext.request.contextPath}/assets/css/selectbox/css/bootstrap-select.css" media="all" rel="stylesheet" type="text/css" />
	
	<!-- important mandatory libraries -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/assets/css/star-rating/star-rating.js" type="text/javascript"></script>
	
	<!-- optionally if you need to use a theme, then include the theme JS file as mentioned below -->
	<script src="${pageContext.request.contextPath}/assets/css/star-rating/theme.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	
	<!-- Multi-column -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/multi-column/ie-row-fix.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/plugins/multi-column/multi-columns-row.css"/>
	
    <!-- handlebars -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/handlebars/handlebars-v4.0.5.js"></script>
	
	<!-- ajax -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/js/ajax/ajax_helper.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/ajax/ajax_helper.js"></script>
	
	<!-- ajaxForm -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/ajax-form/jquery.form.min.js"></script> 
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/article_read.css"/>
	
<style type="text/css">
.container {	
	height: auto;
}

.thumbnail {
	margin-top: 30px;
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
.like_Off{
	display: inline-block;
	zoom: 1;
	width: 23px;
    height: 21px;
    background-image: url(../assets/imgs/clipping/sp_likeit2.png);
    background-position: 0 0;
}

/* 관심등록 On 일때*/
.like_On{
	display: inline-block;
	zoom: 1;
	width: 23px;
    height: 21px;
    background-image: url(../assets/imgs/clipping/sp_likeit2.png);
    background-position: -30px 0px;
}

.btn_h3{
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
		
		
		//Like 버튼
		var like_count = $("#like_count").val();
		var member_id = $("#member_id").val();
		var total_like = $("#total_like").val();
		var article_id = $("#article_id").val();
		var isLikeState = $("#isLikeState").val();


	//관심등록 On 이면 마크 표시
		if(like_count > 0){
	$("#like_img").removeClass("like_Off").addClass("like_On");
			}else{
$("#like_img").removeClass("like_On").addClass("like_Off");
			}
			
	$("#like_button").on('click',function(e){
			e.preventDefault();
			if(member_id == 0){
				var result = confirm("login is required. Do you want to move login page?");
				
				

				
				if(result){
	location.replace('/review/member/login?article_id=' + article_id );
					return false;
				}else{
					return false;
				}
			}
//관심등록  On/Off
	$.get("${pageContext.request.contextPath}/article/addFavorite", 
{like_count : like_count, member_id : member_id, total_like : total_like, article_id: article_id},
   function(data){
		var isLikeState = data.isLikeState;
		 total_like=data.total_like;
          like_count = data.like_count;
						
	$("#like_count").attr("value", like_count);
		$("#concernCount").text(total_like);

	if(isLikeState){
				$("#like_img").removeClass("like_Off").addClass("like_On");
		}else{
	$("#like_img").removeClass("like_On").addClass("like_Off");
							}
						});
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
				var result = confirm("login is required. Do you want to move login page?");
				
				if(result){
					
					location.replace('/member/login?article_id=' + article_id );
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
	});
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/template/topbar.jsp" />
	<jsp:include page="/WEB-INF/views/template/bottombar.jsp" />

	<!-- 메인 화면 시작 -->
	<div class="container">
		<!-- content head  -->
		<hr />

		<!--// content head  -->
		<!-- Review Content  -->
		<!-- content body -->
		<div class="content_body">
			<!-- content body picture -->
			<div class="review-content row multi-columns-row">
				
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="thumbnail col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<c:url var="readUrl" value="/article/article_read">
										<c:param name="article_id" value="${readArticle.id}" />
									</c:url>
									<c:url var="readUser" value="/mymenu/user_page">					            						            	
					            		<c:param name="member_id" value="${readArticle.member_id}" />
					            	</c:url>
					            	<c:url var="searchButton" value="/article/article_search_button">
										<c:param name="keyword" value="${keyword}" />
									</c:url>
									<!-- 링크 + 썸네일 -->
									<div class="read-container">									
										<h3 class="page-header" style="text-align: left; margin-top: -5px;">
										<a href="${readUser}"> <font size="6" color="#FF8000">${readArticle.nick_name}</font> </a>
											
											<span class="pull-right">		
												<c:if test="${readArticle.member_id==loginInfo.id}">
													<a href="${pageContext.request.contextPath}/article/article_edit?article_id=${readArticle.id}&article_member_id=${readArticle.member_id}">
						                  				<i class="glyphicon glyphicon-edit" style="color:#777;"></i></a>
						                  	 		<a href="${pageContext.request.contextPath}/article/article_delete?article_id=${readArticle.id}&article_member_id=${readArticle.member_id}">
						                  	  			<i class="glyphicon glyphicon-remove" style="color:#777;"></i></a>
												</c:if>
												<a href="${pageContext.request.contextPath}/article/article_list_main">
						                  				<i class="glyphicon glyphicon-th-list" style="color:#777;"></i></a>
											</span> <br />
												<small>${readArticle.reg_date}</small>
											<small class="pull-right"> Hit: ${readArticle.hit}</small> <br /> 
											<small>
												<font size="4" color="#28282 "> category: </font> 
												<font size="4" color="#a0a0a0"> ${readArticle.category}</font></small> <br />
											<small>
												<font size="4" color="#28282 ">title:</font>
												<font size="4" color="#a0a0a0"> ${readArticle.title} </font>
											</small>				
										
																		
											<%-- <small class="pull-right"><a href="${searchButton}" style="font-size: 1.0em;">							
							              <font size="4" color="#FF8000">${keyword}</font>
							               </a></small> --%>
							             
										</h3>
									</div>
									<!-- 이미지 화면에 출력 -->
									<c:choose>
						<c:when test="${readArticle.imagePath != null}">
			           <c:url var="downloadUrl" value="/download">
				    <c:param name="file" value="${readArticle.imagePath}" />
			        </c:url>
			        
			         <a class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
			      <img alt="article image" src="${downloadUrl}" class="img-responsive img-rounded" style="margin: auto; max-width: 100%; "/>
			      </a>	
									</c:when>
					<c:otherwise>
					<a class=" col-lg-4 col-md-4 col-sm-4 col-xs-4">
						<img alt="no image" src="${pageContext.request.contextPath}/assets/imgs/img/no_image_article.png" height="190px" width="220px" class="img-rounded img-responsive"/>
						</a>
					</c:otherwise>
								</c:choose>		
						
									<!--// 링크 + 썸네일 -->
									<!-- 제목 + 작성자 + 조회수 -->
									<div class="item col-lg-8 col-md-8 col-sm-8">
<textarea readonly style="overflow: auto; width: 100%; height: 350px; text-align: left; border: 0; resize: none; ">
${readArticle.content}
</textarea>		
									</div>
									<!--// 제목 + 작성자 + 조회수 -->
									<br />
									<!-- like + comment + book mark -->
									<div class="btn-group btn-block">
										<a href="#" id="like_button" class="col-lg-4 col-md-4 col-sm-4 col-xs-4 btn btn-white btn-large" id="${article.id }">
	                              			<span class="like_Off  pull-right" id="like_img"></span>                              				
                             				<font color="#FF0040 "><span class="pull-right" id="concernCount">${readArticle.total_like}</span></font>
	                              				</a>
										<a href="#" class="col-lg-4 col-md-4 col-sm-4 col-xs-4 btn btn-white btn-large">
											<font color="#a0a0a0"><i class="">Comment</i></font></a>
										<a href="#" id="bookmark_button" class="col-lg-4 col-md-4 col-sm-4 col-xs-4 btn btn-white btn-large" id="${article.id }">
											<span class="bookmark_Off pull-right" id="bookmark_img"></span>
											</a>
							<input type="hidden" value="${readArticle.total_like}" id="total_like">
	                       <input type="hidden" value="${member_id}" id="member_id">				
                        <input type="hidden" value="${article_id}" id="article_id">                        
                        <input type="hidden" value="${bookmarkCount}" id="bookmark_count">	
	                    <input type="hidden" value="${bookmarkCount}" id="total_bookmark">
	                     <input type="hidden" value="${isBookMarkState}" id="isBookMarkState">	                     
	                     <input type="hidden" value="${likeCount}" id="total_like">
	                     <input type="hidden" value="${likeCount}" id="like_count">                          
	                     <input type="hidden" value="${isLikeState}" id="isLikeState">	                     
									</div>
									<!--// like + comment + book mark -->
								</div>
							</div>						
					</div>
			<!--// content body picture -->
		</div>
		<!--// content body -->
		<!-- comment -->
		<!-- 덧글 -->
		
		
		
		<hr />
		<form id="comment_form" method="post" action="${pageContext.request.contextPath}/comment/comment_write">
			<!-- 글 번호 상태 유지 -->
			<input type='hidden' name='article_id' value='${readArticle.id}'/>
			<!-- 내용입력, 저장버튼 -->
			<div class='form-group'>
				<div class="input-group">
					<textarea class="form-control custom-control" name='content' style="resize: none; height: 80px" placeholder="what's your experience?"></textarea>
					<span class="input-group-btn">
						<button type="submit" class="btn btn-success" style="height: 80px">Save</button>
					</span>
				</div>
			</div>
		</form>		
		<!--// comment -->	
			
			
		
			
		<!-- 덧글 리스트 -->
		<ul class="media-list" id="comment_list">
		</ul>
		<!--// Review Content  -->
	</div>

	<!-- 메인 화면 끝 -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
   <c:if test="${item[0].member_id ==loginInfo.id}">  
	</c:if>
	<!-- 덧글 항목에 대한 템플릿 참조 -->
<script id="tmpl_comment_item" type="text/x-handlebars-template">
    <li class="media" style='border-top: 1px dotted #ccc; padding-top: 15px' id="comment_{{id}}">
        <div class="media-body" style='display: block;'>
            <h4 class="media-heading clearfix">
                <!-- 작성자,작성일시 -->
                <div class='pull-left'>
                    <a href="${pageContext.request.contextPath}/mymenu/user_page?member_id={{member_id}}">{{nick_name}}</a>
                    <small> / {{reg_date}}
                </div>
                <!-- 수정,삭제 버튼 -->        	
                <div class='pull-right'>

{{#isMineState mine id}}

{{/isMineState}}

         
             </div>
             
            </h4>
            <!-- 내용 -->
            <p>{{{content}}}</p>
        </div>
    </li>
</script>

<!-- 덧글 삭제시 사용될 Modal -->
<div class="modal fade" id="comment_delete_modal">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">

    </div>
  </div>
</div>

<!-- 덧글 수정시 사용될 Modal -->
<div class="modal fade" id="comment_edit_modal">
  <div class="modal-dialog">
    <div class="modal-content">

    </div>
  </div>
</div>

<script type="text/javascript">
	$(function() {
		
		
		/*
		
		 <c:if test='${item[0].member_id == loginInfo.id}'> 
	<a href='${pageContext.request.contextPath}/comment/comment_edit?comment_id={{id}}' data-toggle="modal" data-target="#comment_edit_modal" class='btn btn-warning btn-xs'>
                        <i class='glyphicon glyphicon-edit'></i>
                    </a>
                    <a href='${pageContext.request.contextPath}/comment/comment_delete?comment_id={{id}}' data-toggle="modal" data-target="#comment_delete_modal" class='btn btn-danger btn-xs'>
                        <i class='glyphicon glyphicon-remove'></i>
                    </a>   
	</c:if >
		
		*/
				
		
		
		
		Handlebars.registerHelper('isMineState', function(isMine,id) {
				  var result = '';
				  if(isMine) {
					  result =
	                        '<a href="${pageContext.request.contextPath}/comment/comment_delete?comment_id='+id+'" data-toggle="modal" data-target="#comment_delete_modal" class="btn btn-danger btn-xs">'
	                            + '<i class="glyphicon glyphicon-remove"></i>'
	                        +'</a>';
					  
				    return result;
				  }else{
					return result;
				  }
				});
		
		$.get("${pageContext.request.contextPath}/comment/comment_list", {article_id: "${readArticle.id}"}, function(json) {
			if (json.rt != "OK") {
				alert(json.rt);
				return false;
			}
			
			
			// 템플릿 HTML을 로드한다.
			var template = Handlebars.compile($("#tmpl_comment_item").html());
			
			// JSON에 포함된 '&lt;br/&gt;'을 검색에서 <br/>로 변경함.
			// --> 정규표현식 /~~~/g는 문자열 전체의 의미.
			for (var i=0; i<json.item.length; i++) {
				json.item[i].content 
					= json.item[i].content.replace(/&lt;br\/&gt;/g, "<br/>");
				
				// 덧글 아이템 항목 하나를 템플릿과 결합한다.
				var html = template(json.item[i]);
				// 결합된 결과를 덧글 목록에 추가한다.
				$("#comment_list").append(html);
			}
		});
		
		/** 덧글 작성 폼의 submit 이벤트 Ajax 구현 */
		// <form>요소의 method, action속성과 <input>태그를
		// Ajax요청으로 자동 구성한다.
		$("#comment_form").ajaxForm(function(json) {
			// json은 API에서 표시하는 전체 데이터
			if (json.rt != "OK") {
				alert(json.rt);
				return false;
			}

			// 줄 바꿈에 대한 처리
			// --> 정규표현식 /~~~/g는 문자열 전체의 의미.
			// --> JSON에 포함된 '&lt;br/&gt;'을 검색에서 <br/>로 변경함.
			json.item.content = json.item.content.replace(/&lt;br\/&gt;/g, "<br/>");
			
			// 템플릿 HTML을 로드한다.
			var template = Handlebars.compile($("#tmpl_comment_item").html());
			// JSON에 포함된 작성 결과 데이터를 템플릿에 결합한다.
			var html = template(json.item);
			// 결합된 결과를 덧글 목록에 추가한다.
			$("#comment_list").append(html);
			// 폼 태그의 입력값을 초기화 하기 위해서 reset이벤트를 강제로 호출
			$("#comment_form").trigger('reset');
		});
		
		/** 모든 모달창의 캐시 방지 처리 */
		$('.modal').on('hidden.bs.modal', function (e) {
			// 모달창 내의 내용을 강제로 지움.
    		$(this).removeData('bs.modal');
		});
		
		/** 동적으로 로드된 폼 안에서의 submit 이벤트 */
		$(document).on('submit', "#comment_delete_form", function(e) {
			e.preventDefault();

			// AjaxForm 플러그인의 강제 호출
			$(this).ajaxSubmit(function(json) {
				if (json.rt != "OK") {
					alert(json.rt);
					return false;
				}				
				
				
				// modal 강제로 닫기
				$("#comment_delete_modal").modal('hide');
				
				// JSON 결과에 포함된 덧글일련번호를 사용하여 삭제할 <li>의 id값을 찾는다.
				var comment_id = json.comment_id;
				$("#comment_"+comment_id).remove();
			});
		});
		
		/** 동적으로 로드된 폼 안에서의 submit 이벤트 */
		$(document).on('submit', "#comment_edit_form", function(e) {
			e.preventDefault();
			
			// AjaxForm 플러그인의 강제 호출
			$(this).ajaxSubmit(function(json) {
				if (json.rt != "OK") {
					alert(json.rt);
					return false;
				}
				
				// 줄 바꿈에 대한 처리
				// --> 정규표현식 /~~~/g는 문자열 전체의 의미.
				// --> JSON에 포함된 '&lt;br/&gt;'을 검색에서 <br/>로 변경함.
				json.item.content = json.item.content.replace(/&lt;br\/&gt;/g, "<br/>");
				
				// 템플릿 HTML을 로드한다.
				var template = Handlebars.compile($("#tmpl_comment_item").html());
				// JSON에 포함된 작성 결과 데이터를 템플릿에 결합한다.
				var html = template(json.item);
				// 결합된 결과를 기존의 덧글 항목과 교체한다.
				$("#comment_" + json.item.id).replaceWith(html);
				
				// 덧글 수정 모달 강제로 닫기
				$("#comment_edit_modal").modal('hide');		
			});
						
		});
	});
</script>
	
</body>
</html>