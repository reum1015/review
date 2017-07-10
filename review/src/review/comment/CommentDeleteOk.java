package review.comment;

import java.io.IOException;
import java.util.HashMap;

import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;

import review.dao.MybatisConnectionFactory;
import review.jsp.helper.BaseController;

import review.jsp.helper.WebHelper;
import review.model.Comment;
import review.model.Member;
import review.service.CommentService;
import review.service.impl.CommentServiceImpl;




@WebServlet("/comment/comment_delete_ok")
public class CommentDeleteOk extends BaseController {
	private static final long serialVersionUID = -1391748040235555563L;

	/** (1) 사용하고자 하는 Helper+Service 객체 선언 */
	WebHelper web;
	Logger logger;
	SqlSession sqlSession;	
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
		commentService = new CommentServiceImpl(sqlSession, logger);
		
		/** (3) 파라미터 받기 */
		int comment_id = web.getInt("comment_id");
		logger.debug("comment_id=" + comment_id);
		
		/** (4) 입력 받은 파라미터에 대한 유효성 검사 */
		// 덧글이 소속될 게시물의 일련번호
		if (comment_id == 0) {
			sqlSession.close();
			web.printJsonRt("덧글 일련번호가 없습니다.");
			return null;
		}
		
		/** (5) 입력 받은 파라미터를 Beans로 묶기 */
		Comment comment = new Comment();
		comment.setId(comment_id);
		
		/** (5) 데이터 삭제 처리 */
		// 로그인 중이라면 회원일련번호를 Beans에 추가한다.
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			comment.setMember_id(loginInfo.getId());
		}
		
		try {
			// Beans에 추가된 자신의 회원번호를 사용하여 자신의 덧글임을 판별한다.
			// --> 자신의 덧글이 아니라면 비밀번호 검사
			 commentService.selectCommentCountByMemberId(comment);  
			commentService.deleteComment(comment);	// 덧글삭제
		} catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (6) 처리 결과를 JSON으로 출력하기 */
		// --> import java.util.HashMap;
		// --> import java.util.Map;
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("comment_id", comment_id);
		
		// --> import com.fasterxml.jackson.databind.ObjectMapper;
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		
		return null;
	}

       
    
}
