<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true"%>
<form id="comment_edit_form" method="post" 
	action="${pageContext.request.contextPath}/comment/comment_edit_ok">
	<!-- 삭제 대상에 대한 상태유지 -->
	<input type="hidden" name="comment_id" value="${comment.id}" />
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" 
			aria-label="Close"><span aria-hidden="true">&times;</span>
		</button>
		<h4 class="modal-title">덧글 수정</h4>
	</div>
	<div class="modal-body">
		<!-- 자신의 글이 아닌 경우 -->
		
		<!-- 덧글 내용 -->
		<div class="form-group">
			<textarea class="form-control" name="content" 
				rows="5">${comment.content}</textarea>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		<button type="submit" class="btn btn-danger">수정</button>
	</div>
</form>