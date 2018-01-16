package com.theater.notice;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.theater.util.ListData;
import com.theater.util.Pager;
import com.theater.util.RowNum;
@Service
public class NoticeService {
	
	@Inject
	private NoticeDAO noticeDAO;

	public ModelAndView selectList(ListData listData) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		int totalCount = noticeDAO.totalCount(rowNum);
		Pager pager = listData.makePage(totalCount);
		modelAndView.setViewName("board/boardList");
		modelAndView.addObject("pager", pager);	
		modelAndView.addObject("arlist", noticeDAO.selectList(rowNum));
		modelAndView.addObject("board", "notice");
		return modelAndView;
	}
	
	 
	public NoticeDTO selectOne(int num) throws Exception {
		noticeDAO.hitUpdate(num);
		NoticeDTO noticeDTO = noticeDAO.selectOne(num);
		return noticeDTO;
	}
		 
	public int insert(NoticeDTO noticeDTO) throws Exception {
		int result = noticeDAO.insert(noticeDTO);
		return result;
	}

	 
	public int update(NoticeDTO noticeDTO) throws Exception {
		int result = noticeDAO.update(noticeDTO);
		return result;
	}

	 
	public int delete(int num) throws Exception {
		int result = noticeDAO.delete(num);
		return result;
	}

}
