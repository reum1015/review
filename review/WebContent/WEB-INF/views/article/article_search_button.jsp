<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true"%>
<form id="article_search_button_form" method="post" 
	action="${pageContext.request.contextPath}/comment/comment_delete_ok">
	
	<input type="hidden" name="keyword" value="${keyword}" />
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" 
			aria-label="Close"><span aria-hidden="true">&times;</span>
		</button>
		<h4 class="modal-title">search</h4>
	</div>
	
	<div class="modal-body">
		${keyword}
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		<button type="submit" class="btn btn-danger">삭제</button>
	</div>
</form>