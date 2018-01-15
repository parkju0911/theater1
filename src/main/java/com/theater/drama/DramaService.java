package com.theater.drama;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.theater.file.FileDAO;
import com.theater.file.FileDTO;
import com.theater.file.FileListDTO;
import com.theater.member.MemberDTO;
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
	
	/*1-10수정*/
	public int insertBuy(SeatDTO seatDTO, MemberDTO memberDTO) throws Exception{
		seatDTO.setBuy_num(dramaDAO.buyNum());
		seatDTO.setDate_num(dramaDAO.search_dateNum(seatDTO.getDrama_num(), seatDTO.getDrama_date().toString(), seatDTO.getDrama_time()));
		seatDTO.setId(memberDTO.getId());

		return dramaDAO.insertSeat(seatDTO);
	}
	public int search_dateNum(int drama_num, String drama_date, String drama_time) throws Exception{
		return dramaDAO.search_dateNum(drama_num, drama_date, drama_time);
	}
	public List<SeatDTO> selectSeat(int drama_num, int date_num) throws Exception{
		return dramaDAO.selectSeat(drama_num, date_num);
	}
	public DramaDTO selectOne(int drama_num) throws Exception{

		return dramaDAO.selectOne(drama_num);
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
		int totalcount = dramaDAO.totalcount(drama_num);
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
	public ModelAndView review_list(ListData listData)throws Exception{
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(dramaDAO.totalcount_review(rowNum));
		List<ReviewDTO> review = dramaDAO.review_list(rowNum);
		mv.addObject("pager", pager);
		mv.addObject("review", review);
		mv.setViewName("drama/reviewlist");
		return mv;
	}
	//qna write
	public int qna_insert(Qna_viewDTO qna_viewDTO , HttpSession session)throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		qna_viewDTO.setId(memberDTO.getId());
		System.out.println("ID : "+qna_viewDTO.getId());
		System.out.println("drama_num(serviceDTO) : "+qna_viewDTO.getDrama_num());
		System.out.println("contents : "+qna_viewDTO.getContents());
		int result = dramaDAO.qna_insert(qna_viewDTO);
		
		return result;
	}
	//qna_reply
	public int qna_reply(Qna_viewDTO qna_viewDTO , HttpSession session)throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		qna_viewDTO.setId(memberDTO.getId());
		int result = dramaDAO.qna_reply(qna_viewDTO);
		return result;
	}
	//qna 글 삭제
	public int delete_qnaview(int qna_viewnum , HttpSession session)throws Exception{
		int result = dramaDAO.delete_qnaview(qna_viewnum);
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
		
		mv.addObject("pager", pager);
		mv.addObject("review", reviewlist);
		mv.setViewName("drama/dramaReview");
		return mv;
	}
	//공연 리뷰 selectOne
	public ReviewDTO review_selectOne(int review_num)throws Exception{
	
		return dramaDAO.review_selectOne(review_num);
	}
	//공연리뷰 작성(insert)
	@Transactional
	public int review_insert(ReviewDTO reviewDTO ,  HttpSession session , MultipartHttpServletRequest Ms)throws Exception{
		System.out.println("service 앞");
		int file_num = fileDAO.review_file_num();
		System.out.println("insert 뒤");
		int result = dramaDAO.review_insert(reviewDTO);
		
		MultipartFile  file  = Ms.getFile("reviewwrite"); 
		List<FileDTO> names = new ArrayList<FileDTO>();
	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("review_num", reviewDTO.getReview_num());
		map.put("title", reviewDTO.getTitle());
		map.put("contents", reviewDTO.getContents());

			String name = fileSaver.fileSave(file, session, "upload");
			FileDTO fileDTO = new FileDTO();
			fileDTO.setFile_num(reviewDTO.getReview_num());
			fileDTO.setFile_name(name);
			fileDTO.setFile_route(file.getOriginalFilename());
			names.add(fileDTO);
			fileDAO.insert(fileDTO);
		
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
	public int review_update(ReviewDTO reviewDTO)throws Exception{
		int result = dramaDAO.review_update(reviewDTO);
		return result;
	}
	//공연리뷰 삭제
	public int review_delete(int review_num)throws Exception{
		int result = dramaDAO.review_delete(review_num);
		return result;
	}
	
	//광 
	
	
	
	public ModelAndView selectList(ListData listData) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(dramaDAO.totalCount(rowNum));
		List<DramaDTO> ar = dramaDAO.selectList(rowNum);
		
		mv.addObject("list", ar).addObject("pager", pager).addObject("board", "drama");
		
		return mv;
	}

	
	public int insert(DramaDTO dramaDTO, HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
	
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
		
		
		int company_num =  dramaDAO.searchCompany_num(memberDTO);
		dramaDTO.setCompany_num(company_num);
		dramaDTO.setFile_num(file_num);
		int result = dramaDAO.insert(dramaDTO);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("drama_num", dramaDTO.getDrama_num());
		map.put("title", dramaDTO.getTitle());
		map.put("contents", dramaDTO.getContents());
		//((NoticeDTO)boardDTO).setFileNames(names);
		
		return result;
	}


}
