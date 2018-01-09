package com.theater.member;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Inject
	private MemberDAO memberDAO;
	
	public CompanyDTO searchCompany(int company_num) throws Exception{
		return memberDAO.searchCompany(company_num);
	}
	
	public String searchCompanyName(String id) throws Exception{
		return memberDAO.searchCompanyName(id);
	}
	
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
	
	public MemberDTO searchPw(MemberDTO memberDTO) throws Exception {
		return memberDAO.searchPw(memberDTO);
	}
	
	/*public int memberDelete(MemberDTO memberDTO) throws Exception {
		return memberDAO.memberDelete(memberDTO);
	}
	
	public int userDelete(UserDTO userDTO) throws Exception {
		return memberDAO.userDelete(userDTO);
	}
	
	public int companyDelete(CompanyDTO companyDTO) throws Exception {
		return memberDAO.companyDelete(companyDTO);
	}*/
}
