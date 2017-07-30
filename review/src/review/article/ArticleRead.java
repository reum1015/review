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
import review.model.BookMark;
import review.model.Favorite;
import review.model.Member;
import review.service.ArticleService;
import review.service.BookMarkService;
import review.service.CommentService;
import review.service.FavoriteService;
import review.service.ImageFileService;
import review.service.impl.ArticleServiceImpl;
import review.service.impl.BookMarkServiceImpl;
import review.service.impl.CommentServiceImpl;
import review.service.impl.FavoriteServiceImpl;
import review.service.impl.ImageFileServiceImpl;




@WebServlet("/article/article_read")
public class ArticleRead extends BaseController {
	private static final long serialVersionUID = -1391748040235555563L;

	/** (1) 사용하고자 하는 Helper+Service 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;		
	UploadHelper upload;			
	ArticleService articleService;
	ImageFileService imageFileService;
	CommentService commentService;
	BookMarkService bookmarkService;
	FavoriteService favoriteService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("application/json");
		/** (2) 필요한 헬퍼 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MybatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		upload = UploadHelper.getInstance();
		articleService = new ArticleServiceImpl(sqlSession, logger);
		imageFileService = new ImageFileServiceImpl(sqlSession, logger);
		commentService = new CommentServiceImpl(sqlSession, logger);		
		bookmarkService = new BookMarkServiceImpl(sqlSession, logger);
		favoriteService = new FavoriteServiceImpl(sqlSession, logger);
		
	int member_id = 0;
		
		Member loginInfo = (Member)web.getSession("loginInfo");
		
		if(loginInfo != null){
			member_id = loginInfo.getId();
		}
		
		logger.debug("member_id -----------------------------------> " + member_id);
		
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
	
		// 북마크 저장변수
				int bookmarkCount = 0;
				int favoriteCount = 0;
				
		        BookMark bookmark = new BookMark();
		        bookmark.setMember_id(member_id);
		        bookmark.setArticle_id(article_id);
		
		        Favorite favorite = new Favorite();
				favorite.setArticle_id(article_id);
				favorite.setMember_id(member_id);
		        
		/** (4) 게시물 일련번호를 사용한 데이터 조회 */
		// 지금 읽고 있는 게시물이 저장될 객체
		Article readArticle = null;
		
		
		
		/** 조회수 중복 갱신 방지 처리 */
		// 카테고리와 게시물 일련번호를 조합한 문자열을 생성
		// ex) document_notice_15
		String cookieKey = "article_" + "_" + article_id;
		// 준비한 문자열에 대응되는 쿠키값 조회
		String cookieVar = web.getCookie(cookieKey);
		
		try {
			// 쿠키값이 없다면 조회수 갱신
			if (cookieVar == null) {
			articleService.updateArticleHit(article);
						// 준비한 문자열에 대한 쿠키를 24시간동안 저장
			web.setCookie(cookieKey, "Y", 60 * 60 * 24);
					}
			readArticle = articleService.selectArticle(article);	
			// 북마크 확인용
			bookmarkCount = bookmarkService.selectCountBookMarkById(bookmark);
			favoriteCount = favoriteService.selectCountFavoriteArticleById(favorite);
			
		} catch (Exception e) {
			web.redirect(null, e.getMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		if (readArticle != null) {
			String imagePath = readArticle.getImagePath();
			if (imagePath != null) {
				String thumbPath = upload.createThumbnail(imagePath, 340, 300, true);
			// 글 목록 컬렉션 내의 Beans 객체가 갖는 이미지 경로를 썸네일로 변경한다.
			readArticle.setImagePath(thumbPath);
				logger.debug("thumbnail create > " + readArticle.getImagePath());
							}
		}
	
		
		
		boolean isBookMarkState = bookmarkCount > 0;
		logger.debug("bookmarkCount ------->" + bookmarkCount);
		
		boolean isFavoriteState = favoriteCount > 0;
		logger.debug("favoriteCount ------->" + favoriteCount);
		
		/** (7) 읽은 데이터를 View에게 전달한다 */
		request.setAttribute("readArticle", readArticle);
		
		request.setAttribute("isBookMarkState", isBookMarkState);
        request.setAttribute("bookmarkCount", bookmarkCount);
        request.setAttribute("favoriteCount", favoriteCount);
        request.setAttribute("isFavoriteState", isFavoriteState);
        request.setAttribute("member_id", member_id);
		request.setAttribute("article_id", article_id);
		
		
				
		String view = "article/article_read";
		return view;
	}
	
       
    
}
