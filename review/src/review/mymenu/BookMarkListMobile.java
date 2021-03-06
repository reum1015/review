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

import review.model.BookMark;
import review.model.Member;
import review.service.ArticleService;
import review.service.BookMarkService;
import review.service.ImageFileService;
import review.service.MemberService;
import review.service.impl.ArticleServiceImpl;
import review.service.impl.BookMarkServiceImpl;
import review.service.impl.ImageFileServiceImpl;
import review.service.impl.MemberServiceImpl;


@WebServlet("/mymenu/bookmarkList_mobile")
public class BookMarkListMobile extends BaseController {
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
		// 회원가입 처리를 위한 Service객체		
		memberService = new MemberServiceImpl(sqlSession, logger);
		articleService = new ArticleServiceImpl(sqlSession, logger);
		imageFileService = new ImageFileServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		bookmarkService = new BookMarkServiceImpl(sqlSession, logger);
			
		/** (3) 로그인 여부 검사 */
	
		 Member loginInfo = (Member) web.getSession("loginInfo");
			if(web.getSession("loginInfo") == null){
					sqlSession.close();
					web.redirect(web.getRootPath() + "/index", "you need log in.");
					return null;
				}
			Member member =  (Member)web.getSession("loginInfo");
			int member_id = web.getInt("member_id");	
		/** (3) 회원 번호 파라미터 받기 */
		
		logger.debug("member_id=" + member_id);
				System.out.println("-----"+ member_id);
		if (member_id == 0) {
			web.redirect(null, "do not get member_id.");
			sqlSession.close();
			return null;
		}
		
		
		/** (5) 조회할 정보에 대한 Beans 생성 */
		BookMark bookmark = new BookMark();
		bookmark.setMember_id(member_id);
		
		int page = web.getInt("page", 1);
		
		/** (6) 게시물 목록 조회 */
		int totalcount = 0;
		List<BookMark> bookmarkList = null;
		
		// 지금 읽고 있는 게시물이 저장될 객체
		Member readMember = null;
		
		try {		
			// 전체 게시물 수
			totalcount = bookmarkService.selectBookMarkCount(bookmark);
          System.out.println(totalcount + "-----111"  );
			// 나머지 페이지 번호계산하기
			// --> 현재 페이지, 전체 게시물 수, 한페이지의 목록수, 그룹갯수
          pageHelper.pageProcess(page, totalcount, 7, 5);
			
       // 페이지 번호 계산결과에서 Limit절에 필요한 값을 Beans에 추가
          bookmark.setLimit_start(pageHelper.getLimit_start());
          bookmark.setList_count(pageHelper.getList_count());	

          bookmarkList = bookmarkService.selectBookMarkList(bookmark);
			System.out.println(bookmarkList + "-----11221");
			

			readMember = memberService.selectMember(member);
			 if(loginInfo.getId() != member_id) {
	                web.redirect(null, "It's not your page.");
	                return null;
	             }
			
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();			
		}
		
		// 조회결과가 존재할 경우 --> 갤러리라면 이미지 경로를 썸네일로 교체(에피소드 리스트)
		if (bookmarkList != null) {
			for (int i=0; i<bookmarkList.size(); i++) {
				BookMark item = bookmarkList.get(i);
				String imagePath = item.getImagePath();
				if (imagePath != null) {
					String thumbPath = upload.createThumbnail(imagePath, 150, 150, false);
					// 글 목록 컬렉션 내의 Beans 객체가 갖는 이미지 경로를 썸네일로 변경한다.
					item.setImagePath(thumbPath);
					logger.debug("thumbnail create > " + item.getImagePath());
				}
			}
		}
		
		// 회원 프로필 사진
				if (readMember != null) {
					String imagePath = readMember.getImagePath();
					if (imagePath != null) {
						String thumbPath = upload.createThumbnail(imagePath, 150, 150, false);
					// 글 목록 컬렉션 내의 Beans 객체가 갖는 이미지 경로를 썸네일로 변경한다.
						readMember.setImagePath(thumbPath);
						logger.debug("thumbnail create > " + readMember.getImagePath());
									}
				}
		
		
						
		
		/** (7) 조회 결과를 View에 전달 */
	

		request.setAttribute("bookmarkList", bookmarkList);
		request.setAttribute("pageHelper", pageHelper);
		request.setAttribute("readMember", readMember);
		request.setAttribute("member_id", member_id);	
						
		String view = "mymenu/bookmarkList_mobile";
		return view;
	}
	
       
    
}
