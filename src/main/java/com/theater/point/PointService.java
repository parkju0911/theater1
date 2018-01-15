package com.theater.point;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import org.springframework.web.servlet.ModelAndView;

import com.theater.member.MemberDTO;
import com.theater.util.ListData;
import com.theater.util.Pager;
import com.theater.util.RowNum;

@Service
public class PointService {

	
	@Inject
	private PointDAO pointDAO;
	

	public ModelAndView selectList(ListData listData,String id) throws Exception {
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(pointDAO.totalCount(rowNum));
		PointDTO pointDTO=new PointDTO();
	
		List<PointDTO> ar = pointDAO.selectList(id,rowNum);
/*		Map<String, Object> map = new HashMap<String, Object>();
		MemberDTO memberDTO=new MemberDTO();
		map.put("id", memberDTO.getId());*/
		
		
		mv.addObject("pager", pager);
		mv.addObject("list", ar);
		
		mv.addObject("point", "point");
		
		mv.setViewName("point/pointList");
		return mv;
	}

	
/*	public PointDTO selectOne(int num) throws Exception {
	
		PointDTO pointDTO = pointDAO.selectOne(num);

		
		return pointDTO;
	}
*/
	public int update(PointDTO pointDTO)throws Exception{
		int result=pointDAO.updatePoint(pointDTO);
		return result;
	}
	public int  attendCheck (PointDTO pointDTO, HttpSession session,String id)throws Exception{//출석체크
		
	
		

		  Map<String, Object> map = new HashMap<String, Object>();
		
	/*	MemberDTO memberDTO=new MemberDTO();
		String id = memberDTO.getId();
		session.setAttribute("id",id);*/
		/*map.put("point_num",pointDTO.getPoint_num());
		map.put("id", "iu");
		map.put("history","적립");
		map.put("point", 3);
		map.put("total_point",pointDTO.getTotal_point());
		map.put("kind","출석체크");
		map.put("reg_date",pointDTO.getReg_date());
	*/
		int	result=pointDAO.attendCheck(pointDTO, id);

		

		return result;
	}
	
	public int usePoint(PointDTO pointDTO)throws Exception{
		int result=pointDAO.usePoint(pointDTO);
		return result;
		
	}
	
	/*public int insert(PointDTO pointDTO,HttpSession httpSession)throws Exception{
		
		int result=pointDAO.insert(pointDTO);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		
		map.put("point_num",pointDTO.getPoint_num());
		map.put("id", pointDTO.getId());
		map.put("history",pointDTO.getHistory());
		map.put("point", pointDTO.getPoint());
		map.put("total_point",pointDTO.getTotal_point());
		map.put("kind",pointDTO.getKind());
		map.put("reg_date",pointDTO.getReg_date());
		
		result=pointDAO.attendCheck(pointDTO);
		
	
		

		return result;
	}*/
}
