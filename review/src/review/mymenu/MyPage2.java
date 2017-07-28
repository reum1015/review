package review.mymenu;

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
import review.model.Member;
import review.service.ArticleService;
import review.service.ImageFileService;
import review.service.MemberService;
import review.service.impl.ArticleServiceImpl;
import review.service.impl.ImageFileServiceImpl;
import review.service.impl.MemberServiceImpl;


@WebServlet("/mymenu/my_page2")
public class MyPage2 extends BaseController {
	private static final long serialVersionUID = -1391748040235555563L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;		
	UploadHelper upload;		
	MemberService memberService;	
	ArticleService articleService;
	ImageFileService imageFileService;
	PageHelper pageHelper;
	
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
		// 회원가입 처리를 위한 Service객체		
		memberService = new MemberServiceImpl(sqlSession, logger);
		articleService = new ArticleServiceImpl(sqlSession, logger);
		imageFileService = new ImageFileServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		
				
		/** (3) 회원 번호 파라미터 받기 */
		int member_id = web.getInt("member_id");
		logger.debug("member_id=" + member_id);
				
		if (member_id == 0) {
			web.redirect(null, "회원 번호가 지정되지 않았습니다.");
			sqlSession.close();
			return null;
		}
		//  회원번호 파라미터를 Beans로 묶기
		Member member = new Member();						
		member.setId(member_id);
		// 지금 읽고 있는 게시물이 저장될 객체
		Member readMember = null;
		
		/** (5) 조회할 정보에 대한 Beans 생성 */
		Article article = new Article();		
		int page = web.getInt("page", 1);
		
		/** (6) 게시물 목록 조회 */
		int total_count = 0;
		List<Article> memberarticleList = null;
			
		try {		
			// 전체 게시물 수
			total_count = articleService.selectArticleMainCount(article);

			// 나머지 페이지 번호계산하기
			// --> 현재 페이지, 전체 게시물 수, 한페이지의 목록수, 그룹갯수
			pageHelper.pageProcess(page, total_count, 8, 8);
			
			// 페이지 번호 계산결과에서 Limit절에 필요한 값을 Beans에 추가
			article.setLimit_start(pageHelper.getLimit_start());
			article.setList_count(pageHelper.getList_count());			

			memberarticleList = articleService.selectArticleListMember(article);
			readMember = memberService.selectMember(member);
			
			
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();			
		}
		
		
		// 회원 프로필 사진
				if (readMember != null) {
					String imagePath = readMember.getImagePath();
					if (imagePath != null) {
						String thumbPath = upload.createThumbnail(imagePath, 150, 150, true);
					// 글 목록 컬렉션 내의 Beans 객체가 갖는 이미지 경로를 썸네일로 변경한다.
						readMember.setImagePath(thumbPath);
						logger.debug("thumbnail create > " + readMember.getImagePath());
									}
				}
		
		// 조회결과가 존재할 경우 --> 갤러리라면 이미지 경로를 썸네일로 교체(에피소드 리스트)
				if (memberarticleList != null) {
					for (int i=0; i<memberarticleList.size(); i++) {
						Article item = memberarticleList.get(i);
						String imagePath = item.getImagePath();
						if (imagePath != null) {
							String thumbPath = upload.createThumbnail(imagePath, 220, 190, true);
							// 글 목록 컬렉션 내의 Beans 객체가 갖는 이미지 경로를 썸네일로 변경한다.
							item.setImagePath(thumbPath);
							logger.debug("thumbnail create > " + item.getImagePath());
						}
					}
				}
						
		
		/** (7) 조회 결과를 View에 전달 */
		request.setAttribute("readMember", readMember);
		request.setAttribute("member_id", member_id);	
		request.setAttribute("memberarticleList", memberarticleList);
		System.out.println(memberarticleList  + "///");
		request.setAttribute("pageHelper", pageHelper);
						
		String view = "mymenu/my_page2";
		return view;
	}
	
    
}
