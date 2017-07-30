package review.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import review.model.Member;
import review.service.MemberService;

public class MemberServiceImpl implements MemberService {
	
	/** 처리결과를 기록할 Log4j 객체 생성 */
	Logger logger;
	
	/** MyBatis */
	SqlSession sqlSession;
	
	/** 생성자를 통한 객체 생성 */
	public MemberServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	@Override
	public void selectEmailCount(Member member) throws Exception {
		try{
			int result = sqlSession.selectOne("MemberMapper.selectEmailCount", member);
			
			// 중복된 데이터가 존재한다면?
			if(result>0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			throw new Exception("Another account is using email.");
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("Fail to check it");
		}
	}
	
	@Override
	public void selectNickNameCount(Member member) throws Exception {
		try{
			int result = sqlSession.selectOne("MemberMapper.selectNickNameCount", member);
			
			// 중복된 데이터가 존재한다면?
			if(result>0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			throw new Exception("Another account is using nickname.");
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("Fail to check it");
		}		
	}
	
	@Override
	public void selectMemberPasswordCount(Member member) throws Exception {
		try {
			int result = sqlSession.selectOne("MemberMapper.selectMemberPasswordCount", member);

			// 회원번호와 비밀번호가 일치하는 데이터가 0이라면, 비밀번호가 잘못된 상태
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("Your old password was entered incorrectly. Please enter it again.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("It's fail to check password");
		}
		
	}	

	@Override
	public void insertMember(Member member) throws Exception {
		// 아이디 중복검사 및 이메일 중복검사 호출
		selectEmailCount(member);
		selectNickNameCount(member);
				
		// 데이터 저장처리 = 가입
		// not null로 설정된 값이 설정되지 않았다면 예외 발생됨.
		try{
			int result = sqlSession.insert("MemberMapper.insertMember", member);
			if(result==0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			throw new Exception("no information about account");
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("it's fail to Sign Up");
		}finally{
			sqlSession.commit();
		}
		
	}

	@Override
	public Member selectLoginInfo(Member member) throws Exception {
		Member result = null;
		try{
			result = sqlSession.selectOne("MemberMapper.selectLoginInfo", member);
			
			// 조회된 데이터가 없다는 것은 WHERE절 조건에 맞는 데이터가 없다는 것.
			// --> WHERE절은 아이디와 비밀번호가 일치하는 항목을 지정하므로
			// 조회된 데이터가 없다는 것은 아이디나 비밀번호가 잘못되었음을 의미한다.
			if(result == null){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			throw new Exception("please enter a valid account or passwordsss");
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception(" fail to login");
		}
		return result;
		
	}

	@Override
	public void updateMemberPasswordByEmail(Member member) throws Exception {
	
		try{
			int result = sqlSession.update("MemberMapper.updateMemberPasswordByEmail", member);
			// 중복된 데이터가 존재한다면?
			if(result == 0) {
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			throw new Exception("Please try searching for your email.");
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("Fail to change password");
		} finally {
			sqlSession.commit();
		}		
	}

	@Override
	public void updateAccountMember(Member member) throws Exception {
		
		try {
			int result = sqlSession.update("MemberMapper.updateAccountMember", member);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("information do not change");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("It's fail to change information");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public void updateEditProfile(Member member) throws Exception {
		try {
			int result = sqlSession.update("MemberMapper.updateEditProfile", member);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("information do not change");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("It's fail to change information");
		} finally {
			sqlSession.commit();
		}
	}
	
	@Override
	public Member selectMember(Member member) throws Exception {
Member result = null;
		
		try {
			result = sqlSession.selectOne("MemberMapper.selectMember", member);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("no information");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("It's fail to find information.");
		}		
		return result;
	}

	@Override
	public void updatePassword(Member member) throws Exception {
		try {
			int result = sqlSession.update("MemberMapper.updatePassword", member);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("password do not change");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("It's fail to change password");
		} finally {
			sqlSession.commit();
		}
		
	}

	@Override
	public void updateProfile(Member member) throws Exception {
		try {
			int result = sqlSession.update("MemberMapper.updateProfile", member);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("존재하지 않는 프로필에 대한 요청입니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("It's fail to change profile");
		} finally {
			sqlSession.commit();
		}
		
	}

	@Override
	public List<Member> selectMemberPic(Member member) throws Exception {
		List<Member> result = null;
		try {
			result = sqlSession.selectList("MemberMapper.selectMemberPic", member);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 회원정보이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("회원정보 조회에 실패했습니다....");
		}
		return result;
	}

	@Override
	public List<Member> selectArticleListMember(Member member) throws Exception {
		List<Member> result = null;
		try {
			result = sqlSession.selectList("MemberMapper.selectArticleListMember", member);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 글 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("글 목록 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int selectArticleMemberCount(Member member) throws Exception {
        int result = 0;		
		try {
			// 게시물 수가 0건인 경우도 있으므로
			// 결과값이 0인 경우에 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("MemberMapper.selectArticleMemberCount", member);
		} catch(Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("회원작품 수 조회에 실패했습니다. ");
		}
		
		return result;
	}

	

	
	

	


}
