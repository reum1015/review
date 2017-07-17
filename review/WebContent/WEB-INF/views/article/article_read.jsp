<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
 <!-- Multi-column -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/multi-column/ie-row-fix.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/plugins/multi-column/multi-columns-row.css"/>
	
<!-- main css -->


<style type="text/css">
.container {	
	height: auto;
}

.thumbnail {
	margin-top: 30px;
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/template/topbarsearch.jsp" />
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
									<c:url var="readUser" value="/mymenu/my_page">					            						            	
					            		<c:param name="member_id" value="${readArticle.member_id}" />
					            	</c:url>
									<!-- 링크 + 썸네일 -->
									<div class="read-container">									
										<h3 class="page-header" style="text-align: left; margin-top: -5px;">
										<a href="${readUser}"> ${readArticle.nick_name} </a>
											<span class="pull-right"> 
												<!--  ** 페이지 호출 할 때 article_id를 url에 포함하여 삭제 페이지를 호출 할 때 article_id를 넘겨주는 소스입니다.  --> 
												<!-- 추가 : article.member_id와 loginInfo의 id를 비교하여 버튼을 노출할 것인지를 판단 -->
												<c:if test="${readArticle.member_id==loginInfo.id}">
													<a href="${pageContext.request.contextPath}/article/article_edit?article_id=${readArticle.id}">
						                  				<i class="glyphicon glyphicon-edit"></i></a>
						                  	 		<a href="${pageContext.request.contextPath}/article/article_delete?article_id=${readArticle.id}">
						                  	  			<i class="glyphicon glyphicon-remove"></i></a>
												</c:if>
												<a href="${pageContext.request.contextPath}/article/article_list_main">
						                  				<i class="glyphicon glyphicon-th-list"></i></a>
						                  	 		
											</span> <br /> 
											<small>${readArticle.reg_date}</small>
											<small class="pull-right"> Hit: ${readArticle.hit}</small> <br /> 
											<small>
												<font size="4" color="#28282 "> keyword: </font> 
												<font size="4" color="#a0a0a0"> ${readArticle.category}</font></small> <br />
											<small>
												<font size="4" color="#28282 ">title:</font>
												<font size="4" color="#a0a0a0"> ${readArticle.title} </font>
											</small>
										</h3>
									</div>
									<!-- 이미지 화면에 출력 -->
									<c:choose>
						<c:when test="${readArticle.imagePath != null}">
			           <c:url var="downloadUrl" value="/download">
				    <c:param name="file" value="${readArticle.imagePath}" />
			        </c:url>
			         <a class="col-lg-4 col-md-4 col-sm-4">
			      <img src="${downloadUrl}" class="img-responsive" style="margin: auto" />
			      </a>	
									</c:when>
					<c:otherwise>
					<a class=" col-lg-4 col-md-4 col-sm-4 ">
						<img src="${pageContext.request.contextPath}/assets/imgs/img/frog1.jpg" class="img-circle img-responsive"/>
						</a>
					</c:otherwise>
								</c:choose>		
						
									<!--// 링크 + 썸네일 -->
									<!-- 제목 + 작성자 + 조회수 -->
									<div class="item col-lg-8 col-md-8 col-sm-7">
										<div style="overflow: auto; width: 100%; max-height: 350px;">
											${readArticle.content}
										</div>
									</div>
									<!--// 제목 + 작성자 + 조회수 -->
									<br />
									<!-- like + comment + book mark -->
									<div class="btn-group btn-block">
										<a href="#" class="col-lg-4 col-md-4 col-sm-4 col-xs-4 btn btn-white btn-large">
											<i class="">Like</i></a> 
										<a href="#" class="col-lg-4 col-md-4 col-sm-4 col-xs-4 btn btn-white btn-large">
											<i class="">Comment</i></a>
										<a href="#" class="col-lg-4 col-md-4 col-sm-4 col-xs-4 btn btn-white btn-large">
											<i class="">Book mark</i></a>
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
		<form id="comment_form" method="post"
			action="${pageContext.request.contextPath}/comment/comment_write">
			<!-- 글 번호 상태 유지 -->
			<input type='hidden' name='article_id' value='${readArticle.id}' />
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


	<!-- 덧글 항목에 대한 템플릿 참조 -->
<script id="tmpl_comment_item" type="text/x-handlebars-template">
    <li class="media" style='border-top: 1px dotted #ccc; padding-top: 15px' 
       id="comment_{{id}}">
        <div class="media-body" style='display: block;'>
            <h4 class="media-heading clearfix">
                <!-- 작성자,작성일시 -->
                <div class='pull-left'>
                    {{nick_name}}
                    <small> / {{reg_date}}
                    </small>
                </div>
                <!-- 수정,삭제 버튼 -->
        
                <div class='pull-right'>    
             <c:if test='${readArticle.member_id==loginInfo.id}'>
                    <a href='${pageContext.request.contextPath}/comment/comment_edit?comment_id={{id}}' data-toggle="modal" data-target="#comment_edit_modal" class='btn btn-warning btn-xs'>
                        <i class='glyphicon glyphicon-edit'></i>
                    </a>
                    <a href='${pageContext.request.contextPath}/comment/comment_delete?comment_id={{id}}' data-toggle="modal" data-target="#comment_delete_modal" class='btn btn-danger btn-xs'>
                        <i class='glyphicon glyphicon-remove'></i>
                    </a>     
         </c:if>
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
		/** 페이지가 열리면서 동작하도록 이벤트 정의 없이 Ajax요청 */
		$.get("${pageContext.request.contextPath}/comment/comment_list", {
			article_id: "${readArticle.id}"
		}, function(json) {
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