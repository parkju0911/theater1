package com.theater.project;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.theater.drama.DramaService;
import com.theater.notice.NoticeService;
import com.theater.util.ListData;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
	private NoticeService noticeService;
	@Inject
	private DramaService dramaService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() throws Exception{
		ListData listData = new ListData();
		listData.setCurPage(1);
		ModelAndView mv =noticeService.selectList(listData);
		mv.setViewName("home");
		return mv;
	}
	
	@RequestMapping(value = "/")
	public ModelAndView home1() throws Exception{
		ListData listData = new ListData();
		listData.setCurPage(1);
		ModelAndView mv =dramaService.selectList(listData);
		mv.setViewName("home");
		return mv;
	}
	
}
