package com.theater.project;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.theater.email.EmailDTO;
import com.theater.member.CompanyDTO;
import com.theater.member.MemberDTO;
import com.theater.member.MemberService;
import com.theater.member.UserDTO;

@Controller
@RequestMapping(value="/member/**")
public class MemberController {

	@Inject
	private MemberService memberService;

	/*@Inject
	private EmailSender emailSender;*/

	@Autowired
	private EmailDTO emailDTO;

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value="memberPwSearch", method=RequestMethod.GET)
	public String searchPw(){
		return "member/searchPw";
	}

	@RequestMapping(value="memberPwSearch", method=RequestMethod.POST)
	public String sendEmailAction (MemberDTO memberDTO, RedirectAttributes attributes) {
		String result = "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.";
		try {
			memberDTO = memberService.searchPw(memberDTO);
			String id = memberDTO.getId();
			String pw = memberDTO.getPw();
			String email = memberDTO.getEmail();
			if(memberDTO!=null) {
				emailDTO.setContent("비밀번호는 "+pw+" 입니다."); // 이메일로 보낼 메시지
				emailDTO.setReceiver(email); // 받는이의 이메일 주소
				emailDTO.setSubject(id+"님 비밀번호 찾기 메일입니다."); // 이메일로 보낼 제목
				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8"); //두번째 인자 true여야 파일첨부 가능.

					messageHelper.setSubject(emailDTO.getSubject());
					messageHelper.setText(emailDTO.getContent());
					messageHelper.setTo(emailDTO.getReceiver());
					messageHelper.setFrom("officialTEATRO2017@gmail.com"); // 보내는 이의 주소(root-context.xml 에서 선언했지만 적어줬음)
					message.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(emailDTO.getReceiver()));
					mailSender.send(message);
					result = "귀하의 이메일 주소로 비밀번호를 발송 하였습니다.";
				}catch(MessagingException e) {
					System.out.println("MessagingException");
					e.printStackTrace();
				}
			}
		}
		catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		attributes.addFlashAttribute("result", result);
		return "redirect:memberLogin";
	}

	@RequestMapping(value="memberIdSearch", method=RequestMethod.POST)
	public ModelAndView searchId(ModelAndView modelAndView, MemberDTO memberDTO){
		try {
			memberDTO = memberService.searchId(memberDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.setViewName("member/searchId");
		return modelAndView;
	}

	@RequestMapping(value="memberIdSearch", method=RequestMethod.GET)
	public String memberIdSearch(){
		return "member/memberIdSearch";
	}

	@RequestMapping(value="memberJoin1", method=RequestMethod.GET)
	public String memberJoin1(){
		return "member/memberJoin1";
	}

	@RequestMapping(value="memberJoin2", method=RequestMethod.GET)
	public String memberJoin2(){
		return "member/memberJoin2";
	}

	@RequestMapping(value="memberJoin", method=RequestMethod.GET)
	public String memberJoin(){
		return "member/memberJoin";
	}

	@RequestMapping(value="/user/memberJoin", method=RequestMethod.POST)
	public String memberJoinUser(RedirectAttributes attributes, MemberDTO memberDTO, UserDTO userDTO) throws Exception {
		int result = memberService.memberJoin(memberDTO);
		result = memberService.userJoin(userDTO);
		String message="회원가입 실패";
		if(result>0){
			message="회원가입 성공";
		}
		attributes.addFlashAttribute("message", message);
		return "redirect:/";
	}

	@RequestMapping(value="/company/memberJoin", method=RequestMethod.POST)
	public String memberJoinCompany(RedirectAttributes attributes, MemberDTO memberDTO, CompanyDTO companyDTO) throws Exception {
		int result = memberService.memberJoin(memberDTO);
		result = memberService.companyJoin(companyDTO);
		String message="회원가입 실패";
		if(result>0){
			message="회원가입 성공";
		}
		attributes.addFlashAttribute("message", message);
		return "redirect:/";
	}

	@RequestMapping(value="memberLogin", method=RequestMethod.GET)
	public void membrLogin(){}

	@RequestMapping(value="memberLogin", method=RequestMethod.POST)
	public String memberLogin(MemberDTO memberDTO, UserDTO userDTO, CompanyDTO companyDTO, HttpSession session){
		try {
			memberDTO=memberService.login(memberDTO);
			userDTO=memberService.userLogin(userDTO);
			companyDTO=memberService.companyLogin(companyDTO);
		} catch (Exception e) {
			memberDTO=null;
			userDTO=null;
			companyDTO=null;
			e.printStackTrace();
		}
		if(memberDTO != null){
			session.setAttribute("member", memberDTO);
			if(memberDTO.getKind().equals("user")){
				session.setAttribute("user", userDTO);
			}else if (memberDTO.getKind().equals("company")){
				session.setAttribute("company", companyDTO);
			}
		}
		return "redirect:/";	
	}

	@RequestMapping(value="memberLogout")
	public String memberLogout(RedirectAttributes attributes, HttpSession session){
		session.invalidate();
		String message="로그아웃 되었습니다.";
		attributes.addFlashAttribute("message", message);
		return "redirect:/";
	}

	@RequestMapping(value="checkId", method=RequestMethod.POST)
	@ResponseBody
	public int checkId(String id){
		int result = 0;
		MemberDTO memberDTO = null;
		try {
			memberDTO = memberService.checkId(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(memberDTO==null){
			result = 1;
		} 
		return result;
	}

	@RequestMapping(value="memberMypage", method=RequestMethod.GET)
	public String memberMypage(){
		return "member/memberMypage";
	}
	
	@RequestMapping(value="membership", method=RequestMethod.GET)
	public String membership(){
		return "member/membership";
	}
	
	@RequestMapping(value="mypoint", method=RequestMethod.GET)
	public String mypoint(){
		return "member/mypoint";
	}

	@RequestMapping(value="orderlist", method=RequestMethod.GET)
	public String orderlist(){
		return "member/orderlist";
	}
	@RequestMapping(value="faq", method=RequestMethod.GET)
	public String faq(){
		return "member/faq";
	}
	
	@RequestMapping(value="myboard", method=RequestMethod.GET)
	public String myboard(){
		return "member/myboard";
	}
	
	@RequestMapping(value="qna", method=RequestMethod.GET)
	public String qna(){
		return "member/qna";
	}
	
	@RequestMapping(value="memberDelete", method=RequestMethod.GET)
	public String memberDelete(RedirectAttributes attributes, String id, HttpSession session){
		int result=0;
		try {
			if (session.getAttribute("user") != null) {
				result = memberService.userDelete(id);
			} else if (session.getAttribute("company") != null) {
				result = memberService.companyDelete(id);
			}
			result = memberService.memberDelete(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.invalidate();
		String message="FAIL";
		if(result>0){
			message="SUCCESS";
		}
		attributes.addFlashAttribute("message", message);
		return "redirect:/";
	}

}
