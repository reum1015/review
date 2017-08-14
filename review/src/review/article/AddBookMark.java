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
import review.model.BookMark;
import review.model.Member;
import review.service.ArticleService;
import review.service.BookMarkService;
import review.service.impl.ArticleServiceImpl;
import review.service.impl.BookMarkServiceImpl;


@WebServlet("/article/addBookMark")
public class AddBookMark extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7415038137705437355L;
	/** (1) 사용하고자 하는 Helper+Service 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;		
	UploadHelper upload;			
	ArticleService articleService;
	BookMarkService bookmarkService;
	
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
		bookmarkService = new BookMarkServiceImpl(sqlSession, logger);
		
		int member_id = web.getInt("member_id");
		int article_id = web.getInt("article_id");
		
		logger.debug("member_id : " + member_id);
		logger.debug("article_id : " + article_id);
		
		
		//관심 작품 등록 해제 여부 false --> 해제 , true --> 등록
		boolean isBookMarkState = false;
		
		//System.out.println("bookmark_count ---------------------->" + bookmark_count);
		
		
		BookMark bookmark = new BookMark();
		bookmark.setMember_id(member_id);
		bookmark.setArticle_id(article_id);
		
		int bookmarkCount = 0;
		
		try{
			
			bookmarkCount = bookmarkService.selectCountBookMarkById(bookmark);
			
			logger.debug("bookmarkCount : " + bookmarkCount);
			
			if(bookmarkCount > 0){
				System.out.println("여기 실행");
				bookmarkService.deleteRemoveBookMark(bookmark);
			}else{
				bookmarkService.insertAddBookMark(bookmark);
				isBookMarkState = true;
			}
		}catch (Exception e) {
			
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally {
			sqlSession.close();
		}//try ~ finally End
		
		
		
		Map<String, Object> data = new HashMap<>();
		data.put("rt", "OK");
		data.put("isBookMarkState", isBookMarkState);


		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		
		return null;
	}
	
	
       
    
}
