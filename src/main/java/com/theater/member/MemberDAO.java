package com.theater.member;

import java.util.HashMap;
import java.util.Map;

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
	
	public int memberJoin(MemberDTO memberDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"memberJoin", memberDTO);
	}
	
	public int userJoin(UserDTO userDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"userJoin", userDTO);
	}
	
	public int companyJoin(CompanyDTO companyDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"companyJoin", companyDTO);
	}
	
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"login", memberDTO);
	}
	
	public MemberDTO checkId(String id) throws Exception {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(id);
		return sqlSession.selectOne(NAMESPACE+"checkId", memberDTO);
	}
	
	public MemberDTO searchId(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"searchId", memberDTO);
	}
	
	public MemberDTO searchPw(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"searchPw", memberDTO);
	}
	
	/*public int memberDelete(MemberDTO memberDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"memberDelete", memberDTO);
	}
	
	public int userDelete(UserDTO userDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"userDelete", userDTO);
	}
	
	public int companyDelete(CompanyDTO companyDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"companyDelete", companyDTO);
	}*/
}
