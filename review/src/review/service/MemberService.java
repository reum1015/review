package review.service;

import java.util.List;

import review.model.Member;

public interface MemberService {
	
	/**
	 * 이메일 중복검사
	 * @param member - 이메일
	 * @throws Exception - 중복된 데이터인 경우 예외 발생함
	 */
	public void selectEmailCount(Member member)throws Exception;
	
	/**
	 * 닉네임 중복검사
	 * @param member - 닉네임
	 * @throws Exception - 중복된 데이터인 경우 예외 발생함
	 */
	public void selectNickNameCount(Member member)throws Exception;
	
	/**
	 * 비밀번호 검사
	 * @param member
	 * @throws Exception
	 */
	public void selectMemberPasswordCount(Member member) throws Exception;
	
	
	/**
	 * 회원가입(아이디, 이메일 중복검사 후 가입처리)
	 * @param member - 일련번호, 가입일시, 변경일시를 제외한 모든 정보
	 * @throws Exception
	 */
	public void insertMember(Member member)throws Exception;
			
	/**
	 * 로그인
	 * @param member - id, password
	 * @return 회원정보
	 * @throws Exception
	 */
	public Member selectLoginInfo(Member member)throws Exception;
	
	/**
	 * 비밀번호 변경
	 * @param member - email, password
	 * @throws Exception
	 */
	public void updateMemberPasswordByEmail(Member member)throws Exception;
	
	/**
	 * 회원정보 수정
	 * @param member 
	 * @throws Exception
	 */
	public void updateAccountMember(Member member)throws Exception;
	
	/**
	 * 회원정보 수정
	 * @param member 
	 * @throws Exception
	 */
	public void updateEditProfile(Member member)throws Exception;
	
	
	/**
	 * 일련번호에 의한 회원정보 조회
	 * @param member	  
	 * @throws Exception
	 */
	public Member selectMember(Member member)throws Exception;
	
	/**
	 * 비밀번호 수정
	 * @param member 
	 * @throws Exception
	 */
	public void updatePassword(Member member)throws Exception;
	
	/**
	 * 프로필 수정
	 * @param member 
	 * @throws Exception
	 */
	public void updateProfile(Member member)throws Exception;
	
	/**
	 * 하나의 게시물을 읽어들인다.
	 * 
	 * @param article - 읽어들일 게시물 일련번호가 저장된 Beans
	 * @return article - 읽어들인 게시물 내용
	 * @throws Exception
	 */
	public List<Member> selectMemberPic(Member member) throws Exception;
	
	
	
	/**
	 *  전체 회원 조회
	 *  @param favorite - 관심작품이 저장된 BEans
	 *  @return int
	 * @throws Exception
	 */
	public int selectAdminMemberCount(Member member) throws Exception;
	
	/**
	 *  전체 회원 조회
	 *  @param favorite - 관심작품이 저장된 BEans
	 *  @return int
	 * @throws Exception
	 */
	public int selectAdminMemberDateCount(Member member) throws Exception;
	
	/**
	 *  닉네임으로 회원 아이디 정보를 읽어들인다.
	 * 
	 * @param article - 읽어들일 회원정보 일련번호가 저장된 Beans
	 * @return article - 읽어들인 회원정보 내용
	 * @throws Exception
	 */
	public Member selectAdminMemberId(Member member) throws Exception;
	
	/**
	 * 회원 멤버 레벨 수정
	 * @param member 
	 * @throws Exception
	 */
	public void updateAdminMemberLevel(Member member)throws Exception;
	
	

	
	/**
	 * 회원 전체 이메일 주소
	 * @param member	  
	 * @throws Exception
	 */
	public List<Member> selectAdminMemberEmailDate(Member member) throws Exception;
}
