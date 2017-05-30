package review.service;

import java.util.List;

import review.model.ImageFile;




public interface ImageFileService {

	/**
	 * 게시판 파일 정보를 저장한다.
	 * @param file - 파일 데이터
	 * @throws Exception
	 */
	public void insertArticleFile(ImageFile file) throws Exception;
	
	/**
	 * 프로필 파일 정보를 저장한다.
	 * @param file - 파일 데이터
	 * @throws Exception
	 */
	public void insertProfileFile(ImageFile file) throws Exception;
	
	/**
	 * 하나의 게시물에 종속된 파일 목록을 조회한다.
	 * @param file - 게시물 일련번호를 저장하고 있는 JavaBeans
	 * @return 파일데이터 컬렉션
	 * @throws Exeption
	 */
	public List<ImageFile> selectArticleFileList(ImageFile file) throws Exception;
	
	
	/**
	 * 하나의 게시물에 종속된 파일 목록을 조회한다.
	 * @param file - 게시물 일련번호를 저장하고 있는 JavaBeans
	 * @return 파일데이터 컬렉션
	 * @throws Exeption
	 */
	public List<ImageFile> selectProfileFileList(ImageFile file) throws Exception;
	
	
	/**
	 * 하나의 단일 파일에 대한 정보를 조회한다.
	 * @param document
	 * @return BbsFile - 저장된 경로 정보
	 * @throws Exception
	 */
	public ImageFile selectFile(ImageFile file) throws Exception;	
	
	/**
	 * 하나의 단일 파일 정보를 삭제한다.
	 * @param document
	 * @throws Exception
	 */
	public void deleteFile(ImageFile file) throws Exception;
	
	/**
	 * 하나의 단일 파일 정보를 삭제한다.
	 * @param document
	 * @throws Exception
	 */
	public void deleteFileAll(ImageFile file) throws Exception;
	
	
	
}

	
