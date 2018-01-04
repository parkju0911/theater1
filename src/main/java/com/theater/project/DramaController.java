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
import com.theater.qna.Qna_viewDTO;
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
			
			List<ReviewDTO> ar_review = dramaService.selectList_review(drama_num); //최신순으로 후기 보여줌(3개)
			
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
		//리뷰 리스트 , 별점,별점 평균점수
		@RequestMapping(value="reviewlist")
		public ModelAndView review_list(ModelAndView mv , ListData listData , int drama_num)throws Exception{
			mv = dramaService.review_list(listData);
			int totalcount = dramaService.totalcount(drama_num);
			int review_avg = dramaService.review_avg(drama_num);
			mv.addObject("total", totalcount);
			mv.addObject("avg", review_avg);
				return mv;
		}
/*		@RequestMapping(value="reviewlist")
		public ModelAndView selectList(int drama_num ,ModelAndView model , RedirectAttributes rd , ListData listData)throws Exception{
			
			int totalcount = dramaService.totalcount(drama_num); //연극 리뷰 총 인원
			
			int review_avg = dramaService.review_avg(drama_num); //연극 리뷰 평균 점수
			
				model.addObject("total", totalcount);
				model.addObject("avg", review_avg);
				model.setViewName("/drama/reviewlist");

				return model;
		}*/
		//환불규정 page
		@RequestMapping(value="refundlist")
		public String refundlist()throws Exception{
			
			return "drama/refundlist";
		}
		//안내(지도api) page
			@RequestMapping(value="text_info")
		public String textinfo(Model model , int drama_num)throws Exception{ 
				
				DramaDTO dramaDTO = dramaService.selectOne(drama_num);
				model.addAttribute("view2", dramaDTO);
				return "drama/text_info";
			}
			//qna list page & write form(Get)
		@RequestMapping(value="qnalist" , method=RequestMethod.GET)
			public ModelAndView selectList_qna( ModelAndView mv , ListData listData)throws Exception{
				
				mv = dramaService.selectList_qna(listData);
				
				return mv;
						
			}
		//qna list page & write form(Post)
		@RequestMapping(value="qnawrite" , method=RequestMethod.POST)
		public String selectList_qna( ModelAndView mv , HttpSession session , ListData listData , Qna_viewDTO qna_viewDTO , RedirectAttributes rd)throws Exception{
			int result=0;
			result = dramaService.qna_insert(qna_viewDTO, session);
			
			String message="등록실패";
			if(result>0){
				message="등록완료";
			}
			rd.addFlashAttribute("message", message);
			return "redirect:./dramaview";
					
		}
		//qna delete 
		@RequestMapping(value="qnalist")
		public String delete_qnaview(int qna_viewnum ,RedirectAttributes rd , HttpSession session)throws Exception{
		int	result = 0;
				result = dramaService.delete_qnaview(qna_viewnum, session);
			
				String message="삭제 실패";
				if(result>0){
					message="삭제 성공";
					
				}
				rd.addFlashAttribute("message", message);
			return "redirect:./dramaview";
		}
		@RequestMapping(value="dramaReview")
		public ModelAndView dramaReviewList(ModelAndView mv , ListData listData)throws Exception{
		
			mv = dramaService.dramaReviewList(listData);
			return mv;
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
