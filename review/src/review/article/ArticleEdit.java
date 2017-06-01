package review.article;

import java.io.IOException;
import java.util.List;

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
import review.model.ImageFile;
import review.service.ArticleService;
import review.service.ImageFileService;
import review.service.impl.ArticleServiceImpl;
import review.service.impl.ImageFileServiceImpl;




@WebServlet("/article/article_edit")
public class ArticleEdit extends BaseController {
	private static final long serialVersionUID = -1391748040235555563L;

		/** (1) 사용하고자 하는 Helper+Service 객체 선언 */
		Logger logger;
		SqlSession sqlSession;
		WebHelper web;
		RegexHelper regex;		
		UploadHelper upload;			
		ArticleService articleService;
		ImageFileService imageFileService;
		
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
			imageFileService = new ImageFileServiceImpl(sqlSession, logger);
						
			
			/** (3) 글 번호 파라미터 받기 */
			int article_id = web.getInt("article_id");
			logger.debug("article_id" + article_id);
					
			if (article_id == 0) {
				web.redirect(null, "글 번호가 지정되지 않았습니다.");
				sqlSession.close();
				return null;
			}
			
			//  파라미터를 Beans로 묶기
			Article article = new Article();
			article.setId(article_id);
			
			ImageFile file = new ImageFile();
			file.setArticle_id(article_id);
			
			/** (4) 게시물 일련번호를 사용한 데이터 조회 */
			// 지금 읽고 있는 게시물이 저장될 객체
			Article readArticle = null;
			List<ImageFile> articlefileList = null;			
			
			try {			
				readArticle = articleService.selectArticle(article);
				articlefileList = imageFileService.selectArticleFileList(file);
			} catch (Exception e) {
				web.redirect(null, e.getMessage());
				return null;
			} finally {
				sqlSession.close();
			}
		
			/** (7) 읽은 데이터를 View에게 전달한다 */
			request.setAttribute("readArticle", readArticle);
			request.setAttribute("fileList", articlefileList);
				
		String view = "article/article_edit";
		return view;
	}
	
       
    
}
