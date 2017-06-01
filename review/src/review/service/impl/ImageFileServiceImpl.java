package review.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import review.model.ImageFile;
import review.service.ImageFileService;



public class ImageFileServiceImpl implements ImageFileService{

	/** 처리 결과를 위한 Log4J객체 생성 */
	Logger logger;
	
	/** MyBatis */
	SqlSession sqlSession;
	
	/** 생성자를 통한 객체 생성 */
	public ImageFileServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	@Override
	public void insertArticleFile(ImageFile file) throws Exception {
		try {
			int result = sqlSession.insert("ImageFileMapper.insertArticleFile", file);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("no save article picture information");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("It's fail to save article picture information");
		} finally {
			sqlSession.commit();
		}
		
	}

	@Override
	public void insertProfileFile(ImageFile file) throws Exception {
		try {
			int result = sqlSession.insert("ImageFileMapper.insertProfileFile", file);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("no save article picture information");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("It's fail to save article picture information");
		} finally {
			sqlSession.commit();
		}
		
	}
	@Override
	public ImageFile selectFile(ImageFile file) throws Exception {
	  	ImageFile result = null;
		
		try {
			result = sqlSession.selectOne("ImageFileMapper.selectFile", file);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("it's request nonexistence file.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("it's fail to refer image file");
		}
		
		return result;
	}

	@Override
	public void deleteFile(ImageFile file) throws Exception {
		try {
			int result = sqlSession.delete("ImageFileMapper.deleteFile", file);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("삭제된 파일 정보가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("첨부파일 정보 삭제에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
		
	}

	@Override
	public List<ImageFile> selectArticleFileList(ImageFile file) throws Exception {
	List<ImageFile> result = null;
		
		try {
			// 첨부파일이 없는 경우도 있으므로, 조회결과가 null인 경우 예외를 발생하지 않는다.
			result = sqlSession.selectList("ImageFileMapper.selectArticleFileList", file);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("파일 정보 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public List<ImageFile> selectProfileFileList(ImageFile file) throws Exception {
      List<ImageFile> result = null;
		
		try {
			// 첨부파일이 없는 경우도 있으므로, 조회결과가 null인 경우 예외를 발생하지 않는다.
			result = sqlSession.selectList("ImageFileMapper.selectProfileFileList", file);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("파일 정보 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public void deleteFileAll(ImageFile file) throws Exception {
		try {
			// 첨부파일이 없는 경우도 있으므로, 결과가 0인 경우 예외를 발생하지 않는다.
			sqlSession.delete("ImageFileMapper.deleteFileAll", file);
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("첨부파일 정보 삭제에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}
	
	
	

}
