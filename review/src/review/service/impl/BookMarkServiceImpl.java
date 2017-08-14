package review.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import review.model.BookMark;
import review.service.BookMarkService;



public class BookMarkServiceImpl implements BookMarkService {
	
	/** 처리 결과를 기록할 Log4J 객체 생성 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;

	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	SqlSession sqlSession;

	/** 생성자를 통한 객체 생성 */
	public BookMarkServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	@Override
	public void insertAddBookMark(BookMark bookmark) throws Exception {
		try {
			int result = sqlSession.insert("BookMarkMapper.insertAddBookMark", bookmark);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 북마크가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("북마크 저장에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}	

	@Override
	public void deleteRemoveBookMark(BookMark bookmark) throws Exception {
		try{
			int result = sqlSession.delete("BookMarkMapper.deleteRemoveBookMark", bookmark);
			if(result == 0){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {		
			sqlSession.rollback();
			throw new Exception("존재하지 않는 게시물에 대한 요청입니다.");
		}catch (Exception e) {			
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("북마크 해제에 실패 했습니다.");
		}finally{
			sqlSession.commit();
		}
	}

	@Override
	public List<BookMark> selectBookMarkList(BookMark bookmark) throws Exception {
		List<BookMark> result = null;
		
		try {
			result = sqlSession.selectList("BookMarkMapper.selectbookmarkStateList", bookmark);
			
		} catch (NullPointerException e) {
			throw new Exception("북마크 처리된 에피소드목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("북마크 목록 조회에 실패했습니다.");
		}		
		
		return result;
	}

	@Override
	public int selectBookMarkCount(BookMark bookmark) throws Exception {
		int result = 0;
		
		try {
			// 게시물 수가 0건인 경우도 있으므로
			// 결과값이 0인 경우에 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("BookMarkMapper.selectBookMarkCount", bookmark);
		} catch(Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("북마크 수 조회에 실패했습니다. ");
		}
		
		return result;
	}

	@Override
	public int selectCountBookMarkById(BookMark bookmark) throws Exception {
		int result = 0;
		try{			
			// 관심등록 수가 0건인 경우도 있으므로
			// 결과값이 0인 경우에 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("BookMarkMapper.selectCountBookMarkById", bookmark);
		} catch(Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("북마크 확인 조회에 실패했습니다. ");
		}		
		return result;
	}
	
	@Override
	public void deleteBookMarkAll(BookMark bookmark) throws Exception {
		try{
			// 북마크가 존재하지 않는 회원에 대한 요청일 수 있으므로,
			// NullPointerException을 발생시키지 않는다.
			sqlSession.delete("BookMarkMapper.deleteBookMarkAll", bookmark);
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시글 북마크 삭제에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
	}

	


}
