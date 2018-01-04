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

import com.theater.file.FileDTO;
import com.theater.file.FileListDTO;
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
		}  //媛뺤젣濡? Exception 諛쒖깮*/
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

	//insert -> form ?씠?룞
	@RequestMapping(value="noticeWrite", method = RequestMethod.GET)
	public String insert(Model model){
		model.addAttribute("board", "notice");
		return "board/boardWrite";
	}

	//insert -> DB 泥섎━
	@RequestMapping(value="noticeWrite", method=RequestMethod.POST)
	public String insert(RedirectAttributes rd, NoticeDTO noticeDTO) throws Exception{
		int result = 0;
		result=noticeService.insert(noticeDTO);
		String message="FAIL";
		if(result>0){
			message="SUCCESS";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:./noticeList";
	}

	//update -> form ?씠?룞
	@RequestMapping(value="noticeUpdate", method = RequestMethod.GET)
	public String update(int num, Model model, ListData listData) throws Exception{
		NoticeDTO noticeDTO = noticeService.selectOne(num);
		model.addAttribute("view", noticeDTO);
		model.addAttribute("board", "notice");
		return "board/boardUpdate";
	}

	//update -> DB 泥섎━
	@RequestMapping(value="noticeUpdate", method = RequestMethod.POST)
	public String update(NoticeDTO noticeDTO, RedirectAttributes rd) throws Exception{
		int result=0;
		result = noticeService.update(noticeDTO);
		String message = "수정에 실패하였습니다.";
		if (result>0) {
			message = "수정이 완료되었습니다.";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:./noticeList";
	}

	//delete
	@RequestMapping(value="noticeDelete")
	public String delete(int num, RedirectAttributes rd) throws Exception{
		int result=0;
		result = noticeService.delete(num);
		String message="삭제에 실패하였습니다.";
		if(result>0){
			message="삭제되었습니다.";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:./noticeList";
	}

}
