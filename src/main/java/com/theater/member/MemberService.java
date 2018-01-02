package com.theater.member;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Inject
	private MemberDAO memberDAO;
	
	public int memberJoin(MemberDTO memberDTO) throws Exception {
		return memberDAO.memberJoin(memberDTO);
	}
	
	public int userJoin(UserDTO userDTO) throws Exception {
		return memberDAO.userJoin(userDTO);
	}
	
	public int companyJoin(CompanyDTO companyDTO) throws Exception {
		return memberDAO.companyJoin(companyDTO);
	}
	
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		return memberDAO.login(memberDTO);
	}
	
	public MemberDTO checkId(String id) throws Exception {
		return memberDAO.checkId(id);
	}
	
	public MemberDTO searchId(MemberDTO memberDTO) throws Exception {
		return memberDAO.searchId(memberDTO);
	}
}
