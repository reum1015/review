package review.member;

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






@WebServlet("/member/invite")
public class Invite extends BaseController {
	private static final long serialVersionUID = -1391748040235555563L;

	/** (1) 사용하고자 하는 Helper+Service 객체 선언 */
	WebHelper web;
	Logger logger;
	SqlSession sqlSession;
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		/** (2) 필요한 헬퍼 객체 생성 */
		web = WebHelper.getInstance(request, response);
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MybatisConnectionFactory.getSqlSession();
		
		
		/** (3) 로그인 여부 검사 */
		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if(web.getSession("loginInfo") == null){
			sqlSession.close();
			web.redirect(web.getRootPath() + "/main", "you need log in.");
			return null;
		}		
				
		String view = "member/invite";
		return view;
	}
	
	       
    
}
