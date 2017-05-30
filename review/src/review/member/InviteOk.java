package review.member;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import review.dao.MybatisConnectionFactory;
import review.jsp.helper.BaseController;
import review.jsp.helper.MailHelper;
import review.jsp.helper.Util;
import review.jsp.helper.WebHelper;
import review.model.Member;
import review.service.MemberService;
import review.service.impl.MemberServiceImpl;



@WebServlet("/member/invite_ok")
public class InviteOk extends BaseController {
	private static final long serialVersionUID = -1391748040235555563L;

	/** (1) 사용하고자 하는 Helper+Service 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	MailHelper mail;
	Util util;
	MemberService memberService;
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		mail = MailHelper.getInstance();
		util = Util.getInstance();
		memberService = new MemberServiceImpl(sqlSession, logger);
			
		/** (3) 로그인 여부 검사 */
		// 로그인 중이라면 이페이지를 동작시켜서는 안된다.
		if(web.getSession("loginInfo")!=null){
			sqlSession.close();
			web.redirect(web.getRootPath() + "/main", "you already login");
			return null;
		}
		
		/** (4) 파라미터 처리 */
		// --> login.jsp에 배치된 폼으로부터 전송되는 입력값.
		String email = web.getString("email");
			
		logger.debug("email=" + email);
		
		
		if(email==null) {
			sqlSession.close();
			web.redirect(null, "We need this information to find your account.");
			return null;
		}
		
		/** (5) 임시 비밀번호 생성하기 */
		String new_password = Util.getInstance().getRandomPassword();
		
		/** (6) 전달받은 파라미터를 Beans에 설정한다. */
		Member member = new Member();
		member.setEmail(email);
		member.setUser_pw(new_password);
		
		/** (6) Service를 통한 회원인증 */
		try{
			memberService.updateMemberPasswordByEmail(member);
		}catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}	finally {
			sqlSession.close();
		}
				
		/** (8) 발급된 비밀번호를 메일로 발송하기 */
		String sender = "reviewnbang@gmail.com";
		String subject = "It's your new Review&Bang password.";
		String content = "This is your new password <strong>" + new_password + "</strong> thanks.";
		
		try {
			mail.sendMail(sender, email, subject, content);
		} catch (MessagingException e) {
			web.redirect(null, "fail to send email. please contant administrator.");
			return null;
		}
		/** (9) 메인페이지로 이동 */		
		web.redirect(null, "We've sent an email. Click the link in the email to reset your password.");
		return null;		
	
	}	
	       
    
}
