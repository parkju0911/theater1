package com.theater.qna;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.theater.util.ListData;
import com.theater.util.Pager;
import com.theater.util.RowNum;

@Service
public class FaqService {
	
	@Inject
	private FaqDAO faqDAO;
	
	public int insert(FaqDTO faqDTO) throws Exception {
		return faqDAO.insert(faqDTO);
	}
	
	public ModelAndView selectList(ListData listData) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		int totalCount = faqDAO.totalCount(rowNum);
		Pager pager = listData.makePage(totalCount);
		modelAndView.setViewName("member/faq");
		modelAndView.addObject("pager", pager);	
		modelAndView.addObject("list", faqDAO.selectList(rowNum));
		return modelAndView;
	}
	
	 
	public FaqDTO selectOne(int num) throws Exception {
		FaqDTO faqDTO = faqDAO.selectOne(num);
		return faqDTO;
	}
	
	public int update(FaqDTO faqDTO) throws Exception {
		return faqDAO.update(faqDTO);
	}

	 
	public int delete(int num) throws Exception {
		return faqDAO.delete(num);
	}

}
