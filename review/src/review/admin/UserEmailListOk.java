package review.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import review.dao.MybatisConnectionFactory;
import review.jsp.helper.BaseController;
import review.jsp.helper.PageHelper;
import review.jsp.helper.RegexHelper;
import review.jsp.helper.WebHelper;

import review.model.Member;

import review.service.MemberService;

import review.service.impl.MemberServiceImpl;




@WebServlet("/admin/user_email_list_ok")
public class UserEmailListOk extends BaseController {
	private static final long serialVersionUID = -1391748040235555563L;

	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;
	MemberService memberService;
	PageHelper pageHelper;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		/** (2) 필요한 헬퍼 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();		
		memberService = new MemberServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();

		/** (4) 파라미터 받기 */		
	    String reg_date1 = web.getString("reg_date1");				
	    String reg_date2 = web.getString("reg_date2");
	    
		// 전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인				
		logger.debug("reg_date1=" + reg_date1);
		logger.debug("reg_date2=======================" + reg_date2);
		
		/** (5) 조회할 정보에 대한 Beans 생성 */
		Member member = new Member();
		member.setReg_date1(reg_date1);
		member.setReg_date2(reg_date2);
		
		int page = web.getInt("page", 1);
		int total_count = 0;
		
		/** (6) 게시물 목록 조회 */
		List<Member> emailList = null;
		try {		
			// 전체 게시물 수
			total_count = memberService.selectAdminMemberCount(member);
			emailList = memberService.selectAdminMemberEmailDate(member);
		
			pageHelper.pageProcess(page, total_count, 10, 8);			
			
			// 페이지 번호 계산결과에서 Limit절에 필요한 값을 Beans에 추가
			member.setLimit_start(pageHelper.getLimit_start());
			member.setList_count(pageHelper.getList_count());
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (7) 조회 결과를 View에 전달 */
		request.setAttribute("emailList", emailList);
		request.setAttribute("pageHelper", pageHelper);
		
		/** (13) 모든 절차가 종료되었으므로 DB접속 해제 후 페이지 이동 */
		
		   String view = "admin/user_email_list";
	        return view;
		
	
	}
	
    
}
