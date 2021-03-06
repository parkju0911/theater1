package com.theater.drama;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.theater.file.FileDAO;
import com.theater.file.FileDTO;
import com.theater.member.MemberDAO;
import com.theater.member.MemberDTO;
import com.theater.point.PointDAO;
import com.theater.point.PointDTO;
import com.theater.qna.Qna_viewDTO;
import com.theater.review.ReviewDTO;
import com.theater.util.FileSaver;
import com.theater.util.ListData;
import com.theater.util.Pager;
import com.theater.util.RowNum;

@Service 
public class DramaService {

	@Inject
	private DramaDAO dramaDAO;
	@Inject
	private FileSaver fileSaver;
	@Inject
	private FileDAO fileDAO;
	@Inject
	private PointDAO pointDAO;
	@Inject
	private MemberDAO memberDAO;
	
	public int member_company_num(String id) throws Exception{
		return dramaDAO.member_company_num(id);
	}
	//dramaViewDelete 관련
		public List<DramaDTO> end_list() throws Exception{
			return dramaDAO.end_list();
		}
		public int viewDelete(DramaDTO dramaDTO) throws Exception{
			return dramaDAO.viewDelete(dramaDTO);
		}
	//orderlist 관련 01-26
	public ModelAndView orderList(MemberDTO memberDTO,ListData listData,ModelAndView mv) throws Exception{
		RowNum rowNum = listData.makeRow();
		int totalCount = dramaDAO.getTotalCount_orderList(memberDTO.getId());
		Pager pager = listData.makePage(totalCount);
		List<OrderListDTO> orderList = dramaDAO.orderList(rowNum, memberDTO.getId());
		mv.addObject("orderList", orderList);
		mv.addObject("pager", pager);
		mv.setViewName("member/orderlist");
		return mv;
	}
	//=============
	/*1-15수정*/
	@Transactional
	public int insertBuy(SeatDTO seatDTO, MemberDTO memberDTO, int price) throws Exception{
		seatDTO.setBuy_num(dramaDAO.buyNum());
		seatDTO.setDate_num(dramaDAO.search_dateNum(seatDTO.getDrama_num(), seatDTO.getDrama_date().toString(), seatDTO.getDrama_time()));
		seatDTO.setId(memberDTO.getId());
		
		int point_num = pointDAO.searchPoint_num();
		int totalPoint = pointDAO.totalPoint(memberDTO.getId());
		//point 테이블 추가
		PointDTO pointDTO = new PointDTO();
		pointDTO.setId(memberDTO.getId());
		pointDTO.setPoint_num(point_num);
		pointDTO.setPoint((int)((price*seatDTO.getTicket_numbers())*0.01));
		pointDTO.setTotal_point(totalPoint);
		int result = pointDAO.insertPoint_seat(pointDTO);
		
		//seat테이블에 추가
		seatDTO.setPoint_num(point_num);
		result = dramaDAO.insertSeat(seatDTO);
		return result;
	}
	public int search_dateNum(int drama_num, String drama_date, String drama_time) throws Exception{
		return dramaDAO.search_dateNum(drama_num, drama_date, drama_time);
	}
	public List<String> selectSeat(int drama_num, int date_num) throws Exception{
		List<SeatDTO> StringSeat = dramaDAO.selectSeat(drama_num, date_num);
		List<String> parsingSeat = new ArrayList<String>();
		for(SeatDTO seatDTO : StringSeat) {
			StringTokenizer st = new StringTokenizer(seatDTO.getSelect_seat(), ",");
			while(st.hasMoreTokens()) {
				String parsing = st.nextToken();
				parsingSeat.add(parsing);
			}
		}
		return parsingSeat;
	}
	public DramaDTO selectOne(int num) throws Exception{
		/*dramaDAO.hitUpdate(num);*/
		DramaDTO dramaDTO = dramaDAO.selectOne(num);
		return dramaDTO;
	}
	public DramaDTO selectOne_view(int drama_num)throws Exception{
		DramaDTO dramaDTO = dramaDAO.selectOne(drama_num);
		return dramaDTO;
		
	}
	public FileDTO selectFile(int file_num)throws Exception{
		return dramaDAO.selectFile(file_num);
	}
	public FileDTO fileList(int file_num) throws Exception{
		return dramaDAO.fileList(file_num);
	}

	
	public List<DramaListDTO> timeList(int drama_num, String drama_date) throws Exception{
		return dramaDAO.timeList(drama_num, drama_date);
	}
	public List<DramaListDTO> dramaList(int drama_num) throws Exception{
		return dramaDAO.dateList(drama_num);
	}
	public int total_seat(int drama_num) throws Exception{
		int company_num = dramaDAO.searchCompany_num(drama_num);
		
		return dramaDAO.total_seat(company_num);
	}
	// 리뷰 3개만 보여지는 리스트
	public List<ReviewDTO> selectList_review(int drama_num)throws Exception{
		List<ReviewDTO> ar_review = dramaDAO.selectList_review(drama_num);
		
		return ar_review;
	}
	//연극 리뷰 view(해당 drama에 최신 리뷰 하나만 보여준다. 안되서 일단 대기)
	public ReviewDTO selectOne_review(int drama_num)throws Exception{
		
		return  dramaDAO.selectOne_review(drama_num);
	}
	//리뷰 수 합산
	public int totalcount(int drama_num)throws Exception{
		int totalcount = dramaDAO.totalcount_page(drama_num);
		return totalcount;
	}
	//리스트
	public int totalcount_list(RowNum rowNum)throws Exception{
		int totalcount = dramaDAO.totalcount_list(rowNum);
		return totalcount;
	}
	//리뷰 평점 계산
	public int review_avg(int drama_num)throws Exception{
		int totalstar = dramaDAO.review_avg(drama_num);
		return totalstar;
	}
	//qna 리스트
	public ModelAndView selectList_qna(ListData listData, int drama_num)throws Exception{
		ModelAndView model = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(dramaDAO.totalcount_qna(rowNum));
		List<Qna_viewDTO> qnalist = dramaDAO.selectList_qna(rowNum);
		model.addObject("pager", pager);
		model.addObject("qnalist", qnalist);
		model.setViewName("drama/qnalist");
		model.addObject("drama_num", drama_num);
		
		return model;
	}
	//리뷰 전체보기(별점 리스트)
	public ModelAndView review_list(ListData listData , int drama_num)throws Exception{
		ModelAndView mv = new ModelAndView();
	/*	listData.ListData2();*/
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(dramaDAO.totalcount_review(rowNum));
		List<ReviewDTO> review = dramaDAO.review_list(rowNum);
		mv.addObject("pager", pager);
		mv.addObject("review", review);
		mv.addObject("drama_num", drama_num);
		mv.setViewName("drama/reviewlist");
		return mv;
	}
	//qna write
		public int qna_insert(Qna_viewDTO qna_viewDTO , HttpSession session)throws Exception{
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			qna_viewDTO.setId(memberDTO.getId());
		/*	System.out.println("ID : "+qna_viewDTO.getId());
			System.out.println("drama_num(serviceDTO) : "+qna_viewDTO.getDrama_num());
			System.out.println("contents : "+qna_viewDTO.getContents());*/
			int result = dramaDAO.qna_insert(qna_viewDTO);
			
			return result;
		}
	//qna 글 삭제
	public int delete_qnaview(int qna_viewnum , HttpSession session)throws Exception{
		int result = dramaDAO.delete_qnaview(qna_viewnum);
		return result;
	}
	//qna_reply
		public int qna_reply(Qna_viewDTO qna_viewDTO , HttpSession session)throws Exception{
			String contents = qna_viewDTO.getContents();
			int qna_viewnum =qna_viewDTO.getQna_viewnum();
			qna_viewDTO =dramaDAO.selectOne_qna(qna_viewnum);
		
			qna_viewDTO.setRef(qna_viewnum);
			qna_viewDTO.setContents(contents);
			qna_viewDTO.setDepth(qna_viewDTO.getDepth());
			
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			qna_viewDTO.setId(memberDTO.getId());
		
			
			int result = dramaDAO.qna_reply(qna_viewDTO);
			return result;
		}
		//qna_reply step update
		public int stepUpdate(Qna_viewDTO qna_viewDTO)throws Exception{
			int result = dramaDAO.stepUpdate(qna_viewDTO);
			return result;
		}
		//qna 글 삭제시 redirect drama_num 보내줌
		public Qna_viewDTO delete_drama_num(int qna_viewnum)throws Exception{
			Qna_viewDTO qna_viewDTO = dramaDAO.delete_drama_num(qna_viewnum);
			return qna_viewDTO;
		}
	//공연 리뷰List page
	public ModelAndView dramaReviewList(ListData listData)throws Exception{
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(dramaDAO.totalcount_review(rowNum));
		List<ReviewDTO> reviewlist = dramaDAO.dramaReviewList(rowNum);
		List<FileDTO> file = new ArrayList<FileDTO>();
		List<DramaDTO> title=new ArrayList<DramaDTO>();
	
		for(ReviewDTO reviewDTO: reviewlist){
			int drama_num = reviewDTO.getDrama_num();
			DramaDTO dramaDTO = dramaDAO.drama_title(drama_num);
			
			FileDTO fileDTO = dramaDAO.fileList(reviewDTO.getFile_num());
			file.add(fileDTO);
			title.add(dramaDTO);
			
		}
		mv.addObject("pager", pager);
		mv.addObject("review", reviewlist);
		mv.setViewName("drama/dramaReview");
		mv.addObject("file", file);
		mv.addObject("title", title);
		return mv;
	}
	//공연 리뷰 selectOne
	public ReviewDTO review_selectOne(int review_num)throws Exception{
	
		return dramaDAO.review_selectOne(review_num);
	}

	//공연리뷰 작성(insert)
	@Transactional
	public int review_insert(ReviewDTO reviewDTO ,  HttpSession session , MultipartHttpServletRequest Ms)throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		reviewDTO.setId(memberDTO.getId());
		System.out.println("ID:"+reviewDTO.getId());
		
		MultipartFile  file  = Ms.getFile("files"); 
		
		if(file.isEmpty()){
			reviewDTO.setFile_num(reviewDTO.getFile_num());
		}else{
		
			int file_num = dramaDAO.review_file_num(reviewDTO);
			
			reviewDTO.setFile_num(file_num);
		
		List<FileDTO> names = new ArrayList<FileDTO>();
	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("review_num", reviewDTO.getReview_num());
		map.put("title", reviewDTO.getTitle());
		map.put("contents", reviewDTO.getContents());

			String name = fileSaver.fileSave(file, session, "upload");
			System.out.println(name);
			FileDTO fileDTO = new FileDTO();
			fileDTO.setFile_num(file_num);
			fileDTO.setFile_name(name);
			fileDTO.setFile_route(file.getOriginalFilename());
			names.add(fileDTO);
			fileDAO.insert(fileDTO);
		}
			int result = dramaDAO.review_insert(reviewDTO);
			
		return result;
	}
	/*//공연리뷰 작성시 drama select
	public ModelAndView review_insert_select()throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<DramaDTO> ar = dramaDAO.review_insert_select();
		mv.addObject("dramalist", ar);
		return mv;
	}*/
	//공연리뷰 수정
		public int review_update(ReviewDTO reviewDTO , MultipartHttpServletRequest Ms , HttpSession session)throws Exception{
			MemberDTO memberDTO =  (MemberDTO)session.getAttribute("member");
			
			MultipartFile  file  = Ms.getFile("files"); 
			if(file.isEmpty()){
				reviewDTO=dramaDAO.review_selectOne(reviewDTO.getReview_num());
				reviewDTO.setFile_num(reviewDTO.getFile_num());
				System.out.println("file_num 파일값이 널일때"+reviewDTO.getFile_num());
			}else{
				System.out.println("reviewDTO.getreview_num:"+reviewDTO.getReview_num());
				int file_num = dramaDAO.review_file_num(reviewDTO);
				System.out.println("file_num:"+file_num);
			
			List<FileDTO> names = new ArrayList<FileDTO>();
			System.out.println("names: 이후");
		
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("review_num", reviewDTO.getReview_num());
			map.put("title", reviewDTO.getTitle());
			map.put("contents", reviewDTO.getContents());
			
				reviewDTO.setFile_num(file_num);
				System.out.println("reviewDTO.setfilenum:"+reviewDTO.getFile_num());
				String name = fileSaver.fileSave(file, session, "upload");
			
				System.out.println("name"+name);
				FileDTO fileDTO = new FileDTO();
				fileDTO.setFile_num(file_num);
				fileDTO.setFile_name(name);
				fileDTO.setFile_route(file.getOriginalFilename());
				System.out.println("여기");
				names.add(fileDTO);
				System.out.println("names:"+names);
				
				fileDAO.insert(fileDTO);
			}
				int result = dramaDAO.review_update(reviewDTO);
			
			return result;
		
		}
	//공연리뷰 삭제
	public int review_delete(int review_num)throws Exception{
		int result = dramaDAO.review_delete(review_num);
		return result;
	}
	

	//광 
	
	
	public FileDTO fileList(DramaDTO dramaDTO) throws Exception {
	
		return dramaDAO.fileList(dramaDTO.getFile_num());
	}
	
	public ModelAndView selectList(ListData listData) throws Exception {
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		int totalCount = dramaDAO.totalcount_list(rowNum);
		Pager pager = listData.makePage(totalCount);
		List<DramaDTO> ar = dramaDAO.selectList(rowNum);
		List<FileDTO> file=new ArrayList<FileDTO>();
		for(DramaDTO dramaDTO: ar){
			dramaDTO.setBuy_hit(dramaDAO.searchBuy_hit(dramaDTO.getDrama_num()));
			FileDTO fileDTO=dramaDAO.fileList(dramaDTO.getFile_num());
			file.add(fileDTO);
		}
		List<FileDTO> file1=new ArrayList<FileDTO>();
		for(DramaDTO dramaDTO: ar){
			FileDTO fileDTO=dramaDAO.fileList(dramaDTO.getFile_num());
			file1.add(fileDTO);
		}
		mv.addObject("file",file);
		
		mv.addObject("list", ar).addObject("pager", pager).addObject("board", "drama").addObject("file", file).addObject("file1",file1);
		
		return mv;
	}
	//공연 insert시 공연 제목 선택
	public ModelAndView selectList_write_title(ListData listData) throws Exception {
		ModelAndView mv = new ModelAndView();
		listData.ListData2();
		RowNum rowNum = listData.makeRow();
		int totalCount = dramaDAO.totalcount_list(rowNum);
		Pager pager = listData.makePage(totalCount);
		List<DramaDTO> ar = dramaDAO.selectList(rowNum);
		List<FileDTO> file=new ArrayList<FileDTO>();
		for(DramaDTO dramaDTO: ar){
			FileDTO fileDTO=dramaDAO.fileList(dramaDTO.getFile_num());
			file.add(fileDTO);
		}
		List<FileDTO> file1=new ArrayList<FileDTO>();
		for(DramaDTO dramaDTO: ar){
			FileDTO fileDTO=dramaDAO.fileList(dramaDTO.getFile_num());
			file1.add(fileDTO);
		}
		mv.addObject("file1",file1);
		
	
		mv.addObject("list", dramaDAO.selectList(rowNum)).addObject("pager", pager).addObject("board", "drama").addObject("file", file).addObject("file1",file1);
		
		return mv;
	}
	
	@Transactional
	public int update(DramaDTO dramaDTO,HttpSession session, List<Date> dateArr, String time, MemberDTO memberDTO) throws Exception{
		int result = 0;
		//문자열을 배열로 파싱하기
		List<String> timeArr = new ArrayList<String>();
		StringTokenizer st = new StringTokenizer(time, ",");
		
		while(st.hasMoreTokens()) {
			String token = st.nextToken();
			timeArr.add(token);
		}
		
		DramaDTO beforeDTO = dramaDAO.selectOne(dramaDTO.getDrama_num());
		//file 테이블 값 변경하기
		MultipartFile[] files =((DramaDTO)dramaDTO).getFiles();
		
		for (MultipartFile multipartFile : files) {
			String name = fileSaver.fileSave(multipartFile, session, "upload");
			FileDTO fileDTO = new FileDTO();
			fileDTO.setFile_num(beforeDTO.getFile_num()); // 먼저 noticeDAO.insert(boardDTO); 했긴 때문에 가능
			fileDTO.setFile_name(name);
			fileDTO.setFile_route(multipartFile.getOriginalFilename());
			fileDAO.update(fileDTO);
		}
		//drama 테이블 값 변경하기
		result = dramaDAO.update(dramaDTO);
		//date_list 값 변경하기
		List<DramaListDTO> beforeList = dramaDAO.search_dateList(dramaDTO.getDrama_num());
	
		int totalSize = dateArr.size()*timeArr.size();
		if(totalSize<beforeList.size()) {
			int gap = beforeList.size()-totalSize;
			for(int i=0; i<gap; i++) {
				dramaDAO.delete_dateList(beforeList.get(i).getDate_num());
			}
			
			for(int i=0; i<dateArr.size(); i++) {
				for(int j=0; j<timeArr.size(); j++) {
					result = dramaDAO.update_dateList(beforeList.get(gap).getDate_num(),dramaDTO.getDrama_num(), dateArr.get(i), timeArr.get(j));
					gap++;
				}
			}
				
		}else {
			if(totalSize>beforeList.size()) {
				//새로 업데이트할 내용이 더 많을 경우
				int gap=0;
				for(int i=0; i<dateArr.size(); i++) {
					for(int j=0; j<timeArr.size(); j++) {
						if(gap>=beforeList.size()) {
							result = dramaDAO.insert_dateList(dramaDTO.getDrama_num(), dateArr.get(i), timeArr.get(j));
						}else {
							result = dramaDAO.update_dateList(beforeList.get(gap).getDate_num(),dramaDTO.getDrama_num(), dateArr.get(i), timeArr.get(j));
							gap++;
						}
					}
				}
			}else {
				int gap=0;
				for(int i=0; i<dateArr.size(); i++) {
					for(int j=0; j<timeArr.size(); j++) {
						result = dramaDAO.update_dateList(beforeList.get(gap).getDate_num(),dramaDTO.getDrama_num(), dateArr.get(i), timeArr.get(j));
						gap++;
					}
				}
			}
		}
		return result;
	}
	
	
	@Transactional
	public int insert(DramaDTO dramaDTO, HttpSession session, List<Date> dateArr, String time, MemberDTO memberDTO) throws Exception {
		int result = 0;
		//문자열을 배열로 파싱하기
		List<String> timeArr = new ArrayList<String>();
		StringTokenizer st = new StringTokenizer(time, ",");
		
		while(st.hasMoreTokens()) {
			String token = st.nextToken();
			timeArr.add(token);
		}
		//drama_num 구하기
		int drama_num = dramaDAO.nextDramaNum();
		//file 테이블에 값 넣기
		MultipartFile[] files =((DramaDTO)dramaDTO).getFiles();
		
		System.out.println("NUM: "+ dramaDTO.getDrama_num());
		int file_num = fileDAO.searchFile_num();
		//저장 1. 저장경로 - realpath
		//List<FileDTO> names = new ArrayList<FileDTO>();
		for (MultipartFile multipartFile : files) {
			String name = fileSaver.fileSave(multipartFile, session, "upload");
			FileDTO fileDTO = new FileDTO();
			fileDTO.setFile_num(file_num); // 먼저 noticeDAO.insert(boardDTO); 했긴 때문에 가능
			fileDTO.setFile_name(name);
			fileDTO.setFile_route(multipartFile.getOriginalFilename());
			//names.add(fileDTO);
			fileDAO.insert(fileDTO);
		}
		
		//drama 테이블에 값 넣기
		int company_num = memberDAO.searchCompany_num(memberDTO.getId());
		dramaDTO.setDrama_num(drama_num);
		dramaDTO.setCompany_num(company_num);
		dramaDTO.setFile_num(file_num);
		result = dramaDAO.insert(dramaDTO);
		
		//date_list에 값 넣기
		for(int i=0; i<dateArr.size(); i++) {
			for(int j=0; j<timeArr.size(); j++) {
				result = dramaDAO.insert_dateList(drama_num, dateArr.get(i), timeArr.get(j));
			}
		}
		return result;
	}
	
	//예매순위
		public ModelAndView rank_List(ListData listData) throws Exception {	
			ModelAndView mv = new ModelAndView();
			RowNum rowNum = listData.makeRow();
			Pager pager = listData.makePage(dramaDAO.totalcount_review(rowNum));
			List<DramaDTO> ranklist = dramaDAO.rank_List(rowNum);
			List<Integer> arg = new ArrayList<Integer>();
			List<Integer>tot=new ArrayList<Integer>();
			 List<FileDTO> file = new ArrayList<FileDTO>();
			  for(DramaDTO dramaDTO: ranklist){
			         FileDTO fileDTO = dramaDAO.fileList(dramaDTO.getFile_num());
			         file.add(fileDTO);
			         System.out.println(dramaDTO.getDrama_num());
			         Integer review_avg = dramaDAO.review_avg(dramaDTO.getDrama_num());
			         if(review_avg==null){
			        	 review_avg=0;
			         }
			         System.out.println("review_avg"+review_avg);
			         arg.add(review_avg);
			         int totalcount = dramaDAO.review_totalcount(dramaDTO.getDrama_num());
			         tot.add(totalcount);
			      }
		mv.addObject("total2",tot);
			mv.addObject("avg2",arg);
			mv.addObject("pager", pager);
			mv.addObject("rank", ranklist);
			mv.setViewName("drama/rankList");
			 mv.addObject("file", file);
			return mv;
			
		
	}
		 

}
