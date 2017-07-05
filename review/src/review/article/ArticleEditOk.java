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




@WebServlet("/article/article_edit_ok")
public class ArticleEditOk extends BaseController {
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
			web.redirect(null, "multipart 데이터가 아닙니다.");
			return null;
		}
		
		/** (4) UploadHelper에서 텍스트 형식의 값을 추출 */
		Map<String, String> paramMap = upload.getParamMap();
		
        int article_id = 0;
        try {
        	article_id = Integer.parseInt(paramMap.get("article_id"));
        } catch (NumberFormatException e) {
			sqlSession.close();
			web.redirect(null, "글 번호가 올바르지 않습니다.edit_ok 부분");
			return null;
		}	
		
		String category = paramMap.get("category");	
		String title = paramMap.get("title");
		String content = paramMap.get("content");		
		String ip_address = web.getClientIP();
		
		int member_id = 0;
		
		/** (7) 로그인 한 경우 자신의 글이라면 입력하지 않은 정보를 세션 데이터로 대체한다. */
		// 소유권 검사 정보
		boolean myArticle = false;
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			try {
				// 소유권 판정을 위하여 사용하는 임시 객체
				Article temp = new Article();
				temp.setCategory(category);
				temp.setId(article_id);
				temp.setMember_id(loginInfo.getId());

				if (articleService.selectArticleCountByMemberId(temp) > 0) {
					// 소유권을 의미하는 변수 변경
					myArticle = true;
					// 입력되지 않은 정보들 갱신					
				}
			} catch (Exception e) {
				sqlSession.close();
				web.redirect(null, e.getLocalizedMessage());
				return null;
			}
		}

		// 전달된 파라미터는 로그로 확인한다.
				logger.debug("article_id=" + article_id);		
				logger.debug("category=" + category);		
				logger.debug("title=" + title);
				logger.debug("content=" + content);		
				logger.debug("ip_address=" + ip_address);
				logger.debug("member_id=" + member_id);
				
				if(!regex.isValue(title)) {
					sqlSession.close();
					web.redirect(null, "title field is required");
					return null;
				}
				
				if(!regex.isValue(content)) {
					sqlSession.close();
					web.redirect(null, "content field is required");
					return null;
				}
				
				  Article article = new Article();
				  article.setId(article_id);
				  article.setCategory(category);
				  article.setTitle(title);
				  article.setContent(content);
				  article.setMember_id(member_id);		  
				  article.setIp_address(ip_address);
				  logger.debug("article >> " + article.toString());
				  
				  /** (10) 게시물 변경을 위한 Service 기능을 호출 */
					try {						
						articleService.updateArticle(article);
					} catch (Exception e) {
						sqlSession.close();
						web.redirect(null, e.getLocalizedMessage());
						return null;
					}	  
				  
					/** (11) 삭제를 선택한 첨부파일에 대한 처리 */
					// 삭제할 파일 목록에 대한 체크결과 --> 체크박스의 선택값을 paramMap에서 추출
					String delFile = paramMap.get("del_file");

					if (delFile != null) {
						// 콤마 단위로 잘라서 배열로 변환
						String[] delFileList = delFile.split(",");
				
						for (int i = 0; i < delFileList.length; i++) {
							try {
								// 체크박스에 의해서 전달된 id값으로 개별 파일에 대한 Beans 생성
								ImageFile file = new ImageFile();
								file.setId(Integer.parseInt(delFileList[i]));
				
								// 개별 파일에 대한 정보를 조회하여 실제 파일을 삭제한다.
								ImageFile item = imageFileService.selectFile(file);
								upload.removeFile(item.getFileDir() + "/" + item.getFileName());
				
								// DB에서 파일정보 삭제처리
								imageFileService.deleteFile(file);
							} catch (Exception e) {
								sqlSession.close();
								web.redirect(null, e.getLocalizedMessage());
								return null;
							}
						}
					}
	
					/** (12)  첨부파일 목록 처리 */
					// 업로드 된 파일 목록
					// --> import study.jsp.helper.FileInfo;
					List<FileInfo> fileList = upload.getFileList();
									
						// 업로드 된 파일의 수 만큼 반복 처리 한다.
						for(int i = 0; i <fileList.size(); i++){
							// 업로드 된 정보 하나 추출하여 데이터베이스에 저장하기 위한 형태로 가공해야 한다.
							FileInfo info = fileList.get(i);
							
							//DB에 저장하기 위한 항목 하나 생성
							ImageFile file = new ImageFile();

							// 데이터 복사
							file.setOriginName(info.getOrginName());
							file.setFileDir(info.getFileDir());
							file.setFileName(info.getFileName());
							file.setContentType(info.getContentType());
							file.setFileSize(info.getFileSize());
							
							// 어느 게시물에 속한 파일인지 인식
							file.setArticle_id(article_id);
							
							// 저장처리	
						try {
								imageFileService.insertArticleFile(file);
						}catch (Exception e) {
							web.redirect(null, e.getLocalizedMessage());
							return null;
						}//end try ~ catch
					}//end if
					
					/** (13) 모든 절차가 종료되었으므로 DB접속 해제 후 페이지 이동 */	
				sqlSession.close();						
				String url = "%s/article/article_read?article_id=%d";
				url = String.format(url, web.getRootPath(), article_id);
				web.redirect(url, null);

				return null;
				  
	}
	       
    
}
