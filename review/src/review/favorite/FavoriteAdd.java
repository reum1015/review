package review.favorite;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;

import review.dao.MybatisConnectionFactory;
import review.jsp.helper.BaseController;
import review.jsp.helper.WebHelper;
import review.model.Article;
import review.model.Favorite;
import review.service.ArticleService;
import review.service.FavoriteService;
import review.service.impl.ArticleServiceImpl;
import review.service.impl.FavoriteServiceImpl;

@WebServlet("/favorite/favoriteAdd")
public class FavoriteAdd extends BaseController{
	private static final long serialVersionUID = -4619358184835581823L;
	
	/** (1) 사용하고자 하는 Helper+Service 객체 선언 */
	WebHelper web;
	Logger logger;
	SqlSession sqlSession;
	FavoriteService favoriteService;
	ArticleService articleService;
	

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json");
		
		/** (2) 필요한 헬퍼 객체 생성 */
		web = WebHelper.getInstance(request, response);
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MybatisConnectionFactory.getSqlSession();
		favoriteService = new FavoriteServiceImpl(sqlSession, logger);
		articleService = new ArticleServiceImpl(sqlSession, logger);
		
		int member_id = web.getInt("member_id");
		int article_id = web.getInt("article_id");
		
		logger.debug("member_id=" + member_id);
		logger.debug("article_id=" + article_id);
		
		//like 등록 해제 여부 false  --> 해제, true --> 등록
		boolean isLikeState = false;
		
		Favorite favorite = new Favorite();
		favorite.setArticle_id(article_id);
		favorite.setMember_id(member_id);
		
		logger.debug("favorite= " + favorite);
		
		int likeCount = 0;
		
		
		Article article = new Article();
		article.setId(article_id);
		
		try{
			likeCount = favoriteService.selectCountFavoriteArticleById(favorite);
			//카운트 0이면 like누른상태가 아님
			//like 상태로 전환
			//1이면 원상복귀
			if(likeCount == 0){
				favoriteService.insertAddFavorite(favorite);
				articleService.likeCountPlus(article);
				isLikeState = true;
			}else{
				favoriteService.deleteRemoveFavorite(favorite);
				articleService.likeCountMinus(article);
				isLikeState = false;
			}
			
			
		}catch (Exception e) {
			
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally {
			sqlSession.close();
		}//try ~ finally End
		
		
		
		/** (6) 처리 결과를 JSON으로 출력하기 */
		// --> import java.util.HashMap;
		// --> import java.util.Map;
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("likeCount", likeCount);
		data.put("isLikeState", isLikeState);
		
		// --> import com.fasterxml.jackson.databind.ObjectMapper;
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		
		return null;
	}

	

}
