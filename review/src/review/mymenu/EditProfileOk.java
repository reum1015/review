package review.mymenu;

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
import review.model.Member;
import review.service.MemberService;
import review.service.impl.MemberServiceImpl;

@WebServlet("/mymenu/edit_profile_ok")
public class EditProfileOk extends BaseController {
	private static final long serialVersionUID = -1391748040235555563L;

	/** (1) 사용하고자 하는 Helper+Service 객체 선언 */
		Logger logger;
		SqlSession sqlSession;
		WebHelper web;
		RegexHelper regex;		
		UploadHelper upload;		
		MemberService memberService;		
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		/** (2) 필요한 헬퍼 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		upload = UploadHelper.getInstance();
		// 회원가입 처리를 위한 Service객체
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		memberService = new MemberServiceImpl(sqlSession, logger);
					
		/** (3) 로그인 여부 검사 */		
		Member loginInfo = (Member) web.getSession("loginInfo");
		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
			if(web.getSession("loginInfo") == null){
					sqlSession.close();
					web.redirect(web.getRootPath() + "/main", "you are need log in.");
					return null;
				}		
				

				/** (4) 파라미터 받기 */		
								
				
								
				String introduce = web.getString("introduce");					
				String gender = web.getString("gender");
				String age = web.getString("age");
				

				// 전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인				
				
				
				logger.debug("introduce=" + introduce);				
				logger.debug("gender=" + gender);
				logger.debug("age=" + age);
			
				
				/** (5) 입력값의 유효성 검사 */
			
						
		
				// 나이 검사
				if (!regex.isValue(age)) {
					sqlSession.close();
					web.redirect(null, "age field is required.");
					return null;
				}
				
				if (!regex.isNum(age)) {
					sqlSession.close();
					web.redirect(null, "please enter a valid number.");
					return null;
				}		

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

						/** (7) 전달받은 파라미터를 Beans 객체에 담는다. */
						Member member = new Member();						
						member.setId(loginInfo.getId());
						member.setIntroduce(introduce);		
												
						member.setGender(gender);
						member.setAge(age);						
		
						/** (9) Service를 통한 데이터베이스 저장 처리 */
						// 변경된 정보를 저장하기 위한 객체
						Member editInfo = null;
						try {							
							memberService.updateEditProfile(member);
							editInfo = memberService.selectMember(member);
						} catch (Exception e) {
							web.redirect(null, e.getLocalizedMessage());
							return null;
						} finally {
							sqlSession.close();
						}
						// 세션을 갱신한다.
						web.removeSession("loginInfo");
						web.setSession("loginInfo", editInfo);	
						
						
						// INSERT,UPDATE,DELETE 처리를 수행하는 action 페이지들은 자체적으로 View를
						// 갖지 않고 결과를 확인할 수 있는 다른 페이지로 강제 이동시켜야 한다. 
						// 그러므로 View의 경로를 리턴하지 않는다.(중복실행 방지)
						String view = "main";
						return view;
	}
}
