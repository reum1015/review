package review.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.jsp.helper.BaseController;
import review.jsp.helper.WebHelper;


@WebServlet("/member/forgot_pw")
public class ForgotPw extends BaseController {
	private static final long serialVersionUID = -1391748040235555563L;

	/** (1) 사용하고자 하는 Helper+Service 객체 선언 */
	WebHelper web;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		/** (2) 필요한 헬퍼 객체 생성 */
		web = WebHelper.getInstance(request, response);
					
		/** (3) 로그인 여부 검사 */
		// 로그인 중이라면 이페이지를 동작시켜서는 안된다.
		if(web.getSession("loginInfo") != null){
			web.redirect(web.getRootPath() + "/main", "you already login");
			return null;
		}
				
		String view = "member/forgot_pw";
		return view;
	}
	
       
    
}
