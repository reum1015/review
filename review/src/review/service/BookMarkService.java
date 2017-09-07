package review.service;

import java.util.List;

import review.model.BookMark;



public interface BookMarkService {
	
	/**
	 * 북마크를 저장한다.
	 * @param bookmark - 북마크 데이터
	 * @throws Exception
	 */
	public void insertAddBookMark(BookMark bookmark) throws Exception;
	

	/**
	 * 작품에 대한 북마크 등록 확인 여부
	 * @param bookmark
	 * @return
	 * @throws Exception
	 */
	public int selectCountBookMarkById(BookMark bookmark)throws Exception;
	
	/**
	 * 하나의 북마크를 삭제한다.
	 *  @param bookmark - 북마크 데이터
	 * @throws Exception
	 */
	public void deleteRemoveBookMark(BookMark bookmark) throws Exception;
	
	/**
	 * 에피소드 목록 조회
	 *  @param episode - 에피소드가 저장된 BEans
	 *  @return List- 에피소드 목록
	 * @throws Exception
	 */
	public List<BookMark> selectBookMarkList(BookMark bookmark) throws Exception;
	
	
	/**
	 * 북막크 확인용 목록 조회
	 *  @param episode - 에피소드가 저장된 BEans
	 *  @return List- 에피소드 목록
	 * @throws Exception
	 */
	public List<BookMark> selectBookMarkStateList(BookMark bookmark) throws Exception;
	/**
	 *  전체 북마크 목록 조회
	 *  @param episode - 에피소드가 저장된 BEans
	 *  @return int
	 * @throws Exception
	 */
	public int selectBookMarkCount(BookMark bookmark) throws Exception;
	
	/**
	 * 특정 회원에 속한 모든 북마크를 삭제한다.
	 * @param bookmark
	 * @throws Exception
	 */
	public void deleteBookMarkAll(BookMark bookmark) throws Exception;
	
}
