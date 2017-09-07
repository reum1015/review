package review.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;


import review.model.Favorite;
import review.service.FavoriteService;

public class FavoriteServiceImpl implements FavoriteService {
	
	/** 처리결과를 기록할 Log4j 객체 생성 */
	Logger logger;
	
	/** MyBatis */
	SqlSession sqlSession;
	
	/** 생성자를 통한 객체 생성 */
	public FavoriteServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}
	
	

	@Override
	public int selectCountFavoriteArticleById(Favorite favorite) throws Exception {
		int result = 0;

		try {
			// 결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("FavoriteMapper.selectCountFavoriteArticleById", favorite);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("Like count fail.");
		}

		return result;
	}



	@Override
	public int insertAddFavorite(Favorite favorite) throws Exception {
		
		try{
			int result = sqlSession.insert("FavoriteMapper.insertAddFavorite",favorite);
			if(result == 0){
				//등록된 책 정보가 없다면
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {		
			sqlSession.rollback();
			throw new Exception("it's failt add favorite.");
		}catch (Exception e) {			
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("it';s failt to add favorite");
		}finally {
			sqlSession.commit();
		}
		
		return 0;
	}
	
	@Override
	public void deleteRemoveFavorite(Favorite favorite) throws Exception {
	
		try{
			int result = sqlSession.delete("FavoriteMapper.deleteRemoveFavorite",favorite);
			if(result == 0){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {		
			sqlSession.rollback();
			throw new Exception("this article doesnot exist");
		}catch (Exception e) {			
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("it's fail to delete favoriilte");
		}finally{
			sqlSession.commit();
		}
	}

	@Override
	public int selectFavoriteCount(Favorite favorite) throws Exception {
            int result = 0;		
		try {
			// 게시물 수가 0건인 경우도 있으므로
			// 결과값이 0인 경우에 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("FavoriteMapper.selectFavoriteCount", favorite);
		} catch(Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("it's fail to load favorite article");
		}
		
		return result;
	}



	@Override
	public void deleteFavoriteAll(Favorite favorite) throws Exception {
		try{
			// 북마크가 존재하지 않는 회원에 대한 요청일 수 있으므로,
			// NullPointerException을 발생시키지 않는다.
			sqlSession.delete("FavoriteMapper.deleteFavoriteAll", favorite);
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("it's fail to delete article bc of like");
		}finally{
			sqlSession.commit();
		}
	}



	@Override
	public List<Favorite> selectfavoriteStateList(Favorite favorite) throws Exception {
		List<Favorite> result = null;
		try {
			result = sqlSession.selectList("FavoriteMapper.selectfavoriteStateList", favorite);
			
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("fail to load favorite article");
		}
		return result;
	}



	@Override
	public List<Favorite> selectArticleListForBest(Favorite favorite) throws Exception {
		List<Favorite> result = null;
		try {
			result = sqlSession.selectList("FavoriteMapper.selectArticleListForBest", favorite);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("this article does not exist.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("fail to load aritlce.");
		}
		return result;
	}

}
