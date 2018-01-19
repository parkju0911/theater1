package com.theater.point;

import java.sql.Date;
import java.util.Calendar;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.theater.member.MemberDTO;
import com.theater.member.UserDTO;
import com.theater.review.ReviewDTO;
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
		int totalCount=pointDAO.totalCount(rowNum);
		List<PointDTO> ar = pointDAO.selectList(id,rowNum);
		MemberDTO memberDTO=new MemberDTO();

		
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
	public int  attendCheck (PointDTO pointDTO, HttpSession session,String id,RedirectAttributes rd)throws Exception {
		//출석체크
		Map<String, Object> map = new HashMap<String, Object>();
		ModelAndView mv = new ModelAndView();
		int	result=pointDAO.attendCheck(pointDTO, id);

	

	return result;
	}
	
	@Transactional
	public ModelAndView pointCheck(HttpSession session,RedirectAttributes rd,ModelAndView mv,PointDTO pointDTO,String id)throws Exception{
		// 출석체크 테스트
					
	/*
					boolean check=pointDAO.day_Check(pointDTO, reg_date, id);
					
					return check;
					*/
					
					MemberDTO memberDTO=null;
					UserDTO userDTO=new UserDTO(); 
					
					Calendar ca=Calendar.getInstance();
					long l=ca.getTimeInMillis();
					Date da = new Date(l);
					System.out.println(da);
					
					boolean result=false;
					int check;
					
					try {
						result=pointDAO.day_Check(pointDTO,da, id);
						
						if(result) {
							System.out.println("here");
							rd.addFlashAttribute("message", "이미 출석체크를 하셨습니다. 내일 다시 시도해주세요.");
						}else {
							System.out.println("here2");
							int result2 = pointDAO.attendCheck(pointDTO, id);
							if(result2>0) {
								check=pointDAO.day_Insert(id, da);
								/*
								
								memberDTO=(MemberDTO) pointDAO.mSelect(id);
								session.setAttribute("member", memberDTO);*/	
								rd.addFlashAttribute("message","출석 3P적립완료");
								
								mv.setViewName("point/pointList");
								
								}
						}
					}catch (Exception e) {
						e.printStackTrace();
					}
				
					
					
					return mv;
					
		
	}
	
	}
	
	
	

	

	
	
	
	
