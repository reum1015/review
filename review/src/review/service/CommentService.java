package review.service;

import java.util.List;

import review.model.Comment;





public interface CommentService {

	/**
	 * 덧글을 저장한다.
	 * @param comment - 덧글 데이터
	 * @throws Exception
	 */
	public void insertComment(Comment comment) throws Exception;

	/**
	 * 하나의 덧글을 읽어들인다.
	 * @param comment - 읽어들일 게시물 일련번호가 저장된 Beans
	 * @return BbsComment - 읽어들인 게시물 내용
	 * @throws Exception
	 */
	public Comment selectComment(Comment comment) throws Exception;

	/**
	 * 하나의 게시물에 속한 모든 덧글 목록을 조회한다.
	 * @param comment - 읽어들일 게시물 일련번호가 저장된 Beans
	 * @return List - 읽어들인 덧글 목록
	 * @throws Exception
	 */
	// --> import java.util.List;
	public List<Comment> selectCommentList(Comment comment) throws Exception;
	
	
	/**
	 * 자신의 덧글인지 검사한다.
	 * @param Comment
	 * @return int
	 * @throws Exception
	 */
	public int selectCommentCountByMemberId(Comment comment) throws Exception;
	

	/**
	 * 덧글을 삭제한다.
	 * @param Comment
	 * @throws Exception
	 */
	public void deleteComment(Comment comment) throws Exception;
	
	/**
	 * 게시물을 수정한다.
	 * @param comment - 덧글 데이터
	 * @throws Exception
	 */
	public void updateComment(Comment comment) throws Exception;

	/**
	 * 덧글을 삭제한다.
	 * @param Comment
	 * @throws Exception
	 */
	public void deleteCommentAll(Comment comment) throws Exception;
	
	
}

	
