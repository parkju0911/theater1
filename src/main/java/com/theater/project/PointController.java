package com.theater.project;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.theater.util.ListData;

import com.theater.point.*;

@Controller
@RequestMapping(value="/point/*")
public class PointController {

	@Inject
	private PointService pointService;
	
	@RequestMapping(value="pointList")
	public ModelAndView selectList(ModelAndView mv, ListData listData) throws Exception{
			
		mv = pointService.selectList(listData);
			
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
			
			return "point/pointCheck";
		}
		
		
		@RequestMapping(value="pointCheck",method=RequestMethod.POST)
		public String insert(PointDTO PointDTO, Model model, HttpSession session)throws Exception{
			System.out.println("here");
			int result = 0;
			result=pointService.attendCheck(PointDTO, session);
			 
			String message = "이미출석했습니다.";
			if(result > 0) {
				message = "출석체크"
						+ "";
			}
			model.addAttribute("message", message);
			model.addAttribute("path","../point/pointCheck");
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
