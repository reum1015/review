package review.comment;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import review.jsp.helper.RegexHelper;
import review.jsp.helper.WebHelper;
import review.model.Comment;
import review.model.Member;
import review.service.CommentService;
import review.service.impl.CommentServiceImpl;






@WebServlet("/comment/comment_select")
public class CommentSelelct extends BaseController {
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
		
	   int member_id = 0;
		
		Member loginInfo = (Member)web.getSession("loginInfo");
		
		if(loginInfo != null){
			member_id = loginInfo.getId();
		}
		
		logger.debug("member_id -----------------------------------> " + member_id);
		
		/** (3) 파라미터 받기 */
		int article_id = web.getInt("article_id");
		logger.debug("article_id=" + article_id);
		
				
		/** (4) 입력 받은 파라미터에 대한 유효성 검사 */
		// 덧글이 소속될 게시물의 일련번호
		if (article_id == 0) {
			sqlSession.close();
			web.printJsonRt("there is no article_id");
			return null;
		}
		
		/** (5) 입력 받은 파라미터를 Beans로 묶기 */
		Comment comment = new Comment();
		comment.setArticle_id(article_id);
		comment.setMember_id(member_id);
		logger.debug("comment >> " + comment.toString());
		/** (6) Service를 통한 덧글 목록 조회 */
		// 작성 결과를 저장할 객체
		Comment commentItem = null;
		
		List<Comment> item = new ArrayList<Comment>(); 
		item = null;
		
		try {
			item = commentService.selectCommentList(comment);	
			commentItem = commentService.selectComment(comment);
		} catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (7) 처리 결과를 JSON으로 출력하기 */
		// 줄바꿈이나 HTML특수문자에 대한 처리
		for (int i=0; i<item.size(); i++) {
			Comment temp = item.get(i);
			temp.setContent(web.convertHtmlTag(temp.getContent()));
		}
		
		// --> import java.util.HashMap;
		// --> import java.util.Map;
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("item", item);
		data.put("commentItem", commentItem);
				
		// --> import com.fasterxml.jackson.databind.ObjectMapper;
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		return null;
	}

       
    
}
