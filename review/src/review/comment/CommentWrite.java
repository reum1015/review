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
import review.jsp.helper.RegexHelper;
import review.jsp.helper.WebHelper;
import review.model.Comment;
import review.model.Member;
import review.service.CommentService;
import review.service.impl.CommentServiceImpl;





@WebServlet("/comment/comment_write")
public class CommentWrite extends BaseController {
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
		int article_id = web.getInt("article_id");
		String nick_name = web.getString("nick_name");
		String content = web.getString("content");
		// 작성자 아이피 주소 가져오기
		String ip_address = web.getClientIP();
		// 회원 일련번호 --> 비 로그인인 경우 0
		int member_id = 0;
		
		// 로그인 한 경우, 입력하지 않은 이름, 비밀번호, 이메일을 세션정보로 대체
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			nick_name = loginInfo.getNick_name();			
			member_id = loginInfo.getId();
		}

		// 전달된 파라미터는 로그로 확인한다.
		logger.debug("article_id=" + article_id);
		logger.debug("nick_name=" + nick_name);		
		logger.debug("content=" + content);
		logger.debug("ip_address=" + ip_address);
		logger.debug("member_id=" + member_id);
		
		/** (4) 입력 받은 파라미터에 대한 유효성 검사 */
		// 덧글이 소속될 게시물의 일련번호
		if (article_id == 0) {
			sqlSession.close();
			web.printJsonRt("게시물 일련번호가 없습니다.");
			return null;
		}
				

		// 내용 검사
		if (!regex.isValue(content)) {
			sqlSession.close();
			web.printJsonRt("field is required");
			return null;
		}

		/** (5) 입력 받은 파라미터를 Beans로 묶기 */
		Comment comment = new Comment();
		comment.setArticle_id(article_id);
		comment.setNick_name(nick_name);		
		comment.setContent(content);
		comment.setIp_address(ip_address);
		comment.setMember_id(member_id);
		logger.debug("comment >> " + comment.toString());
		
		/** (6) Service를 통한 덧글 저장 */
		// 작성 결과를 저장할 객체
		Comment item = null;
		try {
			commentService.insertComment(comment);
			item = commentService.selectComment(comment);
		} catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}

		
		/** (7) 처리 결과를 JSON으로 출력하기 */
		// 줄바꿈이나 HTML특수문자에 대한 처리		
		item.setContent(web.convertHtmlTag(item.getContent()));
		
		// --> import java.util.HashMap;
		// --> import java.util.Map;
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("item", item);
		
		// --> import com.fasterxml.jackson.databind.ObjectMapper;
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		

		
		return null;
	}
	
       
    
}
