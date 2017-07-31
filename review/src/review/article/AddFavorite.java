package review.article;

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
import review.jsp.helper.RegexHelper;
import review.jsp.helper.UploadHelper;
import review.jsp.helper.WebHelper;
import review.model.Article;

import review.model.Favorite;
import review.model.Member;
import review.service.ArticleService;

import review.service.FavoriteService;
import review.service.impl.ArticleServiceImpl;

import review.service.impl.FavoriteServiceImpl;


@WebServlet("/article/addFavorite")
public class AddFavorite extends BaseController {
	private static final long serialVersionUID = -1391748040235555563L;
	
	/** (1) 사용하고자 하는 Helper+Service 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;		
	UploadHelper upload;			
	ArticleService articleService;
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
		favoriteService = new FavoriteServiceImpl(sqlSession, logger);
		
		int member_id = web.getInt("member_id");
		int article_id = web.getInt("article_id");
		
		logger.debug("member_id=" + member_id);
		logger.debug("article_id=" + article_id);
		
		//관심 작품 등록 해제 여부 false --> 해제 , true --> 등록
		boolean isLikeState = false;
				
		int likeCount = web.getInt("likeCount");
		int totalLike = web.getInt("totalLike");
		

		
		System.out.println("likeCount ---------------------->" + likeCount);
		
		
		//관심등록이 등록된 상태이면 관심 등록 삭제
		if(likeCount == 1){
			//관심등록 테이블(favorite)에서 삭제 할 Beans 셋팅
			Favorite favorite = new Favorite();
			favorite.setMember_id(member_id);
			favorite.setArticle_id(article_id);
			
			
			//작품의 총 관심등록 -1을 위 한 Beans 셋팅
		  Article article = new Article();
		  article.setId(article_id);
			
			try{
				//관심등록 삭제
				favoriteService.deleteRemoveFavorite(favorite);
				articleService.likeCountMinus(article);
				
			
				
			}catch (Exception e) {
			
				web.redirect(null, e.getLocalizedMessage());
				return null;
			}finally {
				sqlSession.close();
			}//try ~ finally End
			
			isLikeState = false;
			totalLike--;
			likeCount = 0;
			
		}else{//관심등록이 되어있지 않은 상태이면 관심등록 추가
			
			//관심등록 테이블(favorite)에 저장할 회원정보 가져오기(birthdate, gender)
			//세션에서 가져온 회원정보
			Member loginInfo = new Member();
			loginInfo = (Member)web.getSession("loginInfo");
			
			logger.debug("loginInfo ------------->" + loginInfo);
			//관심등록 테이블에 저장 할 생일, 성별 추출 
		
			//파라미터 Beans에 담기
			Favorite favorite = new Favorite();		
			favorite.setArticle_id(article_id);
			
			favorite.setMember_id(member_id);
			
			//작품의 총 관심등록 -1을 위 한 Beans 셋팅
			  Article article = new Article();
			  article.setId(article_id);
				
			//총 관심등록 수 +1 파라미터 Beans에 담기
			//총 관심등록 수 +1은 Sql구문에 SET totalLike=totalLike+1을 통해 업데이트
		
			
			//총 관심등록 회원수 +1
			//json으로 화면에 뿌려줄 값(ajax 통신 완료후 화면에 뿌려주기 위한 값)
			totalLike++;
		
			try{
				//관심등록 테이블에 추가
				favoriteService.insertAddFavorite(favorite);
				articleService.likeCountPlus(article);			
				
			}catch (Exception e) {				
				web.redirect(null, e.getLocalizedMessage());
				return null;
			}finally {
				sqlSession.close();
			}//try ~ finally End
			
			//관심작품 등록 상태 변경
			isLikeState = true;
			likeCount =1;			
			
		}//end else
		
		
		Map<String, Object> data = new HashMap<>();
		data.put("rt", "OK");
		data.put("totalLike", totalLike);
		data.put("isLikeState", isLikeState);
		data.put("likeCount", likeCount);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		
		return null;
	}
	
	
       
    
}
