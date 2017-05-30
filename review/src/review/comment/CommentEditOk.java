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






@WebServlet("/comment/comment_edit_ok")
public class CommentEditOk extends BaseController {
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
		String nick_name = web.getString("nick_name");
		String content = web.getString("content");
		// 작성자 아이피 주소 가져오기
		String ip_address = web.getClientIP();
		// 회원 일련번호 --> 비 로그인인 경우 0
		int member_id = 0;

		// 전달된 파라미터는 로그로 확인한다.
		logger.debug("comment_id=" + comment_id);
		logger.debug("nick_name=" + nick_name);		
		logger.debug("content=" + content);
		logger.debug("ip_address=" + ip_address);
		logger.debug("member_id=" + member_id);

		/** (4) 로그인 한 경우 자신의 글이라면 입력하지 않은 정보를 세션 데이터로 대체한다. */
		// 소유권 검사 정보
		boolean myComment = false;
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			try {
				// 소유권 판정을 위하여 사용하는 임시 객체
				Comment temp = new Comment();
				temp.setId(comment_id);
				temp.setMember_id(loginInfo.getId());

				if (commentService.selectCommentCountByMemberId(temp) > 0) {
					// 소유권을 의미하는 변수 변경
					myComment = true;
					// 입력되지 않은 정보들 갱신
					nick_name = loginInfo.getName();
					member_id = loginInfo.getId();
				}
			} catch (Exception e) {
				sqlSession.close();
				web.printJsonRt(e.getLocalizedMessage());
				return null;
			}
		}

		// 전달된 파라미터는 로그로 확인한다.
		logger.debug("comment_id=" + comment_id);
		logger.debug("nick_name=" + nick_name);
		logger.debug("content=" + content);
		logger.debug("ip_address=" + ip_address);
		logger.debug("member_id=" + member_id);

		/** (5) 입력 받은 파라미터에 대한 유효성 검사 */
		if (comment_id == 0) {
			sqlSession.close();
			web.printJsonRt("덧글 번호가 없습니다.");
			return null;
		}	

		if (!regex.isValue(content)) {
			sqlSession.close();
			web.printJsonRt("내용을 입력하세요.");
			return null;
		}

		/** (6) 입력 받은 파라미터를 Beans로 묶기 */
		Comment comment = new Comment();
		// UPDATE문의 WHERE절에서 사용해야 하므로 덧글 번호 추가
		comment.setId(comment_id);
		comment.setNick_name(nick_name);		
		comment.setContent(content);
		comment.setIp_address(ip_address);
		comment.setMember_id(member_id);
		logger.debug(comment.toString());

		/** (7) 게시물 변경을 위한 Service 기능을 호출 */
		Comment item = null;
		try {		
			commentService.updateComment(comment);
			// 변경된 결과를 조회
			item = commentService.selectComment(comment);
		} catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (8) 처리 결과를 JSON으로 출력하기 */
		// 줄바꿈이나 HTML특수문자에 대한 처리
		item.setNick_name(web.convertHtmlTag(item.getNick_name()));
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
