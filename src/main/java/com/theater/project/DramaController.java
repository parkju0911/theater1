package com.theater.project;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.theater.drama.DramaDTO;
import com.theater.drama.DramaListDTO;
import com.theater.drama.DramaService;
import com.theater.qna.QnaDTO;
import com.theater.review.ReviewDTO;
import com.theater.util.ListData;

@Controller
@RequestMapping(value="/drama/*")
public class DramaController {
	

	@Inject
	public DramaService dramaService;
	
	//Drama View
		@RequestMapping(value="dramaview")
		public ModelAndView selectOne(int drama_num, ModelAndView mv,RedirectAttributes rd) throws Exception{
			//공연 정보가져오기
			DramaDTO dramaDTO = dramaService.selectOne(drama_num);
			//해당 공연의 시간 정보 가져오기
			List<DramaListDTO> ar = dramaService.dramaList(drama_num);
			int ticket = dramaService.ticket_sell(drama_num);
			
			List<ReviewDTO> ar_review = dramaService.selectList_review(drama_num);
			
			int totalcount = dramaService.totalcount(drama_num); //연극 리뷰 총 인원
			
			int review_avg = dramaService.review_avg(drama_num); //연극 리뷰 평균 점수
			
			
			if(dramaDTO != null) {
				mv.addObject("view", dramaDTO); //drama 정보 (제목,설명,가격)
				mv.addObject("list", ar);   //극 상영일  선택
				mv.addObject("list2", ar); //극 상영 시간 선택
				mv.addObject("ticket", ticket); //매수 구매 설정
				mv.addObject("review", ar_review);
				mv.addObject("total", totalcount);
				mv.addObject("avg", review_avg);
				mv.setViewName("drama/dramaview");
			}else {
				rd.addFlashAttribute("message", "잘못된 접근방식 입니다.");
				mv.setViewName("Redirect:../");
			}
			
			return mv;
		
		}
		@RequestMapping(value="reviewlist")
		public ModelAndView selectList(int drama_num ,ModelAndView model , RedirectAttributes rd)throws Exception{
			List<ReviewDTO> ar_review = dramaService.selectList_review(drama_num);
			
			int totalcount = dramaService.totalcount(drama_num); //연극 리뷰 총 인원
			
			int review_avg = dramaService.review_avg(drama_num); //연극 리뷰 평균 점수
			if(ar_review !=null){
				model.addObject("review", ar_review);
				model.addObject("total", totalcount);
				model.addObject("avg", review_avg);
				model.setViewName("/drama/reviewlist");
				
			}else{
				rd.addFlashAttribute("message", "관람일이 지났습니다.");
				model.setViewName("/drama/dramalist");
			}
			
			return model;
		}
		@RequestMapping(value="refundlist")
		public String refundlist()throws Exception{
			
			return "drama/refundlist";
		}
			@RequestMapping(value="text_info")
		public String textinfo(Model model , int drama_num)throws Exception{ 
				
				DramaDTO dramaDTO = dramaService.selectOne(drama_num);
				model.addAttribute("view2", dramaDTO);
				return "drama/text_info";
			}
			
		@RequestMapping(value="qnalist")
			public String qnalist(int drama_num , ModelAndView mv)throws Exception{
				
				List<QnaDTO> qnaDTO = dramaService.selectList_qna(drama_num);
				
				if(qnaDTO !=null){
					mv.addObject("qna", qnaDTO);
					mv.setViewName("drama/qnalist");
				}
				
				return "drama/qnalist";
						
			}
		
		
	//selectList
	@RequestMapping(value="dramaList")
	public ModelAndView selectList(ListData listData) throws Exception {
		ModelAndView mv = null;
		mv = dramaService.selectList(listData);
		mv.setViewName("drama/list");
		
		return mv;
	}
	
	
	//insert -> form 이동
	@RequestMapping(value="dramaWrite", method=RequestMethod.GET)
	public String insert(Model model) {
		model.addAttribute("board", "drama");
		
		return "drama/dramaWrite";
	}
	
	//insert -> DB 처리
	@RequestMapping(value="dramaWrite", method=RequestMethod.POST)
	public String insert(DramaDTO dramaDTO, Model model, HttpSession session) throws Exception {
		int result = 0;
		result = dramaService.insert(dramaDTO, session);
		
		String message = "Fail";
		if(result > 0) {
			message = "Success";
		}
		model.addAttribute("message", message);
		model.addAttribute("path", "../drama/dramaList");
		
		return "common/message";
	}
	

}
