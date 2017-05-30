<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true"%>

<form id="invite_friend" method="post" action="${pageContext.request.contextPath}/member/invite_ok">		 
		 <div class="modal-header">
		 <button type="button" class="invite_friend" data-dismiss="modal" aria-label="close">
		 <span aria-hidden="true">&times;</span>
		 </button>
		  <h6 class="modal-title">Introduce Review&Bang to your friends</h6>		 
		 </div>
		 <div class="modal-body">
		   <div class="form-group">
		    <input type="email" name="write_email" id="write_email" class="form-control" />
		   </div>
		 </div>
		 <div class="modal-footer">
		 <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
		 <button type="submit" class="btn btn-danger">Send</button>
		 </div>
		 </form>
