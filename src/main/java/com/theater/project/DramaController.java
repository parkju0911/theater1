package com.theater.project;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.theater.drama.DramaDTO;
import com.theater.drama.DramaListDTO;
import com.theater.drama.DramaService;
import com.theater.drama.SeatDTO;
import com.theater.file.FileDTO;
import com.theater.member.CompanyDTO;
import com.theater.member.MemberService;
import com.theater.qna.Qna_viewDTO;
import com.theater.review.ReviewDTO;
import com.theater.util.ListData;
import com.theater.util.RowNum;

@Controller
@RequestMapping(value="/drama/*")
public class DramaController {
	@Inject
	public DramaService dramaService;
	@Inject
	public MemberService memberService;
	
	
	
@RequestMapping(value="checkCookie", method=RequestMethod.GET)
	public String testCookie(HttpServletResponse response) throws Exception{
	Cookie setCookie = new Cookie("name", URLEncoder.encode("dfdf", "UTF-8")); // 쿠키 생성
/*	Cookie cookie = new Cookie(name, URLEncoder.encode(value, "UTF-8"));*/
	
	setCookie.setMaxAge(60*60*24); // 기간을 하루로 지정
	response.addCookie(setCookie);
return "sss";
	}
	
	@RequestMapping(value="chkRecent", produces = "application/json; charset=utf8", method=RequestMethod.GET)
	@ResponseBody
	public String[] testCookie(HttpServletRequest request) throws Exception{
		Cookie[] getCookie = request.getCookies();
		/*String value = URLDecoder.decode(cookie.getValue(), "UTF-8");
		[출처] 쿠키 값에 한글 값을 세팅하여 넘길시 발생 하는 에러|작성자 제이홀릭*/
		String value="";
		String [] values=null;
			for(int i=0; i<getCookie.length; i++){
				Cookie c = getCookie[i];
				String name = c.getName(); // 쿠키 이름 가져오기
				if(name.equals("title")){
					
					value = URLDecoder.decode(c.getValue(),"UTF-8"); // 쿠키 값 가져오기
					values=value.split(",");
					
				}
			}
			return values;
	}
	
	//리뷰 리스트 , 별점,별점 평균점수
	@RequestMapping(value="reviewlist")
	public ModelAndView review_list(ModelAndView mv , ListData listData , int drama_num)throws Exception{
		mv = dramaService.review_list(listData , drama_num);
		int totalcount = dramaService.totalcount(drama_num);
		int review_avg = dramaService.review_avg(drama_num);
		mv.addObject("total", totalcount);
		mv.addObject("avg", review_avg);
		return mv;
	}
	
	//Select Seat
	@RequestMapping(value="selectSeat")
	public ModelAndView selectSeat(SeatDTO seatDTO,ModelAndView mv) throws Exception{
		//공연 정보 가져오기
		DramaDTO dramaDTO = dramaService.selectOne(seatDTO.getDrama_num());

		//회사명,좌석 수 가져오기
		CompanyDTO companyDTO = memberService.searchCompany(dramaDTO.getCompany_num());
		companyDTO.setName(memberService.searchCompanyName(companyDTO.getId()));
			
		//해당 공연 선택된 좌석 리스트 가져오기
		int date_num= dramaService.search_dateNum(seatDTO.getDrama_num(), seatDTO.getDrama_date().toString(), seatDTO.getDrama_time());
		List<SeatDTO> selectSeatDTO=dramaService.selectSeat(seatDTO.getDrama_num(), date_num);
		int selectSize = selectSeatDTO.size();
		mv.addObject("drama", dramaDTO);
		mv.addObject("company", companyDTO);
		mv.addObject("seat", seatDTO);
		mv.addObject("select", selectSeatDTO);
		mv.addObject("selectSize", selectSize);
		mv.setViewName("drama/selectSeat");
			
		return mv;
	}
	//Drama_ticket
	@RequestMapping("dramaTicket")
	public ModelAndView drama_ticket(DramaListDTO dramaListDTO, ModelAndView mv) throws Exception{
		//해당 날짜의 해당 시간의 남아있는 좌석 수만큼 가져오기
		int total_seat = dramaService.total_seat(dramaListDTO.getDrama_num());
		int date_num = dramaService.search_dateNum(dramaListDTO.getDrama_num(), dramaListDTO.getDrama_date(), dramaListDTO.getDrama_time());
		List<SeatDTO> select = dramaService.selectSeat(dramaListDTO.getDrama_num(), date_num);
			
		int select_size = 0;
		if(date_num != 0) {
			select_size = total_seat-select.size();
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
	public ModelAndView selectOne(int drama_num, ModelAndView mv,RedirectAttributes rd,HttpServletRequest request, HttpServletResponse response) throws Exception{
		//공연 정보가져오기
		DramaDTO dramaDTO = dramaService.selectOne(drama_num);
		//해당 공연의 날짜 정보 가져오기
		List<DramaListDTO> ar = dramaService.dramaList(drama_num);
		
		int totalcount = dramaService.totalcount(drama_num);
		int file_num = dramaDTO.getFile_num();
		FileDTO fileDTO = dramaService.selectFile(file_num);
		mv.addObject("total", totalcount);
		List<ReviewDTO> ar_review = dramaService.selectList_review(drama_num);
		if(dramaDTO != null) {
			
			//중복제거
			String [] strings=null;
			boolean check=true;
			boolean newCheck=true;
			String result="";
			Cookie [] cookies = request.getCookies();
			for (Cookie cookie : cookies) {
				
				if(cookie.getName().equals("title")){
					strings = cookie.getValue().split(",");
					for(String s : strings){
						if(s.equals(String.valueOf(dramaDTO.getDrama_num()))){
							check=false;
						}
					}
					if(check){
						//중복데이터 X
						result=cookie.getValue();
						result=result+","+dramaDTO.getDrama_num();
						Cookie c = new Cookie("title", result);
						response.addCookie(c);
					}
					newCheck=false;
					break;
				
				}
			
				
			}
			
			if(newCheck){
				Cookie c = new Cookie("title", String.valueOf(dramaDTO.getDrama_num()));
				response.addCookie(c);
			}
			//쿠키 파싱후 추가
			//중복제거 끝
			mv.addObject("view", dramaDTO);
			mv.addObject("list", ar);
			mv.addObject("file", fileDTO);
			mv.addObject("review", ar_review);
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
	//qna reply
		@RequestMapping(value="qnareply" , method=RequestMethod.POST)
		public String qna_reply(HttpSession session , Qna_viewDTO qna_viewDTO) throws Exception{
			int result=0;
			result = dramaService.qna_reply(qna_viewDTO, session);
			
	/*		System.out.println("drama_num:"+qna_viewDTO.getDrama_num());*/
			
			return "redirect:./dramaview?drama_num="+qna_viewDTO.getDrama_num();
		
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
					int review_num = reviewDTO.getReview_num();
					ReviewDTO result = dramaService.review_selectOne(review_num);
					System.out.println("file_num:"+reviewDTO.getFile_num());
					model.addAttribute("dto", result);
					return "drama/dramaReviewupdate";
				}
				//공연 업데이트(수정) post
				@RequestMapping(value="dramaReviewupdate" , method=RequestMethod.POST)
				public String dramaReviewupdate(ReviewDTO reviewDTO , ModelAndView mv , MultipartHttpServletRequest Ms , HttpSession session ,RedirectAttributes rd  )throws Exception{
					System.out.println("review_num2: "+reviewDTO.getReview_num());
					int result= dramaService.review_update(reviewDTO , Ms, session);
					
					String message="DB오류.";
					if(result>0){
						message="등록되었습니다.";
					}
						rd.addFlashAttribute("message", message);
					
					return "redirect:./dramaReview";
				}
		//공연 삭제
		@RequestMapping(value="dramaReviewdelete")
		public String dramaReviewdelete(int review_num , RedirectAttributes rd) throws Exception{
			int result = 0;
			result = dramaService.review_delete(review_num);
				
			return "redirect:./dramaReview";
		}
		//selectList
		@RequestMapping(value="dramaReviewwrite")
		public ModelAndView selectList2(ListData listData) throws Exception {
			System.out.println("컨트롤");
			ModelAndView mv = null;
			mv = dramaService.selectList(listData);
			mv.setViewName("drama/dramaReviewwrite");
			
			return mv;
		}
		
		
	//selectList
	@RequestMapping(value="dramaList")
	public ModelAndView selectList(ListData listData, HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		DramaDTO dramaDTO=new DramaDTO();
		FileDTO fileDTO=new FileDTO();
		mv = dramaService.selectList(listData);
		mv.setViewName("drama/list");
		mv.addObject("num", dramaDTO.getDrama_num());
		Cookie [] cookies = request.getCookies();
		List<DramaDTO> ar = new ArrayList<DramaDTO>();
		List<FileDTO> ar1=new ArrayList<FileDTO>();
		for (Cookie cookie : cookies) {
			cookie.setMaxAge(60*60*24);
			if(cookie.getName().equals("title")){
				String [] strings = cookie.getValue().split(",");
				for (String string : strings) {
					
					dramaDTO=dramaService.selectOne(Integer.parseInt(string));
					ar.add(dramaDTO);
					ar1.add(dramaService.fileList(dramaDTO));
				}
			
				mv.addObject("title", ar);
				mv.addObject("fileimage",ar1);
				
				
			}
		}
		
		return mv;
	}
	
	
	//Drama_file list
		@RequestMapping(value="dramaFile")
		public ModelAndView filelist(FileDTO fileDTO, ModelAndView mv) throws Exception{
	
			List<FileDTO> ar =new ArrayList<FileDTO>();
			
				
			mv.addObject("file", ar);
			mv.addObject("view", fileDTO);
			mv.setViewName("drama/drama_file");
			
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
