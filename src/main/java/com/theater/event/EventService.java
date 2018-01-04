package com.theater.event;



import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.theater.util.ListData;
import com.theater.util.Pager;
import com.theater.util.RowNum;

@Service
public class EventService {
	
	@Inject
	private EventDAO eventDAO;

	public ModelAndView selectList(ListData listData) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		int totalCount = eventDAO.totalCount(rowNum);
		Pager pager = listData.makePage(totalCount);
		modelAndView.setViewName("board/boardList");
		modelAndView.addObject("pager", pager);	
		modelAndView.addObject("list", eventDAO.selectList(rowNum));
		modelAndView.addObject("board", "event");
		return modelAndView;
	}

	 
	public EventDTO selectOne(int num) throws Exception {
		eventDAO.hitUpdate(num);
		EventDTO eventDTO = eventDAO.selectOne(num);
		return eventDTO;
	}
		 
	public int insert(EventDTO eventDTO) throws Exception {
		int result = eventDAO.insert(eventDTO);
		return result;
	}

	 
	public int update(EventDTO eventDTO) throws Exception {
		int result = eventDAO.update(eventDTO);
		return result;
	}

	 
	public int delete(int num) throws Exception {
		int result = eventDAO.delete(num);
		return result;
	}

}
