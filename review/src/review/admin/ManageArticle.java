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
import review.model.Member;
import review.service.ArticleService;
import review.service.impl.ArticleServiceImpl;




@WebServlet("/admin/manage_article")
public class ManageArticle extends BaseController {
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
		
		
      /** (5) 조회할 정보에 대한 Beans 생성 */
		Article article = new Article();
		
		/** (6) 게시물 목록 조회 */
		int total_count = 0;
		try {		
			// 전체 게시물 수
			total_count = articleService.selectArticleMainCount(article);		
			logger.debug("total_count=" + total_count);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
						
		
		/** (7) 조회 결과를 View에 전달 */
		request.setAttribute("total_count", total_count);
		request.setAttribute("member_level", member_level);
			
		/** (13) 모든 절차가 종료되었으므로 DB접속 해제 후 페이지 이동 */
		
		   String view = "admin/manage_article";
	        return view;
		
	
	}
	
    
}
