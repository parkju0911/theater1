package com.theater.qna;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class FaqService {
	
	@Inject
	private FaqDAO faqDAO;
	
	public int insert(FaqDTO faqDTO) throws Exception {
		return faqDAO.insert(faqDTO);
	}

}
