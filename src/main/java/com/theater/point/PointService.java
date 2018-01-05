package com.theater.point;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;


import com.theater.util.ListData;
import com.theater.util.Pager;
import com.theater.util.RowNum;

@Service
public class PointService {

	
	@Inject
	private PointDAO pointDAO;
	

	public ModelAndView selectList(ListData listData) throws Exception {
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(pointDAO.totalCount(rowNum));
		PointDTO PointDTO = new PointDTO();
		
		List<PointDTO> ar = pointDAO.selectList(rowNum);
		mv.addObject("p",PointDTO);
		mv.addObject("pager", pager);
		mv.addObject("list", ar);
		mv.addObject("point", "point");
		mv.setViewName("point/pointList");
		return mv;
	}

	
	public PointDTO selectOne(int num) throws Exception {
	
		PointDTO pointDTO = pointDAO.selectOne(num);

		
		return pointDTO;
	}

	public int update(PointDTO pointDTO)throws Exception{
		int result=pointDAO.updatePoint(pointDTO);
		return result;
	}
	public int  attendCheck (PointDTO pointDTO, HttpSession session)throws Exception{//출석체크
		
		int result=pointDAO.attendCheck(pointDTO);
		return result;
	}
}
