package review.admin;

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
import review.jsp.helper.WebHelper;
import review.model.Article;
import review.service.ArticleService;
import review.service.impl.ArticleServiceImpl;

@WebServlet("/admin/manage_article_ok")
public class ManageArticleOk extends BaseController {
	private static final long serialVersionUID = -1391748040235555563L;

	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;
	ArticleService articleService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		/** (2) 필요한 헬퍼 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();		
		articleService = new ArticleServiceImpl(sqlSession, logger);		
		
		/** (4) 파라미터 받기 */		
	    String reg_date1 = web.getString("reg_date1");				
	    String reg_date2 = web.getString("reg_date2");

		// 전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인				
		logger.debug("reg_date1=" + reg_date1);
		logger.debug("reg_date2=======================" + reg_date2);
		
		Article article = new Article();
		article.setReg_date1(reg_date1);
		article.setReg_date2(reg_date2);
		
		/** (6) 게시물 목록 조회 */
		int total_count = 0;
		int total_article_date = 0;
		
		try {		
			// 전체 게시물 수
			total_count = articleService.selectArticleMainCount(article);		
			logger.debug("total_count=" + total_count);
			total_article_date = articleService.selectArticleAdminDateCount(article);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
						
		
		/** (7) 조회 결과를 View에 전달 */
		request.setAttribute("total_count", total_count);
		request.setAttribute("total_article_date", total_article_date);		
		/** (13) 모든 절차가 종료되었으므로 DB접속 해제 후 페이지 이동 */
		
		   String view = "admin/manage_article";
	        return view;		
	
	}
	
    
}
