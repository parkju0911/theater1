package com.theater.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.theater.qna.FaqDTO;
import com.theater.qna.FaqService;
import com.theater.util.ListData;

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

	//selectList
	@RequestMapping(value="faq", method = RequestMethod.GET)
	public ModelAndView selectList(ListData listData) throws Exception {
		ModelAndView modelAndView = null;
		modelAndView = faqService.selectList(listData);
		return modelAndView;
	}

	//selectOne
	@RequestMapping(value="faqView", method = RequestMethod.GET)
	public String selectOne(Model model, @RequestParam(defaultValue="0", required=false) int num) {
		FaqDTO faqDTO = null;
		try {
			faqDTO = faqService.selectOne(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("view", faqDTO);
		return "member/faqView";
	}

	//update -> form 이동
	@RequestMapping(value="faqUpdate", method = RequestMethod.GET)
	public String update(int num, Model model, ListData listData) throws Exception{
		FaqDTO faqDTO = faqService.selectOne(num);
		model.addAttribute("view", faqDTO);
		return "member/faqUpdate";
	}

	//update -> DB 처리
	@RequestMapping(value="faqUpdate", method = RequestMethod.POST)
	public String update(FaqDTO faqDTO, RedirectAttributes rd) throws Exception{
		int result=0;
		result = faqService.update(faqDTO);
		String message="FAIL";
		if(result>0){
			message="SUCCESS";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:./faq";
	}

	//delete
	@RequestMapping(value="faqDelete", method = RequestMethod.GET)
	public String delete(int num, RedirectAttributes rd) throws Exception{
		int result=0;
		result = faqService.delete(num);
		String message="FAIL";
		if(result>0){
			message="SUCCESS";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:./faq";
	}

}
