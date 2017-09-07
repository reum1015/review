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
import review.jsp.helper.UploadHelper;
import review.jsp.helper.WebHelper;
import review.model.Member;
import review.service.MemberService;
import review.service.impl.MemberServiceImpl;

@WebServlet("/member/login_ok")
public class LoginOk extends BaseController {
	private static final long serialVersionUID = -1391748040235555563L;

	/** (1) 사용하고자 하는 Helper+Service 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	MemberService memberService;
	UploadHelper upload;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		memberService = new MemberServiceImpl(sqlSession, logger);
		upload = UploadHelper.getInstance();
		
		/** (3) 로그인 여부 검사 */
		// 로그인 중이라면 이페이지를 동작시켜서는 안된다.
		if(web.getSession("loginInfo")!=null){
			sqlSession.close();
			web.redirect(web.getRootPath() + "/index", "you already login");
			return null;
		}
		
		/** (4) 파라미터 처리 */
		// --> login.jsp에 배치된 폼으로부터 전송되는 입력값.
		String email = web.getString("email");
		String user_pw = web.getString("user_pw");

		
		int article_id = web.getInt("article_id");
		
		logger.debug("email=" + email);
		logger.debug("userPw=" + user_pw);
		
		if(email==null || user_pw == null){
			sqlSession.close();
			web.redirect(null, "no account or no password");
			return null;
		}
		
		/** (5) 전달받은 파라미터를 Beans에 설정한다. */
		Member member = new Member();
		member.setEmail(email);
		member.setUser_pw(user_pw);
		
		/** (6) Service를 통한 회원인증 */
		Member loginInfo = null;
		
		try{
			loginInfo = memberService.selectLoginInfo(member);
		}catch(Exception e){
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}	
		
		
		
		/** (8) 조회된 회원 정보를 세션에 저장 */
		// 로그인 처리는 아이디와 비밀번호를 기반으로 조회된 정보를
		// 세션에 보관하는 과정을 말한다.
		// 로그인에 대한 판별은 저장된 세션정보의 존재 여부로 판별한다.
		
			
		web.setSession("loginInfo", loginInfo);
		
		//작품 정보가 있는경우 작품 리스트 페이지로 이동
				String rootPath = web.getRootPath();
				String url = rootPath + "/article/article_read?article_id=" + article_id;
		
				if(article_id != 0){
					sqlSession.close();
					web.redirect(url,  null);
					return null;
				}

		/** (9) 가입이 완료되었으므로 메인페이지로 이동 */
		sqlSession.close();
		
		
		String view = "index";
		/** 로그인 페이지로 변경 member/login */
		return view;
	
	}	
	       
    
}
