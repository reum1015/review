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

import review.service.CommentService;
import review.service.impl.CommentServiceImpl;







@WebServlet("/comment/comment_edit")
public class CommentEdit extends BaseController {
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
		
		/** (4) 입력 받은 파라미터에 대한 유효성 검사 */
		// 덧글이 소속될 게시물의 일련번호
		if (comment_id == 0) {
			sqlSession.close();
			web.printJsonRt("there is no comment_id");
			return null;
		}
		
		/** (5) 입력 받은 파라미터를 Beans로 묶기 */
		Comment comment = new Comment();
		comment.setId(comment_id);
		
		
		/** (4) 덧글 일련번호를 사용한 데이터 조회 */
		// 지금 읽고 있는 덧글이 저장될 객체
		Comment readComment = null;

		try {
			readComment = commentService.selectComment(comment);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}

		/** (5) 읽은 데이터를 View에게 전달한다. */
		request.setAttribute("comment", readComment);

		
		
		return "comment/comment_edit";
	}

       
    
}
