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
import review.jsp.helper.RegexHelper;
import review.jsp.helper.UploadHelper;
import review.jsp.helper.WebHelper;
import review.service.MemberService;
import review.service.impl.MemberServiceImpl;
import review.model.Member;


@WebServlet("/member/sign_up_ok")
public class SignUpOk extends BaseController {

	private static final long serialVersionUID = -1391748040235555563L;

	/** (1) 사용하고자 하는 Helper + Service 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;
	UploadHelper upload;
	MemberService memberService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		upload = UploadHelper.getInstance();
		memberService = new MemberServiceImpl(sqlSession, logger);

		/** (3) 로그인 여부 검사 */
		// 로그인 중이라면 이 페이지를 동작시켜서는 안된다.
				if(web.getSession("loginInfo") !=null){
					sqlSession.close();
					web.redirect(web.getRootPath() + "/index", "you are already log in.ssssss");
					return null;
				}		

		/** (4) 파라미터 받기 */		
		
		String member_level = web.getString("member_level");
		String nick_name = web.getString("nick_name");
		String name = web.getString("name");
		String email = web.getString("email");
		String user_pw = web.getString("user_pw");		
		String gender = web.getString("gender");
		String age = web.getString("age");
		

		// 전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인
		logger.debug("member_level=" + member_level);
		logger.debug("nick_name=" + nick_name);
		logger.debug("name=" + name);
		logger.debug("email=" + email);
		logger.debug("user_pw=" + user_pw);		
		logger.debug("gender=" + gender);
		logger.debug("age=" + age);
	

		/** (5) 입력값의 유효성 검사 */
		


		

		// 성별 검사
				if (!regex.isValue(gender)) {
					sqlSession.close();
					web.redirect(null, "please to check one.");
					return null;
				}

				if (!gender.equals("M") && !gender.equals("F") && !gender.equals("Others") ) {
					sqlSession.close();
					web.redirect(null, "please to check one.");
					return null;
				}

		
		/** (6) 업로드 된 파일 정보 추출 */
		
		
		/** (7) 전달받은 파라미터를 Beans 객체에 담는다. */
		Member member = new Member();		
		member.setNick_name(nick_name);		
		member.setName(name);
		member.setUser_pw(user_pw);
		member.setGender(gender);		
		member.setEmail(email);		
		member.setAge(age);
		member.setMember_level(member_level);
		
				
		/** (8) Service를 통한 데이터베이스 저장 처리 */
		try {
			memberService.insertMember(member);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			// 예외가 발생한 경우이므로, 더이상 진행하지 않는다.
			return null;
		}
		/** (9) 가입이 완료되었으므로 메인페이지로 이동 */
		sqlSession.close();
		
		web.redirect(web.getRootPath() + "/member/login", "Welcom to Review&Bang. " + nick_name);
		
		return null;		
		
	}

}
