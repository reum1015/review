package review.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.jsp.helper.BaseController;


@WebServlet("/member/sign_up_mobile")
public class SignUpMobile extends BaseController {

	private static final long serialVersionUID = -1391748040235555563L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
			
		String view = "member/sign_up_mobile";
		return view;
	}
	
       
    
}
