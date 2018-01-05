package com.theater.drama;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.theater.file.FileDAO;
import com.theater.file.FileDTO;
import com.theater.qna.QnaDTO;
import com.theater.qna.Qna_viewDTO;
import com.theater.review.ReviewDTO;
import com.theater.util.FileSaver;
import com.theater.util.ListData;
import com.theater.util.Pager;
import com.theater.util.RowNum;

@Service 
//@Transactional
public class DramaService {

	@Inject
	private DramaDAO dramaDAO;
	@Inject
	private FileSaver fileSaver;
	@Inject
	private FileDAO fileDAO;
	//영광
	//연극 리스트에서 view page 이동시
	public DramaDTO selectOne(int drama_num) throws Exception{
		return dramaDAO.selectOne(drama_num);
	}
	//연극 날짜 정하기
	public List<DramaListDTO> dramaList(int drama_num) throws Exception{
		return dramaDAO.dateList(drama_num);
	}
	//티켓 판매수량(좌석수)
	public int ticket_sell(int drama_num) throws Exception{
		int company_num = dramaDAO.searchCompany_num(drama_num);
		
		return dramaDAO.ticket_sell(company_num);
	}
	// 리뷰 3개만 보여지는 리스트
	public List<ReviewDTO> selectList_review(int drama_num)throws Exception{
		List<ReviewDTO> ar_review = dramaDAO.selectList_review(drama_num);
		
		return ar_review;
	}
	//티켓 리뷰 view(예정)
	public ReviewDTO selectOne_review(int drama_num)throws Exception{
		ReviewDTO reviewDTO = dramaDAO.selectOne_review(drama_num);
		return reviewDTO;
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
	public ModelAndView selectList_qna(ListData listData)throws Exception{
		ModelAndView model = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(dramaDAO.totalcount_qna(rowNum));
		List<Qna_viewDTO> qnalist = dramaDAO.selectList_qna(rowNum);
		model.addObject("pager", pager);
		model.addObject("qnalist", qnalist);
		model.setViewName("drama/qnalist");
		
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
		int result = dramaDAO.qna_insert(qna_viewDTO);
		
		return result;
	}
	//qna 글 삭제
	public int delete_qnaview(int qna_viewnum , HttpSession session)throws Exception{
		int result = dramaDAO.delete_qnaview(qna_viewnum);
		return result;
	}
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
		int result = dramaDAO.insert(dramaDTO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("drama_num", dramaDTO.getDrama_num());
		map.put("title", dramaDTO.getTitle());
		map.put("contents", dramaDTO.getContents());
		
	
		
		MultipartFile[] files =((DramaDTO)dramaDTO).getFiles();
		
		System.out.println("NUM: "+ dramaDTO.getDrama_num());
		
		//저장 1. 저장경로 - realpath
		//List<FileDTO> names = new ArrayList<FileDTO>();
		for (MultipartFile multipartFile : files) {
			String name = fileSaver.fileSave(multipartFile, session, "upload");
			FileDTO fileDTO = new FileDTO();
			fileDTO.setFile_num(dramaDTO.getDrama_num()); // 먼저 noticeDAO.insert(boardDTO); 했긴 때문에 가능
			fileDTO.setFile_name(name);
			fileDTO.setFile_route(multipartFile.getOriginalFilename());
			//names.add(fileDTO);
			fileDAO.insert(fileDTO);
		}
		//((NoticeDTO)boardDTO).setFileNames(names);
		
		return result;
	}


}
