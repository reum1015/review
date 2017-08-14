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


@WebServlet("/admin/manage_user_ok")
public class ManageUserOk extends BaseController {
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
	    String reg_date1 = web.getString("reg_date1");				
	    String reg_date2 = web.getString("reg_date2");

		// 전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인				
		logger.debug("reg_date1=" + reg_date1);
		logger.debug("reg_date2=======================" + reg_date2);
		
		
		Member member = new Member();
		member.setReg_date1(reg_date1);
		member.setReg_date2(reg_date2);
		
		/** (6) 게시물 목록 조회 */
		int total_count = 0;
		int total_article_date = 0;
		
		try {		
			// 전체 게시물 수
			total_count = memberService.selectAdminMemberCount(member);
			
			total_article_date = memberService.selectAdminMemberDateCount(member);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
						
		
		/** (7) 조회 결과를 View에 전달 */
		request.setAttribute("total_count", total_count);
		request.setAttribute("total_article_date", total_article_date);		
		/** (13) 모든 절차가 종료되었으므로 DB접속 해제 후 페이지 이동 */
		
				
		/** (13) 모든 절차가 종료되었으므로 DB접속 해제 후 페이지 이동 */
	    String view = "admin/manage_user";
        return view;
	}
	
       
    
}
