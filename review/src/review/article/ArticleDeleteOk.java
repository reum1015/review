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
import review.model.Comment;
import review.model.ImageFile;
import review.model.Member;
import review.service.ArticleService;
import review.service.CommentService;
import review.service.ImageFileService;
import review.service.impl.ArticleServiceImpl;
import review.service.impl.CommentServiceImpl;
import review.service.impl.ImageFileServiceImpl;




@WebServlet("/article/article_delete_ok")
public class ArticleDeleteOk extends BaseController {
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
		commentService = new CommentServiceImpl(sqlSession, logger);
		
		
		/** (3) 글 번호 파라미터 받기 */
		int article_id = web.getInt("article_id");
		logger.debug("article_id" + article_id);
				
		if (article_id == 0) {
			web.redirect(null, "글 번호가 지정되지 않았습니다.asd");
			sqlSession.close();
			return null;
		}
		
	        //  파라미터를 Beans로 묶기
			Article article = new Article();
			article.setId(article_id);
			
			ImageFile file = new ImageFile();
			file.setArticle_id(article_id);
			
			// 게시물에 속한 덧글 삭제
			Comment comment = new Comment();
			comment.setArticle_id(article_id);
			
			
			/** (7) 데이터 삭제 처리 */
			// 로그인 중이라면 회원일련번호를 Beans에 추가한다.
			Member loginInfo = (Member) web.getSession("loginInfo");
			if (loginInfo != null) {
				article.setMember_id(loginInfo.getId());
			}
			
			List<ImageFile> fileList = null;	// 게시물에 속한 파일 목록에 대한 조회결과
				
			try {
				// Beans에 추가된 자신의 회원번호를 사용하여 자신의 글임을 판별한다.
				// --> 자신의 글이 아니라면 비밀번호 검사
				if (
					articleService.selectArticleCountByMemberId(article) < 1) 
				
				fileList = imageFileService.selectArticleFileList(file);	// 게시글에 포함된 파일목록을 조회
				imageFileService.deleteFileAll(file);				// 게시물에 속한 파일목록 모두 삭제
				
				// 덧글이 게시물을 참조하므로, 덧글이 먼저 삭제되어야 한다.
			    commentService.deleteCommentAll(comment);
			    
				articleService.deleteArticle(article);	// 게시글 삭제
			} catch (Exception e) {
				web.redirect(null, e.getLocalizedMessage());
				return null;
			} finally {
				sqlSession.close();
			}
			
			/** (8) 실제 파일을 삭제한다. */
			// DB에서 파일 정보가 삭제되더라도 실제 저장되어 있는 파일 자체가 삭제되는 것은 아니다.
			// 실제 파일도 함께 삭제하기 위해서 (7)번 절차에서 파일정보를 삭제하기 전에 미리
			// 조회해 둔 것이다.
			// 조회한 파일 목록만큼 반복하면서 저장되어 있는 파일을 삭제한다.
			if (fileList != null) {
				for (int i=0; i<fileList.size(); i++) {
					ImageFile f = fileList.get(i);
					String filePath = f.getFileDir() + "/" + f.getFileName();
					logger.debug("fileRemove: " + filePath);
					upload.removeFile(filePath);
				}
			}
		
				
		String view = "main";
		return view;
	}
	
       
    
}
