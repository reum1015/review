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
import review.jsp.helper.RegexHelper;
import review.jsp.helper.WebHelper;
import review.model.Member;
import review.service.MemberService;
import review.service.impl.MemberServiceImpl;


@WebServlet("/admin/manage_admin_update")
public class ManageAdminUpdate extends BaseController {
	private static final long serialVersionUID = -1391748040235555563L;


	/** (1) 사용하고자 하는 Helper+Service 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;	
	MemberService memberService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());	
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();		
		memberService = new MemberServiceImpl(sqlSession, logger);
	
		
		
	
	
				
				
				
		/** (4) 파라미터 받기 */		
		int id = web.getInt("id");
		String member_level = web.getString("member_level");
		logger.debug("member_level=======================" + member_level);
		System.out.println("member_level ------------> " + member_level.toString());
		// 전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인		
		logger.debug("id=======================" + id);
		
		
		/** (7) 전달받은 파라미터를 Beans 객체에 담는다. */
		Member member = new Member();						
		member.setId(id);
		member.setMember_level(member_level);
		
		/** (6) 게시물 목록 조회 */
		Member update_member_level = null;
		try {		
			memberService.updateAdminMemberLevel(member);	
			update_member_level = memberService.selectMember(member);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (7) 조회 결과를 View에 전달 */
		request.setAttribute("update_member_level", update_member_level);
		request.setAttribute("member_level", member_level);
		
		web.removeSession("loginInfo");
		web.setSession("loginInfo", update_member_level);			
								
			/** (13) 모든 절차가 종료되었으므로 DB접속 해제 후 페이지 이동 */
	    String view = "admin/manage_admin";
        return view;
	}	
}
