package review.article;

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
import review.model.Article;
import review.model.Member;
import review.service.ArticleService;
import review.service.impl.ArticleServiceImpl;


@WebServlet("/article/article_delete")
public class ArticleDelete extends BaseController {
	private static final long serialVersionUID = -1391748040235555563L;

	/** (1) 사용하고자 하는 Helper+Service 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;		
	UploadHelper upload;			
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
		upload = UploadHelper.getInstance();		
		articleService = new ArticleServiceImpl(sqlSession, logger);
		
		/** (3) 글 번호 파라미터 받기 */
		int article_id = web.getInt("article_id");
		logger.debug("article_id" + article_id);
		
		if (article_id == 0) {
			web.redirect(null, "글 번호가 지정되지 않았습니다.123");
			sqlSession.close();
			return null;
		}
		
		//  파라미터를 Beans로 묶기
		Article article = new Article();
		article.setId(article_id);
				
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			article.setMember_id(loginInfo.getId());
		}
		
		/** (6) 게시물 일련번호를 사용한 데이터 조회 */	
		// 회원번호가 일치하는 게시물 수 조회하기
		int articleCount = 0; 
		try {
			articleCount = articleService.selectArticleCountByMemberId(article);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		
		/** (7) 자신의 글에 대한 요청인지에 대한 여부를 view에 전달 */
		boolean myArticle = articleCount > 0;
		request.setAttribute("myArticle", myArticle);
		
		// 상태유지를 위하여 게시글 일련번호를 View에 전달한다.
		request.setAttribute("article_id", article_id);
				
		String view = "article/article_delete";
		return view;
	}
	
       
    
}
