package review.service;

import java.util.List;

import review.model.Article;



public interface ArticleService {

	/**
	 * 게시물을 저장한다.
	 * 
	 * @param article         - 게시물 데이터
	 * @throws Exception
	 */
	public void insertArticle(Article article) throws Exception;

	
	/**
	 * 하나의 게시물을 읽어들인다.
	 * 
	 * @param article - 읽어들일 게시물 일련번호가 저장된 Beans
	 * @return article - 읽어들인 게시물 내용
	 * @throws Exception
	 */
	public Article selectArticle(Article article) throws Exception;

	/**
	 * 검색 게시글 목록 조회
	 * 
	 * @param article 카테고리 정보가 저장된 Beans
	 * @return List - 게시물 목록
	 * @throws Exception
	 */
	public List<Article> selectArticleListForBest(Article article) throws Exception;
	
	/**
	 * 검색 게시글 목록 조회
	 * 
	 * @param article 카테고리 정보가 저장된 Beans
	 * @return List - 게시물 목록
	 * @throws Exception
	 */
	public List<Article> selectArticleList(Article article) throws Exception;

	/**
	 * 게시글 목록 조회
	 * 
	 * @param article
	 *            - 카테고리 정보가 저장된 Beans
	 * @return List - 게시물 목록
	 * @throws Exception
	 */
	public List<Article> selectArticleListMain(Article article) throws Exception;
	
	

	/**
	 * 검색 전체 게시물 수 조회
	 * 
	 * @param document
	 * @return int
	 * @throws Exception
	 */
	public int selectArticleCount(Article article) throws Exception;

	/**
	 * 전체 게시물 수 조회
	 * 
	 * @param document
	 * @return int
	 * @throws Exception
	 */
	public int selectArticleMainCount(Article article) throws Exception;

	/**
	 *  전체 회원 게시글 목록 조회
	 *  @param favorite - 관심작품이 저장된 BEans
	 *  @return int
	 * @throws Exception
	 */
	public int selectMemberArticleCount(Article article) throws Exception;
	
	/**
	 *  회원 게시글 목록 조회
	 * 
	 * @param article
	 *            - 카테고리 정보가 저장된 Beans
	 * @return List - 게시물 목록
	 * @throws Exception
	 */
	public List<Article> selectMemberArticleList(Article article) throws Exception;

	
	/**
	 * 조회수를 1 증가시킨다.
	 * 
	 * @param document
	 *            - 현재글에 대한 게시물 번호가 저장된 Beans
	 * @throws Exception
	 */
	public void updateArticleHit(Article article) throws Exception;
	
	/**
	 * 자신의 게시물인지 검사한다.
	 * 
	 * @param document
	 * @return int
	 * @throws Exception
	 */
	public int selectArticleCountByMemberId(Article article) throws Exception;

	/**
	 * 게시물을 삭제한다.
	 * 
	 * @param document
	 * @throws Exception
	 */
	public void deleteArticle(Article article) throws Exception;
	
	/**
	 * 게시물을 수정한다.
	 * @param document - 게시물 데이터
	 * @throws Exception
	 */
	public void updateArticle(Article article) throws Exception;
	
	/**
	 *  like_count +1
	 * @param article
	 * @return
	 * @throws Exception
	 */
	public void likeCountPlus(Article article) throws Exception;
	
	/**
	 *  like_count -1
	 * @param article
	 * @return
	 * @throws Exception
	 */
	public void likeCountMinus(Article article) throws Exception;
	
	/**
	 * 관심작품 목록 조회
	 *  @param favorite - 관심작품이 저장된 BEans
	 *  @return List- 관심작품 목록
	 * @throws Exception
	 */
	public List<Article> selectFavoriteList(Article article) throws Exception;
	
	/**
	 *  전체 관심작품 목록 조회
	 *  @param favorite - 관심작품이 저장된 BEans
	 *  @return int
	 * @throws Exception
	 */
	public int selectFavoriteCount(Article article) throws Exception;
	
	/**
	 * 전체 게시물 수 조회
	 * 
	 * @param document
	 * @return int
	 * @throws Exception
	 */
	public int selectArticleAdminDateCount(Article article) throws Exception;
	
	
}

	
