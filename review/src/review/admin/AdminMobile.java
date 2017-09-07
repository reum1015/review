package review.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.jsp.helper.BaseController;
import review.jsp.helper.WebHelper;
import review.model.Member;


@WebServlet("/admin/admin_mobile")
public class AdminMobile extends BaseController {
	private static final long serialVersionUID = -1391748040235555563L;

	/** (1) 사용하고자 하는 Helper+Service 객체 선언 */
	WebHelper web;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		/** (2) 필요한 헬퍼 객체 생성 */
		web = WebHelper.getInstance(request, response);
					
		//session에서 id값 가져오기
				Member loginInfo = null;
				String member_level=null;
				int member_id = 0;		
				loginInfo = (Member) web.getSession("loginInfo");		
				if(loginInfo == null){
					web.redirect(null,"it's not your page.");
					return null;
				} 
				if(loginInfo != null){	
					loginInfo = (Member)web.getSession("loginInfo");
					member_id = loginInfo.getId();
					member_level = loginInfo.getMember_level();
					if(member_id == 0 || member_level.equals("AA")){
						web.redirect(null, "it's not your page");
						return null;
					}
				}
		
				
		String view = "admin/admin_mobile";
		return view;
	}
	
       
    
}
