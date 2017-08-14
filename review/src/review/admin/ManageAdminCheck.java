package review.admin;

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
import review.jsp.helper.WebHelper;
import review.model.Member;
import review.service.MemberService;
import review.service.impl.MemberServiceImpl;


@WebServlet("/admin/manage_admin_check")
public class ManageAdminCheck extends BaseController {
	private static final long serialVersionUID = -1391748040235555563L;


	/** (1) 사용하고자 하는 Helper+Service 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;	
	MemberService memberService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		memberService = new MemberServiceImpl(sqlSession, logger);
		
		/** (4) 파라미터 받기 */		
		String nick_name = web.getString("nick_name");	
		int id = web.getInt("id");
		// 전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인				
		logger.debug("nick_name123===" + nick_name);
	
		
		
		/** (7) 전달받은 파라미터를 Beans 객체에 담는다. */
		Member member = new Member();	
		member.setId(id);
		member.setNick_name(nick_name);		
		
		/** (6) 게시물 목록 조회 */
		Member check_id = new Member();
		
		try {		
			// 닉네임 통해서 회원 아이디 체크
			check_id = memberService.selectAdminMemberId(member);		
			// 로그가 안댐.				
			logger.debug("check_id===================" + check_id);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (7) 조회 결과를 View에 전달 */
		request.setAttribute("check_id", check_id);
				
		/** (13) 모든 절차가 종료되었으므로 DB접속 해제 후 페이지 이동 */
	    String view = "admin/manage_admin";
        return view;
	}
}
