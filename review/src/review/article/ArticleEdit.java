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
import review.model.Member;
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
						
			/** (3) 로그인 여부 검사 */		
			Member loginInfo = (Member) web.getSession("loginInfo");
			// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
				if(web.getSession("loginInfo") == null){
						sqlSession.close();
						web.redirect(web.getRootPath() + "/index", "you need log in.");
						return null;
					}	
				
				
				
			
					/** (4) 파라미터 받기 */		
				    String email = web.getString("email");				
					String nick_name = web.getString("nick_name");
					String name = web.getString("name");
							
					
					// 전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인				
					logger.debug("email=" + email);
					logger.debug("nick_name=======================" + nick_name);
					logger.debug("name=" + name);
					
			
			
			
			/** (3) 글 번호 파라미터 받기 */
			int article_id = web.getInt("article_id");
		    int member_id = web.getInt("member_id");
			
		    logger.debug("article_id=" + article_id);
			logger.debug("member_id=" + member_id);
					
			if (article_id == 0) {
				web.redirect(null, "글 번호가 지정되지 않았습니다.");
				sqlSession.close();
				return null;
			}
			
			//  파라미터를 Beans로 묶기
			Article article = new Article();
			article.setId(article_id);
			article.setMember_id(member_id);
			
			Member member = new Member();						
			member.setId(loginInfo.getId());
			
			ImageFile file = new ImageFile();
			file.setArticle_id(article_id);
			
			/** (4) 게시물 일련번호를 사용한 데이터 조회 */
			// 지금 읽고 있는 게시물이 저장될 객체
			Article readArticle = null;
			List<ImageFile> articlefileList = null;	
			
			int article_member_id = 0;	
			article_member_id = web.getInt("article_member_id");
			
			
			if(loginInfo != null){	
				loginInfo = (Member)web.getSession("loginInfo");
								
				logger.debug("loginInfo.getId()  ------> " + loginInfo.getId());
				logger.debug("article_member_id)  ------> " + article_member_id);
				
				
				
				
				if(article_member_id != loginInfo.getId()) {
					web.redirect(null, "접근이 제한된 페이지 입니다.");
					return null;
				}
			}
			
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
