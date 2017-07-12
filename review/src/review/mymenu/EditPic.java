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
import review.jsp.helper.RegexHelper;
import review.jsp.helper.UploadHelper;
import review.jsp.helper.WebHelper;
import review.model.ImageFile;
import review.model.Member;
import review.service.ImageFileService;
import review.service.MemberService;
import review.service.impl.ImageFileServiceImpl;
import review.service.impl.MemberServiceImpl;






@WebServlet("/mymenu/edit_pic")
public class EditPic extends BaseController {
	private static final long serialVersionUID = -1391748040235555563L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;		
	UploadHelper upload;		
	MemberService memberService;	
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
		// 회원가입 처리를 위한 Service객체		
		memberService = new MemberServiceImpl(sqlSession, logger);
		imageFileService = new ImageFileServiceImpl(sqlSession, logger);			
				
					
		/** (3) 로그인 여부 검사 */
		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") == null) {
			web.redirect(web.getRootPath() + "/index", "you should login");
			return null;
		}
	

			/** (3) 글 번호 파라미터 받기 */
			int member_id = web.getInt("member_id");
			logger.debug("member_id" + member_id);
					
			if (member_id == 0) {
				web.redirect(null, "회원 번호가 지정되지 않았습니다.");
				sqlSession.close();
				return null;
			}
			
			//  파라미터를 Beans로 묶기
			Member member = new Member();
			member.setId(member_id);
			// 지금 읽고 있는 게시물이 저장될 객체
			Member readMember = null;
			
			ImageFile file = new ImageFile();
			file.setMember_id(member_id);
			List<ImageFile> memberfileList = null;	
			
			try {		
					
				readMember = memberService.selectMember(member);
				memberfileList = imageFileService.selectMemberFileList(file);
			} catch (Exception e) {
				web.redirect(null, e.getMessage());
				return null;
			} finally {
				sqlSession.close();
			}
			
		
								
		
			/** (7) 읽은 데이터를 View에게 전달한다 */
			request.setAttribute("readmember", readMember);
			request.setAttribute("fileList", memberfileList);
			
			
			
			
		String view = "mymenu/edit_pic";
		return view;
	}
	
       
    
}
