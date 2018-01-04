package com.theater.project;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.theater.drama.DramaDTO;
import com.theater.drama.DramaListDTO;
import com.theater.drama.DramaService;
import com.theater.util.ListData;

@Controller
@RequestMapping(value="/drama/*")
public class DramaController {
	

	@Inject
	public DramaService dramaService;
	
	//Drama View
		@RequestMapping(value="dramaview")
		public ModelAndView selectOne(int drama_num, ModelAndView mv,RedirectAttributes rd) throws Exception{
			//공연 정보가져오기
			DramaDTO dramaDTO = dramaService.selectOne(drama_num);
			//해당 공연의 시간 정보 가져오기
			List<DramaListDTO> ar = dramaService.dramaList(drama_num);
			int ticket = dramaService.ticket_sell(drama_num);
			
			if(dramaDTO != null) {
				mv.addObject("view", dramaDTO);
				mv.addObject("list", ar);
				mv.addObject("ticket", ticket);
				mv.setViewName("drama/dramaview");
			}else {
				rd.addFlashAttribute("message", "잘못된 접근방식 입니다.");
				mv.setViewName("Redirect:../");
			}
			
			return mv;
		}

	//selectList
	@RequestMapping(value="dramaList")
	public ModelAndView selectList(ListData listData) throws Exception {
		ModelAndView mv = null;
		mv = dramaService.selectList(listData);
		mv.setViewName("drama/list");
		
		return mv;
	}
	
	
	
	
	
	//insert -> form 이동
	@RequestMapping(value="dramaWrite", method=RequestMethod.GET)
	public String insert(Model model) {
		model.addAttribute("board", "drama");
		
		return "drama/dramaWrite";
	}
	
	//insert -> form 이동
		@RequestMapping(value="chatform", method=RequestMethod.GET)
		public String chatview(Model model) throws Exception {
			model.addAttribute("board", "drama");
			
			return "drama/chatform";
		}
	
	//insert -> DB 처리
	@RequestMapping(value="dramaWrite", method=RequestMethod.POST)
	public String insert(DramaDTO dramaDTO, Model model, HttpSession session) throws Exception {
		int result = 0;
		result = dramaService.insert(dramaDTO, session);
		
		String message = "Fail";
		if(result > 0) {
			message = "Success";
		}
		model.addAttribute("message", message);
		model.addAttribute("path", "../drama/dramaList");
		
		return "common/message";
	}
	

}
