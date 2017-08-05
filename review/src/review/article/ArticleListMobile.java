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
import review.jsp.helper.PageHelper;
import review.jsp.helper.RegexHelper;
import review.jsp.helper.UploadHelper;
import review.jsp.helper.WebHelper;
import review.model.Article;
import review.model.BookMark;
import review.model.Favorite;
import review.model.Member;
import review.service.ArticleService;
import review.service.BookMarkService;
import review.service.FavoriteService;
import review.service.ImageFileService;
import review.service.impl.ArticleServiceImpl;
import review.service.impl.BookMarkServiceImpl;
import review.service.impl.FavoriteServiceImpl;
import review.service.impl.ImageFileServiceImpl;
import twitter4j.JSONArray;
import twitter4j.JSONException;



@WebServlet("/article/article_list_mobile")
public class ArticleListMobile extends BaseController {
	private static final long serialVersionUID = -1391748040235555563L;

	/** (1) 사용하고자 하는 Helper+Service 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;		
	UploadHelper upload;			
	ArticleService articleService;
	ImageFileService imageFileService;
	PageHelper pageHelper;
	FavoriteService favoriteService;
	BookMarkService bookmarkService;
	
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
		pageHelper = PageHelper.getInstance();			
	   favoriteService = new FavoriteServiceImpl(sqlSession, logger);
	   bookmarkService = new BookMarkServiceImpl(sqlSession, logger);
	   
	/** (5) 조회할 정보에 대한 Beans 생성 */
		// 검색어
		String keyword = web.getString("keyword");
		/** (3) 글 번호 파라미터 받기 */
		int article_id = web.getInt("article_id");
		logger.debug("article_id" + article_id);
		
		
		Article article = new Article();
		article.setId(article_id);	
		article.setCategory(keyword);
		article.setTitle(keyword);
		article.setContent(keyword);		
		
		int page = web.getInt("page", 1);
		
		int member_id = 0;
		
		Member loginInfo = (Member)web.getSession("loginInfo");
		
		if(loginInfo != null){
			member_id = loginInfo.getId();
		}
		
		logger.debug("member_id -----------------------------------> " + member_id);
		
	
		
		int likeCount = 0;

		// 북마크 저장변수
		int bookmarkCount = 0;
		
		Favorite favorite = new Favorite();
		favorite.setArticle_id(article_id);
		favorite.setMember_id(member_id);		
		favorite.setCategory(keyword);
		favorite.setTitle(keyword);
		favorite.setContent(keyword);	
		
        BookMark bookmark = new BookMark();
        bookmark.setMember_id(member_id);
        bookmark.setArticle_id(article_id);
		
		/** (6) 게시물 목록 조회 */
		int total_count = 0;
		int totalCount = 0;
		List<Article> articleList = null;
		List<Favorite> favoriteList = null;
		
		//회원의 좋아요 상태 확인
		List<Favorite> favoriteStateList = null;
		
		//BestReviewList
		List<Article> selectArticleListForBest = null;
		
				
		try {
			// 전체 게시물 수
			total_count = articleService.selectArticleCount(article);
			totalCount = favoriteService.selectFavoriteCount(favorite);
			
			// 나머지 페이지 번호계산하기
			// --> 현재 페이지, 전체 게시물 수, 한페이지의 목록수, 그룹갯수
			pageHelper.pageProcess(page, total_count, 10, 8);
			pageHelper.pageProcess(page, totalCount, 10, 8);
			
			// 페이지 번호 계산결과에서 Limit절에 필요한 값을 Beans에 추가
			article.setLimit_start(pageHelper.getLimit_start());
			article.setList_count(pageHelper.getList_count());
			
			favorite.setLimit_start(pageHelper.getLimit_start());
			favorite.setList_count(pageHelper.getList_count());
			
			articleList = articleService.selectArticleList(article);
			favoriteList = favoriteService.selectFavoriteList(favorite);
			bookmarkCount = bookmarkService.selectCountBookMarkById(bookmark);
			likeCount = favoriteService.selectCountFavoriteArticleById(favorite);
			
			favoriteStateList = favoriteService.selectfavoriteStateList(favorite);
			
			selectArticleListForBest = articleService.selectArticleListForBest(article);
			
			
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		
		System.out.println("selectArticleListForBest ------------> " + selectArticleListForBest.toString());
		
		// 조회결과가 존재할 경우 --> 갤러리라면 이미지 경로를 썸네일로 교체(에피소드 리스트)
		if (articleList != null) {
			for (int i=0; i<articleList.size(); i++) {
				Article item = articleList.get(i);
				String imagePath = item.getImagePath();
				if (imagePath != null) {
					String thumbPath = upload.createThumbnail(imagePath, 220, 190, true);
					// 글 목록 컬렉션 내의 Beans 객체가 갖는 이미지 경로를 썸네일로 변경한다.
					item.setImagePath(thumbPath);
					logger.debug("thumbnail create > " + item.getImagePath());
				}
			}
		}
		
		
		
		if (favoriteList != null) {
			for (int i=0; i<favoriteList.size(); i++) {
				Favorite item = favoriteList.get(i);
				String imagePath = item.getImagePath();
				if (imagePath != null) {
					String thumbPath = upload.createThumbnail(imagePath, 220, 190, true);
					// 글 목록 컬렉션 내의 Beans 객체가 갖는 이미지 경로를 썸네일로 변경한다.
					item.setImagePath(thumbPath);
					logger.debug("thumbnail create > " + item.getImagePath());
				}
			}
		}
				
		boolean isBookMarkState = bookmarkCount > 0;
		logger.debug("bookmarkCount --------------->" + bookmarkCount);
				
		boolean isLikeState = likeCount > 0;
		logger.debug("likeCount ------->" + likeCount);
		/** (7) 조회 결과를 View에 전달 */
		
		
		JSONArray favoriteState = new JSONArray();
		
		try{
			favoriteState = new JSONArray(favoriteStateList.toArray());
		}catch (JSONException e) {
			
			e.printStackTrace();
		}
		
		//좋아요 확인용 리스트 자바스크립트용
		request.setAttribute("favoriteState", favoriteState);
		
		
		
		request.setAttribute("articleList", articleList);
		request.setAttribute("keyword", keyword);
		request.setAttribute("pageHelper", pageHelper);
		request.setAttribute("member_id", member_id);
		request.setAttribute("favoriteList", favoriteList);
		request.setAttribute("isBookMarkState", isBookMarkState);
        request.setAttribute("bookmarkCount", bookmarkCount);
        request.setAttribute("likeCount", likeCount);
        request.setAttribute("isLikeState", isLikeState);
        
        request.setAttribute("selectArticleListForBest", selectArticleListForBest);
		
		
		String view = "article/article_list_mobile";
		
		return view;
	}
	
       
    
}
