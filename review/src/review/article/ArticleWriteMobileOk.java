package review.article;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import review.dao.MybatisConnectionFactory;
import review.jsp.helper.BaseController;
import review.jsp.helper.FileInfo;
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





@WebServlet("/article/article_write_mobile_ok")
public class ArticleWriteMobileOk extends BaseController {
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
					
			
		/** (3) 파일이 포함된 POST 파라미터 받기 */
		try {
			upload.multipartRequest(request);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, "it's not multipart data.");
			return null;
		}
		
		
		/** (4) UploadHelper에서 텍스트 형식의 값을 추출 */
		Map<String, String> paramMap = upload.getParamMap();
		String category = paramMap.get("category");	
		String title = paramMap.get("title");
		String content = paramMap.get("content");
		String nick_name = paramMap.get("nick_name");
		String user_pw = paramMap.get("user_pw");
		String ip_address = web.getClientIP();
		
	
		 int member_id = 0;
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {					
			member_id = loginInfo.getId();
			nick_name = loginInfo.getNick_name();			
			user_pw = loginInfo.getUser_pw();
		}
		
		// 전달된 파라미터는 로그로 확인한다.
		logger.debug("category=" + category);		
		logger.debug("title=" + title);
		logger.debug("content=" + content);		
		logger.debug("member_id=" + member_id);
		logger.debug("nick_name=" + nick_name);
		logger.debug("user_pw=" + user_pw);
		logger.debug("ip_address=" + ip_address);

	  Article article = new Article();
	  article.setCategory(category);
	  article.setTitle(title);
	  article.setContent(content);
	  article.setMember_id(member_id);
	  article.setNick_name(nick_name);
	  article.setUser_pw(user_pw);
	  article.setIp_address(ip_address);
	  logger.debug("article >> " + article.toString());
	  
		/** (9) Service를 통한 게시물 저장 */
		try {
			articleService.insertArticle(article);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
	  
		
		/** (10) 첨부파일 목록 처리 */
		// 업로드 된 파일 목록
		// --> import study.jsp.helper.FileInfo;
		List<FileInfo> fileList = upload.getFileList();
		
		try {
			// 업로드 된 파일의 수 만큼 반복 처리 한다.
			for (int i = 0; i < fileList.size(); i++) {
				// 업로드 된 정보 하나 추출하여 데이터베이스에 저장하기 위한 형태로 가공해야 한다.
				FileInfo info = fileList.get(0);

				// DB에 저장하기 위한 항목 생성
				ImageFile file = new ImageFile();

				// 몇 번 게시물에 속한 파일인지 지정한다.
				file.setArticle_id(article.getId());
				
				// 데이터 복사
				file.setOriginName(info.getOrginName());
				file.setFileDir(info.getFileDir());
				file.setFileName(info.getFileName());
				file.setContentType(info.getContentType());
				file.setFileSize(info.getFileSize());
				
				// 저장처리
				imageFileService.insertArticleFile(file);
			}
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
				
		sqlSession.close();						
		String url = "%s/article/article_read_mobile?article_id=%d";
		url = String.format(url, web.getRootPath(), article.getId());
		web.redirect(url, null);

		return null;
	}
	
       
    
}
