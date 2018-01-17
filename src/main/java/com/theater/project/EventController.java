package com.theater.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.theater.event.EventDTO;
import com.theater.event.EventService;
import com.theater.util.ListData;

@Controller
@RequestMapping(value="/event/*")
public class EventController {

	@Autowired
	private EventService eventService;

	//selectList
	@RequestMapping(value="eventList")
	public ModelAndView selectList(ListData listData) throws Exception {
		ModelAndView modelAndView = null;
		EventDTO eventDTO = new EventDTO();
		modelAndView = eventService.selectList(listData);
		modelAndView.addObject("num", eventDTO.getEvent_num());
		/*if(modelAndView != null){
			throw new NullPointerException();
		}  //강제�? Exception 발생*/
		return modelAndView;
	}

	//selectOne
	@RequestMapping(value="eventView")
	public String selectOne(Model model, @RequestParam(defaultValue="0", required=false) int num) throws Exception{
		EventDTO eventDTO = eventService.selectOne(num);
		model.addAttribute("view", eventDTO);
		model.addAttribute("num", eventDTO.getEvent_num());
		model.addAttribute("board", "event");
		return "board/boardView";
	}

	//insert -> form 이동
	@RequestMapping(value="eventWrite", method = RequestMethod.GET)
	public String insert(Model model){
		model.addAttribute("board", "event");
		return "board/boardWrite";
	}

	//insert -> DB 처리
	@RequestMapping(value="eventWrite", method=RequestMethod.POST)
	public String insert(RedirectAttributes rd, EventDTO eventDTO) throws Exception{
		int result = 0;
		/*for(MultipartFile f : eventDTO.getFiles()){
			System.out.println(f.getOriginalFilename());
		}*/
		result=eventService.insert(eventDTO);
		String message="FAIL";
		if(result>0){
			message="SUCCESS";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:./eventList";
	}

	//update -> form 이동
	@RequestMapping(value="eventUpdate", method = RequestMethod.GET)
	public String update(int num, Model model, ListData listData) throws Exception{
		EventDTO eventDTO = eventService.selectOne(num);
		model.addAttribute("view", eventDTO);
		model.addAttribute("board", "event");
		return "board/boardUpdate";
	}

	//update -> DB 처리
	@RequestMapping(value="eventUpdate", method = RequestMethod.POST)
	public String update(EventDTO eventDTO, RedirectAttributes rd) throws Exception{
		int result=0;
		result = eventService.update(eventDTO);
		String message = "FAIL";
		if (result>0) {
			message = "SUCCESS";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:./eventList";
	}

	//delete
	@RequestMapping(value="eventDelete")
	public String delete(int num, RedirectAttributes rd) throws Exception{
		int result=0;
		result = eventService.delete(num);
		String message="FAIL";
		if(result>0){
			message="SUCCESS";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:./eventList";
	}

}
