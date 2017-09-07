package review.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import review.model.Article;

import review.service.ArticleService;


public class ArticleServiceImpl implements ArticleService {
	
	/** 처리결과를 기록할 Log4j 객체 생성 */
	Logger logger;
	
	/** MyBatis */
	SqlSession sqlSession;
	
	/** 생성자를 통한 객체 생성 */
	public ArticleServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	@Override
	public void insertArticle(Article article) throws Exception {
		try {
			int result = sqlSession.insert("ArticleMapper.insertArticle", article);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("There is no article.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("fail to write review");
		} finally {
			sqlSession.commit();
		}
		
	}

	@Override
	public Article selectArticle(Article article) throws Exception {
		Article result = null;
		try {
			result = sqlSession.selectOne("ArticleMapper.selectArticle", article);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("There is no review");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("It's fail to search review.");
		}
		return result;
	}

	@Override
	public List<Article> selectArticleList(Article article) throws Exception {
		List<Article> result = null;
		try {
			result = sqlSession.selectList("ArticleMapper.selectArticleList", article);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("There is no review list");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("It's fail to search review.");
		}
		return result;
	}

	@Override
	public List<Article> selectArticleListMain(Article article) throws Exception {
		List<Article> result = null;
		try {
			result = sqlSession.selectList("ArticleMapper.selectArticleListMain", article);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("There is no review list");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("It's fail to search review list.");
		}
		return result;
	}
	
	@Override
	public List<Article> selectMemberArticleList(Article article) throws Exception {
		List<Article> result = null;
		try {
			result = sqlSession.selectList("ArticleMapper.selectMemberArticleList", article);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("There is no review list.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("It's fail to search review list.");
		}
		return result;
	}

	@Override
	public int selectMemberArticleCount(Article article) throws Exception {
		  int result = 0;		
			try {
				// 게시물 수가 0건인 경우도 있으므로
				// 결과값이 0인 경우에 예외를 발생시키지 않는다.
				result = sqlSession.selectOne("ArticleMapper.selectMemberArticleCount", article);
			} catch(Exception e) {
				logger.error(e.getLocalizedMessage());
				throw new Exception("It's fail to search member review list. ");
			}
			
			return result;
		}
	
	@Override
	public int selectArticleCount(Article article) throws Exception {
		int result = 0;
		try {
			// 게시물 수가 0건인 경우도 있으므로, 
			// 결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("ArticleMapper.selectArticleCount", article);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("It's fail to search review list.");
		}

		return result;
	}

	@Override
	public int selectArticleMainCount(Article article) throws Exception {
		int result = 0;

		try {
			// 게시물 수가 0건인 경우도 있으므로, 
			// 결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("ArticleMapper.selectArticleMainCount", article);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("It's fail to search review list.");
		}

		return result;
	}

	@Override
	public void updateArticleHit(Article article) throws Exception {
		try {
			int result = sqlSession.update("ArticleMapper.updateArticleHit", article);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("It's fail to search review.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("It's fail to add hit.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public int selectArticleCountByMemberId(Article article) throws Exception {
		int result = 0;
		try {
			// 자신의 게시물이 아닌 경우도 있으므로,
			// 결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("ArticleMapper.selectArticleCountByMemberId", article);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("It's fail to search member review list.");
		}

		return result;
	}

	@Override
	public void deleteArticle(Article article) throws Exception {
		try {
			int result = sqlSession.delete("ArticleMapper.deleteArticle", article);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("It's fail to search review list.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("It's fail to delete review list.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public void updateArticle(Article article) throws Exception {
		try {
			int result = sqlSession.update("ArticleMapper.updateArticle", article);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("It's fail to search review list.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("It's fail to edit review list.");
		} finally {
			sqlSession.commit();
		}
	}

	
	@Override
	public void likeCountPlus(Article article) throws Exception {
		try{
			int result = sqlSession.update("ArticleMapper.updateLikeCountPlus", article);
			if(result==0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			throw new Exception("It's fail to search review list.");
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("like_count plus fail");
		}finally{
			sqlSession.commit();
		}
	}

	@Override
	public void likeCountMinus(Article article) throws Exception {
		try{
			int result = sqlSession.update("ArticleMapper.updateLikeCountMinus", article);
			if(result==0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			throw new Exception("It's fail to search review list.");
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("like_count minus fail");
		}finally{
			sqlSession.commit();
		}
	}

	@Override
	public List<Article> selectFavoriteList(Article article) throws Exception {
		List<Article> result = null;
		try {
			result = sqlSession.selectList("ArticleMapper.selectFavoriteList", article);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("It's fail to search review list.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("It's fail to search best review list..");
		}
		return result;
	}

	@Override
	public int selectFavoriteCount(Article article) throws Exception {
		   int result = 0;		
			try {
				// 게시물 수가 0건인 경우도 있으므로
				// 결과값이 0인 경우에 예외를 발생시키지 않는다.
				result = sqlSession.selectOne("ArticleMapper.selectFavoriteCount", article);
			} catch(Exception e) {
				logger.error(e.getLocalizedMessage());
				throw new Exception("It's fail to search review list. ");
			}
			
			return result;
		}


	@Override
	public int selectArticleAdminDateCount(Article article) throws Exception {
		int result = 0;
		try {			
			result = sqlSession.selectOne("ArticleMapper.selectArticleAdminDateCount", article);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("It's fail to search review list.");
		}

		return result;
	}
	

		
}
