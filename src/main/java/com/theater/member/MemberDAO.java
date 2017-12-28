package com.theater.member;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="memberMapper.";
	
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
	
}
