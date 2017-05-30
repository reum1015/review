package review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import review.jsp.helper.BaseController;
import review.jsp.helper.UploadHelper;
import review.jsp.helper.WebHelper;

@WebServlet("/download")
public class Download extends BaseController{

	/**
	 * 
	 */
	private static final long serialVersionUID = 788977139083197914L;

	
	/** (1) 사용하고자 하는 객체 선언 Helper + Service */
	Logger logger;
	WebHelper web;
	UploadHelper upload;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/** (2)사용하고자 하는 객체 생성 Helper + Service */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		
		/** (3)파라미터 받기 */
		//서버상에 저장되어 있는 파일 경로(필수)
		String filePath = web.getString("file");
		
		System.out.println("filepath in downloadok -------> : " + filePath);
		//원본 파일 이름(미필수)
		String orginName = web.getString("origin");
		
		/** (4)다운로드 스트림 출력하기 */
		if(filePath != null){
			try{
				logger.debug("Create Thumbnamil Image -->" + filePath);
				upload.printFileStream(response, filePath, orginName);
				
			}catch (IOException e) {
				logger.debug(e.getLocalizedMessage());
			}
		}
		return null;
	}

}
