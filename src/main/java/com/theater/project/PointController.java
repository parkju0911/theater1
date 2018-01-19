package com.theater.project;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.sql.Date;
import java.util.Calendar;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.theater.util.ListData;
import com.theater.member.MemberDTO;
import com.theater.member.MemberService;
import com.theater.point.*;

@Controller
@RequestMapping(value="/point/*")
@SessionAttributes("id")

public class PointController {

	@Inject
	private PointService pointService;
	@Inject
	private MemberService memberService;
	/*	@Autowired
	private PointDTO pointDTO;*/

	@RequestMapping(value="pointList")
	public ModelAndView selectList(Map<String, String> map,ModelAndView mv, ListData listData,PointDTO pointDTO,Model model,RedirectAttributes rd ,HttpSession session) throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String id = memberDTO.getId();

		/*MemberDTO memberDTO=new MemberDTO();*/

		/*String id = map.get(session.getAttribute(memberDTO.getId()));*/
		/*	session.getAttribute(id);
		System.out.println(id);
		model.addAttribute("id", id);*/

		memberDTO=memberService.login(memberDTO);

		session.setAttribute("id",memberDTO.getId());

		map.put("id",memberDTO.getId());


		mv = pointService.selectList(listData, id);


		/*if(memberDTO == null) {
				System.out.println("실패");
				rd.addFlashAttribute("message", "로그인이 필요합니다.");
				mv.setViewName("Redirect:../");


			}else {
				mv.setViewName("point/pointList");
			}
		 */
		return mv;
	}







	/*//selectOne
		@RequestMapping(value="pointView")
		public ModelAndView selectOne(ModelAndView mv, int num, RedirectAttributes rd) throws Exception{
			PointDTO PointDTO = null;

			PointDTO = pointService.selectOne(num);


			if(PointDTO != null){
				mv.addObject("view", PointDTO);
				mv.setViewName("point/pointView");
			}else{
				rd.addFlashAttribute("message","해당 번호의 게시물이 존재하지 않습니다.");
				mv.setViewName("redirect:./pointList");
			}
			mv.addObject("point", "point");

			return mv;
		}*/
	@RequestMapping(value="pointUpdate",method=RequestMethod.POST)
	public String update(PointDTO pointDTO,RedirectAttributes rd)throws Exception{
		int result=0;
		result=pointService.update(pointDTO);
		String message = "포인트 적립 실패";
		if(result>0){
			message = "포인트적립 성공";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:./pointList";

	}


	@RequestMapping(value="pointCheck",method=RequestMethod.GET)
	public String insert(Model model) throws Exception{
		model.addAttribute("point", "point");

		return "point/pointList";
	}


	@RequestMapping(value="pointCheck",method=RequestMethod.POST)
	public String insert(Map<String, String> map,PointDTO pointDTO, String id, HttpSession session,RedirectAttributes rd,Date d)throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv=new ModelAndView();
		id = memberDTO.getId();
		memberDTO=memberService.login(memberDTO);
		
		session.setAttribute("id",memberDTO.getId());
/*
		map.put("id",memberDTO.getId());*/

		/*	
		 * 
		 * int result = 0;
			//result=pointService.attendCheck(pointDTO, session, id, rd);
			//result=pointService.pointCheck(session, memberDTO, rd, mv, pointDTO, id);
			String message = "이미출석했습니다.";
			if(result > 0) {
				message = "출석체크";

			}
		 */
		
		mv=pointService.pointCheck(session, rd, mv, pointDTO, id);
		int result=0;
		/*result=pointService.attendCheck(pointDTO, session, id, rd);
		String message="이미 출석체크를 하셨습니다. 내일 다시 시도해주세요.";
		if(result>0){
			message="출석 3P적립완료";
		}
		rd.addFlashAttribute("message", message);*/
		return "redirect:./pointList";
		
		
		
		
		
		
	}

	@RequestMapping(value="pointUse",method=RequestMethod.POST)
	public String usePoint(PointDTO pointDTO,RedirectAttributes rd)throws Exception{
		int result=0;
		result=pointService.update(pointDTO);
		String message = "포인트 사용실패";
		if(result>0){
			message = "포인트사용";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:./pointList";

	}









}
