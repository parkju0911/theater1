package com.theater.project;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.theater.drama.DramaDTO;
import com.theater.drama.DramaListDTO;
import com.theater.drama.DramaService;
import com.theater.drama.SeatDTO;
import com.theater.file.FileDTO;
import com.theater.member.CompanyDTO;
import com.theater.member.MemberDTO;
import com.theater.member.MemberService;
import com.theater.qna.Qna_viewDTO;
import com.theater.review.ReviewDTO;
import com.theater.util.FileSaver;
import com.theater.util.ListData;

@Controller
@RequestMapping(value="/drama/*")
public class DramaController {
	@Inject
	public DramaService dramaService;
	@Inject
	public MemberService memberService;
	
	//좌석 선택 1-10 수정
	@RequestMapping(value="insertBuy")
	public void insertBuy(SeatDTO seatDTO, String drama_date,HttpSession session) throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");

		seatDTO.setDrama_date(Date.valueOf(drama_date));;
		int result=dramaService.insertBuy(seatDTO, memberDTO);
			
		if(result>0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
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
	
	//Select Seat 1-10 수정
	@RequestMapping(value="selectSeat")
	public ModelAndView selectSeat(SeatDTO seatDTO,ModelAndView mv) throws Exception{
		//공연 정보 가져오기
		DramaDTO dramaDTO = dramaService.selectOne(seatDTO.getDrama_num());
		//회사명,좌석 수 가져오기
		CompanyDTO companyDTO = memberService.searchCompany(dramaDTO.getCompany_num());
		companyDTO.setName(memberService.searchCompanyName(companyDTO.getId()));
		
		//해당 공연 선택된 좌석 리스트 가져오기
		int date_num= dramaService.search_dateNum(seatDTO.getDrama_num(), seatDTO.getDrama_date().toString(), seatDTO.getDrama_time());
		List<SeatDTO> selectSeat=dramaService.selectSeat(seatDTO.getDrama_num(), date_num);
		ArrayList<String> selectSeatDTO = new ArrayList<String>();
	
		for(SeatDTO SeatDTO : selectSeat) {
			String[] split = SeatDTO.getSelect_seat().split(",");
			for(int i=0; i<split.length; i++) {
				selectSeatDTO.add(split[i]);
			}
		}
		
		int total_selectTicket = 0;
		if(date_num != 0) {
			for(int i=0; i<selectSeat.size(); i++) {
				total_selectTicket =+ selectSeat.get(i).getTicket_numbers();
			}
		}
		
		mv.addObject("drama", dramaDTO);
		mv.addObject("company", companyDTO);
		mv.addObject("seat", seatDTO);
		mv.addObject("select", selectSeatDTO);
		mv.addObject("selectSize", total_selectTicket);
		mv.setViewName("drama/selectSeat");
			
		return mv;
	}
	//Drama_ticket 1-10 수정
	@RequestMapping("dramaTicket")
	public ModelAndView drama_ticket(DramaListDTO dramaListDTO, ModelAndView mv) throws Exception{
		//해당 날짜의 해당 시간의 남아있는 좌석 수만큼 가져오기
		int total_seat = dramaService.total_seat(dramaListDTO.getDrama_num());
		int date_num = dramaService.search_dateNum(dramaListDTO.getDrama_num(), dramaListDTO.getDrama_date(), dramaListDTO.getDrama_time());
		
		List<SeatDTO> select = dramaService.selectSeat(dramaListDTO.getDrama_num(), date_num);
		
		int select_size=0;
		int total_selectTicket = 0;
		if(date_num != 0) {
			for(int i=0; i<select.size(); i++) {
				total_selectTicket =+ select.get(i).getTicket_numbers();
			}
			select_size = total_seat-total_selectTicket;
		}
		
		mv.addObject("ticket", select_size);
		mv.setViewName("drama/drama_ticket");
			
		return mv;
	}
	//Drama_time list
	@RequestMapping(value="dramaTime")
	public ModelAndView drama_time(DramaListDTO dramaListDTO, ModelAndView mv) throws Exception{
		//해당 날짜 공연시간 가져오기
		List<DramaListDTO> ar = dramaService.timeList(dramaListDTO.getDrama_num(), dramaListDTO.getDrama_date());
			
		mv.addObject("time", ar);
		mv.addObject("view", dramaListDTO);
		mv.setViewName("drama/drama_time");
			
		return mv;
	}
	//Drama View
	@RequestMapping(value="dramaview")
	public ModelAndView selectOne(int drama_num , ModelAndView mv,RedirectAttributes rd) throws Exception{
		//공연 정보가져오기
		DramaDTO dramaDTO = dramaService.selectOne(drama_num);
		int file_num = dramaDTO.getFile_num();
		//해당 공연의 날짜 정보 가져오기
		List<DramaListDTO> ar = dramaService.dramaList(drama_num);
		//후기(합계) 숫자 표시
		int totalcount =dramaService.totalcount(drama_num);
		
		 FileDTO fileDTO = dramaService.selectFile(file_num);
		 
		//연극 리뷰 최신꺼 보여주기 안됨 대기
	ReviewDTO selectOne_review= dramaService.selectOne_review(drama_num);
		
		List<ReviewDTO> ar_review = dramaService.selectList_review(drama_num);
		
		if(dramaDTO != null) {
			mv.addObject("view", dramaDTO);
			mv.addObject("list", ar);
			mv.addObject("review", ar_review);
			mv.addObject("total", totalcount); 
			mv.addObject("file", fileDTO);
			/*mv.addObject("reviewOne", selectOne_review);*/
			mv.setViewName("drama/dramaview");
		}else {
			rd.addFlashAttribute("message", "잘못된 접근방식 입니다.");
			mv.setViewName("Redirect:../");
		}
				
		return mv;
	}
	
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
	public ModelAndView selectList_qna( ModelAndView mv , ListData listData, int drama_num)throws Exception{
				System.out.println("drama_num : "+drama_num);
		mv.addObject("drama_num", drama_num);
		mv = dramaService.selectList_qna(listData, drama_num);
		return mv;
						
	}
	//qna list page & write form(Post)
	@RequestMapping(value="qnawrite" , method=RequestMethod.POST)
	public String selectList_qna(HttpSession session , Qna_viewDTO qna_viewDTO , RedirectAttributes rd)throws Exception{
		int result=0;
		
		System.out.println("들어옴");
		System.out.println("drama_num(dto) : "+qna_viewDTO.getDrama_num());
		result = dramaService.qna_insert(qna_viewDTO, session);
		String message="등록실패";
		if(result>0){
			message="등록완료";
		}
		rd.addFlashAttribute("message", message);
		return "redirect:./dramaview?drama_num="+qna_viewDTO.getDrama_num();
					
	}
	//qna reply
	@RequestMapping(value="qnareply" , method=RequestMethod.POST)
	public String qna_reply(HttpSession session , Qna_viewDTO qna_viewDTO) throws Exception{
		int result=0;
		result = dramaService.qna_reply(qna_viewDTO, session);
		
		System.out.println("drama_num:"+qna_viewDTO.getDrama_num());
		
		return "redirect:./dramaview?drama_num="+qna_viewDTO.getDrama_num();
	
	}
	//qna delete 
	@RequestMapping(value="qna_delete")
	public String delete_qnaview(int qna_viewnum ,RedirectAttributes rd , HttpSession session , Qna_viewDTO qna_viewDTO)throws Exception{
		int	result = 0;
		qna_viewDTO = dramaService.delete_drama_num(qna_viewnum);
		result = dramaService.delete_qnaview(qna_viewnum, session);
		System.out.println("qna_viewDTO drama_num:" +qna_viewDTO.getDrama_num());
		String message="삭제 실패";
		if(result>0){
			message="삭제 성공";	
		}
		rd.addFlashAttribute("message", message);
		return "redirect:./dramaview?drama_num="+qna_viewDTO.getDrama_num();
	}
	//공연 리뷰 page
	@RequestMapping(value="dramaReview")
	public ModelAndView dramaReviewList(ModelAndView mv , ListData listData)throws Exception{
		
		mv = dramaService.dramaReviewList(listData);
		return mv;
	}
	//공연 리뷰 selectOne Page
	@RequestMapping(value="dramaReviewview")
		public ModelAndView dramaReviewview(ModelAndView mv, int review_num)throws Exception{
		ReviewDTO reviewDTO= dramaService.review_selectOne(review_num);
		int file_num= reviewDTO.getFile_num();
		FileDTO fileDTO = dramaService.selectFile(file_num);
		mv.addObject("file", fileDTO);
		mv.addObject("selectOne", reviewDTO);
		mv.setViewName("drama/dramaReviewview");
		
		return mv;
	}
	//공연 리뷰 insert-->form 이동
	@RequestMapping(value="dramaReviewwrite" , method=RequestMethod.GET)
	public  ModelAndView dramaReviewwrite(ListData listData)throws Exception{
		
		ModelAndView mv = null;
		mv = dramaService.selectList(listData);
		mv.setViewName("drama/dramaReviewwrite");
		
		return mv;
	}

	
	
	//공연 리뷰 insert-->DB 처리
	@RequestMapping(value="dramaReviewwrite" , method=RequestMethod.POST)
	public String dramaReviewwrite(RedirectAttributes rd , ReviewDTO reviewDTO , HttpSession session , MultipartHttpServletRequest Ms , Model model , DramaDTO dramaDTO)throws Exception{
		int result = 0;
		
		System.out.println("들어옴");
		
		result = dramaService.review_insert(reviewDTO, session, Ms);
	
		model.addAttribute("session", session);
		String message="DB오류.";
			if(result>0){
				message="등록되었습니다.";
			}
				rd.addFlashAttribute("message", message);
		return "redirect:./dramaReview";
	}
	//공연 업데이트(수정) form 이동
	@RequestMapping(value="dramaReviewupdate" , method=RequestMethod.GET)
	public String dramaReviewupdate(ReviewDTO reviewDTO , Model model)throws Exception{
		
		model.addAttribute("dto", reviewDTO);
		return "drama/dramaReviewupdate";
	}
	//공연 삭제
	@RequestMapping(value="dramaReviewdelete")
	public String dramaReviewdelete(int review_num , RedirectAttributes rd) throws Exception{
		int result = 0;
		result = dramaService.review_delete(review_num);
			
		return "redirect:./dramaReview";
	}
	
	//selectList
	@RequestMapping(value="dramaList")
	public ModelAndView selectList(ListData listData) throws Exception {
		ModelAndView mv = null;
		mv = dramaService.selectList(listData);
		mv.setViewName("drama/list");
		
		return mv;
	}//selectList
	@RequestMapping(value="dramaReviewwrite")
	public ModelAndView selectList2(ListData listData) throws Exception {
		System.out.println("컨트롤");
		ModelAndView mv = null;
		mv = dramaService.selectList(listData);
		mv.setViewName("drama/dramaReviewwrite");
		
		return mv;
	}
	
	//insert -> form 이동
	@RequestMapping(value="dramaWrite", method=RequestMethod.GET)
	public String insert(Model model) {
		model.addAttribute("board", "drama");
		
		return "drama/dramaWrite";
	}
	
	//insert -> form 이동
	@RequestMapping(value="chatform", method=RequestMethod.GET)
	public String chatview(Model model) throws Exception {
		model.addAttribute("board", "drama");
			
		return "drama/chatform";
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
