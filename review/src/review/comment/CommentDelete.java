package review.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;


import review.dao.MybatisConnectionFactory;
import review.jsp.helper.BaseController;
import review.jsp.helper.RegexHelper;
import review.jsp.helper.WebHelper;
import review.model.Comment;
import review.model.Member;
import review.service.CommentService;
import review.service.impl.CommentServiceImpl;






@WebServlet("/comment/comment_delete")
public class CommentDelete extends BaseController {
	private static final long serialVersionUID = -1391748040235555563L;

	/** (1) 사용하고자 하는 Helper+Service 객체 선언 */
	WebHelper web;
	Logger logger;
	SqlSession sqlSession;
	RegexHelper regex;
	CommentService commentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		/** (2) 필요한 헬퍼 객체 생성 */
		response.setContentType("application/json");
		
		web = WebHelper.getInstance(request, response);
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MybatisConnectionFactory.getSqlSession();
		regex = RegexHelper.getInstance();
		commentService = new CommentServiceImpl(sqlSession, logger);
		
		/** (3) 파라미터 받기 */
		int comment_id = web.getInt("comment_id");
		logger.debug("comment_id=" + comment_id);		
		
		// 덧글이 소속될 게시물의 일련번호
		if (comment_id == 0) {
			sqlSession.close();
			web.redirect(null, "덧글 일련번호가 없습니다.");
			return null;
		}
		
		/** (5) 입력 받은 파라미터를 Beans로 묶기 */
		Comment comment = new Comment();
		comment.setId(comment_id);
		
		// 로그인 한 경우 현재 회원의 일련번호를 추가한다. (비로그인 시 0으로 설정됨)
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			comment.setMember_id(loginInfo.getId());
		}
		
		/** (4) 게시물 일련번호를 사용한 데이터 조회 */	
		// 회원번호가 일치하는 게시물 수 조회하기
		int commentCount = 0; 
		try {
			commentCount = commentService.selectCommentCountByMemberId(comment);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (5) 자신의 글에 대한 요청인지에 대한 여부를 view에 전달 */
		boolean myComment = commentCount > 0;
		logger.debug("myComment = " + myComment);
		request.setAttribute("myComment", myComment);
		
		// 상태유지를 위하여 게시글 일련번호를 View에 전달한다.
		request.setAttribute("comment_id", comment_id);
						
		return "comment/comment_delete";
	}

       
    
}
