package com.theater.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.theater.qna.FaqDTO;
import com.theater.qna.FaqService;

@Controller
@RequestMapping(value="/member/**")
public class FaqController {

	@Autowired
	private FaqService faqService;

	//insert -> form 이동
	@RequestMapping(value="faqWrite", method = RequestMethod.GET)
	public String insert(Model model){
		return "member/faqWrite";
	}

	//insert -> DB 처리
	@RequestMapping(value="faqWrite", method=RequestMethod.POST)
	public String insert(RedirectAttributes rd, FaqDTO faqDTO) throws Exception{
		int result = 0;
		result=faqService.insert(faqDTO);
		String message="FAIL";
		if(result>0){
			message="SUCCESS";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:./faq";
	}

}
