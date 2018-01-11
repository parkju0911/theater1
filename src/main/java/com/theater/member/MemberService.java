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
	
	
	//회원가입
	public int memberJoin(MemberDTO memberDTO) throws Exception {
		return memberDAO.memberJoin(memberDTO);
	}
	
	public int userJoin(UserDTO userDTO) throws Exception {
		return memberDAO.userJoin(userDTO);
	}
	
	public int companyJoin(CompanyDTO companyDTO) throws Exception {
		return memberDAO.companyJoin(companyDTO);
	}
	
	
	//로그인
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		return memberDAO.login(memberDTO);
	}
	
	public UserDTO userLogin(UserDTO userDTO) throws Exception {
		return memberDAO.userLogin(userDTO);
	}
	
	public CompanyDTO companyLogin(CompanyDTO companyDTO) throws Exception {
		return memberDAO.companyLogin(companyDTO);
	}
	
	
	//ID 중복체크
	public MemberDTO checkId(String id) throws Exception {
		return memberDAO.checkId(id);
	}
	
	
	//ID 찾기
	public MemberDTO searchId(MemberDTO memberDTO) throws Exception {
		return memberDAO.searchId(memberDTO);
	}
	
	
	//PW 찾기
	public MemberDTO searchPw(MemberDTO memberDTO) throws Exception {
		return memberDAO.searchPw(memberDTO);
	}
	
	
	//회원 탈퇴
	public int memberDelete(String id) throws Exception {
		return memberDAO.memberDelete(id);
	}
	
	public int userDelete(String id) throws Exception {
		return memberDAO.userDelete(id);
	}
	
	public int companyDelete(String id) throws Exception {
		return memberDAO.companyDelete(id);
	}
}
