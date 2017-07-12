package review.legal;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import review.jsp.helper.BaseController;





@WebServlet("/legal/feedback")
public class Feedback extends BaseController {
	private static final long serialVersionUID = -1391748040235555563L;

		
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		

		return "legal/feedback";
		}

    
}
