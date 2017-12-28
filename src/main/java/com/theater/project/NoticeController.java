package com.theater.project;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.theater.notice.NoticeDTO;
import com.theater.notice.NoticeService;
import com.theater.util.ListData;

@Controller
@RequestMapping(value="/notice/*")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	//selectList
	@RequestMapping(value="noticeList")
	public ModelAndView selectList(ListData listData) throws Exception {
		ModelAndView modelAndView = null;
		NoticeDTO noticeDTO = new NoticeDTO();
		modelAndView = noticeService.selectList(listData);
		modelAndView.addObject("num", noticeDTO.getNotice_num());
		/*if(modelAndView != null){
			throw new NullPointerException();
		}  //ê°•ì œë¡? Exception ë°œìƒ*/
		return modelAndView;
	}

	//selectOne
	@RequestMapping(value="noticeView")
	public String selectOne(Model model, @RequestParam(defaultValue="0", required=false) int num) throws Exception{
		NoticeDTO noticeDTO = noticeService.selectOne(num);
		model.addAttribute("view", noticeDTO);
		model.addAttribute("num", noticeDTO.getNotice_num());
		model.addAttribute("board", "notice");
		return "board/boardView";
	}

	//insert -> form ?´?™
	@RequestMapping(value="noticeWrite", method = RequestMethod.GET)
	public String insert(Model model){
		model.addAttribute("board", "notice");
		return "board/boardWrite";
	}

	//insert -> DB ì²˜ë¦¬
	@RequestMapping(value="noticeWrite", method=RequestMethod.POST)
	public String insert(RedirectAttributes rd, NoticeDTO noticeDTO, HttpSession session, String path) throws Exception{
		int result = 0;
		for(MultipartFile f : noticeDTO.getFiles()){
			System.out.println(f.getOriginalFilename());
		}
		result=noticeService.insert(noticeDTO, session, path);
		String message="FAIL";
		if(result>0){
			message="SUCCESS";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:./noticeList";
	}

	//update -> form ?´?™
	@RequestMapping(value="noticeUpdate", method = RequestMethod.GET)
	public String update(int num, Model model) throws Exception{
		NoticeDTO noticeDTO = noticeService.selectOne(num);
		model.addAttribute("view", noticeDTO);
		model.addAttribute("board", "notice");
		return "board/boardUpdate";
	}

	//update -> DB ì²˜ë¦¬
	@RequestMapping(value="noticeUpdate", method = RequestMethod.POST)
	public String update(NoticeDTO noticeDTO, RedirectAttributes rd) throws Exception{
		String message = "FAIL";
		int result = noticeService.update(noticeDTO);
		if (result>0) {
			message = "SUCCESS";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:./noticeList";
	}

	//delete
	@RequestMapping(value="noticeDelete")
	public String delete(int num, RedirectAttributes rd) throws Exception{
		int result=0;
		result = noticeService.delete(num);
		String message="FAIL";
		if(result>0){
			message="SUCCESS";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:./noticeList";
	}

}
