package review.service;

import java.util.List;

import review.model.Favorite;



/** 관심등록 서비스 */
public interface FavoriteService {
	
	
	/**
	 * 작품에 대한 관심등록 확인 여부
	 * @param favorite
	 * @return
	 * @throws Exception
	 */
	public int selectCountFavoriteBookById(Favorite favorite)throws Exception;
	
	/**
	 * 작품에 대한 관심등록 추가
	 * @param favorite
	 * @return
	 * @throws Exception
	 */
	public int insertAddFavorite(Favorite favorite)throws Exception;
	
	/**
	 * 관심 등록 삭제
	 * @param favorite
	 * @throws Exception
	 */
	public void deleteRemoveFavorite(Favorite favorite)throws Exception;
	

	
	/**
	 * 관심작품 목록 조회
	 *  @param favorite - 관심작품이 저장된 BEans
	 *  @return List- 관심작품 목록
	 * @throws Exception
	 */
	public List<Favorite> selectFavoriteList(Favorite favorite) throws Exception;
	
	/**
	 *  전체 관심작품 목록 조회
	 *  @param favorite - 관심작품이 저장된 BEans
	 *  @return int
	 * @throws Exception
	 */
	public int selectFavoriteCount(Favorite favorite) throws Exception;
	/**
	 * 특정 회원에 속한 모든 관심작품을 삭제한다.
	 * @param buy
	 * @throws Exception
	 */
	public void deleteFavoriteAll(Favorite favorite) throws Exception;
	
}
