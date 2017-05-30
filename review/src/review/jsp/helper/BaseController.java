package review.jsp.helper;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Servlet implementation class BaseController
 */
//@WebServlet("/basecontroller")
public abstract class BaseController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7553497577525180850L;
	public Logger logger = null;
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BaseController() {
    	
        String className = this.getClass().getName();
        // TODO Auto-generated constructor stub
        
        logger = LogManager.getLogger(className);
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		this.pageInit(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.pageInit(request, response);
	}

	
	private void pageInit(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		String url = request.getRequestURI().toString();
		if(request.getQueryString() != null){
			url = url + "?" + request.getQueryString();
		
		}
		
		String methodNmae = request.getMethod();
		
		logger.info("[" + methodNmae + "]" + url);
		
		String view = doRun(request, response);
		
		if(view != null){
			view="/WEB-INF/views/" + view + ".jsp";
			logger.info("[view ]" + view);
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
	
	}
	public abstract String doRun(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException;
}
