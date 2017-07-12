package review.mymenu;

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
import review.model.ImageFile;
import review.model.Member;
import review.service.ImageFileService;
import review.service.MemberService;
import review.service.impl.ImageFileServiceImpl;
import review.service.impl.MemberServiceImpl;




@WebServlet("/mymenu/edit_pic_ok")
public class EditPicOk extends BaseController {
	private static final long serialVersionUID = -1391748040235555563L;


	/** (1) 사용하고자 하는 Helper+Service 객체 선언 */
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
				
	
					
			/** (4) 파일이 포함된 POST 파라미터 받기 */
			try {
				upload.multipartRequest(request);
			} catch (Exception e) {
				sqlSession.close();
				web.redirect(null, "multipart 데이터가 아닙니다.");
				return null;
			}
			
			/** (4) UploadHelper에서 텍스트 형식의 값을 추출 */
			Map<String, String> paramMap = upload.getParamMap();		
			
               int member_id = 0;
			
           	Member loginInfo = (Member) web.getSession("loginInfo");
    		if (loginInfo != null) {					
    			member_id = loginInfo.getId();    		
    		}
               
		
			String introduce = paramMap.get("introduce");				
				

			// 파일경로를 로그로 기록		
			logger.debug("introduce=" + introduce);
		
       /** 유효성 검사 게시판 텍스트 보고 introduce 하면됨 */
		
  	/** (7) 전달받은 파라미터를 Beans 객체에 담는다. */
					Member member = new Member();						
					member.setId(loginInfo.getId());
					member.setIntroduce(loginInfo.getIntroduce());
				    
					logger.debug(member.toString());
	
					/** (9) Service를 통한 데이터베이스 저장 처리 */
					// 변경된 정보를 저장하기 위한 객체
					
					try {							
						memberService.updateProfile(member);
						
					} catch (Exception e) {
						sqlSession.close();
						web.redirect(null, e.getLocalizedMessage());
						return null;
					} 
					
					
					/** (11) 삭제를 선택한 첨부파일에 대한 처리 */
					// 삭제할 파일 목록에 대한 체크결과 --> 체크박스의 선택값을 paramMap에서 추출
					String del_file = paramMap.get("del_file");

					if (del_file != null) {
						// 콤마 단위로 잘라서 배열로 변환
						String[] delFileList = del_file.split(",");
				
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

					/** (12) 추가적으로 업로드 된 파일 정보 처리 */
					// 업로드 된 파일 목록
					List<FileInfo> fileList = upload.getFileList();
					

					// 업로드 된 파일의 수 만큼 반복 처리 한다.
					for (int i = 0; i < fileList.size(); i++) {
						// 업로드 된 정보 하나 추출
						// --> 업로드 된 정보를 데이터베이스에 저장하기 위한 형태로 가공해야 한다.
						FileInfo info = fileList.get(i);

						// DB에 저장하기 위한 항목 하나 생성
						ImageFile file = new ImageFile();

						// 데이터 복사
						file.setOriginName(info.getOrginName());
						file.setFileDir(info.getFileDir());
						file.setFileName(info.getFileName());
						file.setContentType(info.getContentType());
						file.setFileSize(info.getFileSize());

						// 몇번 회원번호에 속한 파일인지 저장한다.
						file.setMember_id(member_id);
						
						
						// 복사된 데이터를 DB에 저장
						
						
						try {
							imageFileService.insertProfileFile(file);
						} catch (Exception e) {
							sqlSession.close();
							web.redirect(null, e.getLocalizedMessage());
							return null;
						}
					}
					
					/** (13) 모든 절차가 종료되었으므로 DB접속 해제 후 페이지 이동 */
					sqlSession.close();
					
					
					
					// INSERT,UPDATE,DELETE 처리를 수행하는 action 페이지들은 자체적으로 View를
					// 갖지 않고 결과를 확인할 수 있는 다른 페이지로 강제 이동시켜야 한다. 
					// 그러므로 View의 경로를 리턴하지 않는다.(중복실행 방지)
					String url = "%s/mymenu/my_page?member_id=%d";
					url = String.format(url, web.getRootPath(), member_id);
					web.redirect(url, null);

					return null;
}
	

	
       
    
}
