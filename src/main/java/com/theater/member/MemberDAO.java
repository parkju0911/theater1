package com.theater.member;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="memberMapper.";
	
	public String searchCompanyName(String id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"searchCompanyName", id);
	}
	
	public CompanyDTO searchCompany(int company_num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"searchCompany", company_num);
	}
	
	
	//회원가입
	public int memberJoin(MemberDTO memberDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"memberJoin", memberDTO);
	}
	
	public int userJoin(UserDTO userDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"userJoin", userDTO);
	}
	
	public int companyJoin(CompanyDTO companyDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"companyJoin", companyDTO);
	}
	
	
	//로그인
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"login", memberDTO);
	}
	
	public UserDTO userLogin(UserDTO userDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"userLogin", userDTO);
	}
	
	public CompanyDTO companyLogin(CompanyDTO companyDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"companyLogin", companyDTO);
	}
	
	
	//ID 중복체크
	public MemberDTO checkId(String id) throws Exception {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(id);
		return sqlSession.selectOne(NAMESPACE+"checkId", memberDTO);
	}
	
	
	//ID 찾기
	public MemberDTO searchId(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"searchId", memberDTO);
	}
	
	
	//PW 찾기
	public MemberDTO searchPw(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"searchPw", memberDTO);
	}
	
	
	//회원 탈퇴
	public int memberDelete(String id) throws Exception {
		return sqlSession.delete(NAMESPACE+"memberDelete", id);
	}
	
	public int userDelete(String id) throws Exception {
		return sqlSession.delete(NAMESPACE+"userDelete", id);
	}
	
	public int companyDelete(String id) throws Exception {
		return sqlSession.delete(NAMESPACE+"companyDelete", id);
	}
	
	
	//회원 정보 수정
	public int memberUpdate(MemberDTO memberDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"memberUpdate", memberDTO);
	}
	
	public int userUpdate(UserDTO userDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"userUpdate", userDTO);
	}
	
	public int companyUpdate(CompanyDTO companyDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"companyUpdate", companyDTO);
	}
}
