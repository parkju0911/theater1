package com.theater.drama;


import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.theater.file.FileDTO;
import com.theater.member.MemberDTO;
import com.theater.qna.Qna_viewDTO;
import com.theater.review.ReviewDTO;
import com.theater.util.RowNum;

@Repository
public class DramaDAO  {
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="dramaMapper.";
	
	//dramaWrite 관련 1-24
		public int delete_dateList(int date_num) throws Exception{
			return sqlSession.delete(namespace+"delete_dateList", date_num);
		}
		public List<DramaListDTO> search_dateList(int drama_num) throws Exception{
			return sqlSession.selectList(namespace+"search_dateList", drama_num);
		}
		
	
		
		public int update_dateList(int date_num, int drama_num, Date drama_date, String drama_time) throws Exception{
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("drama_num", drama_num);
			map.put("drama_date", drama_date);
			map.put("drama_time", drama_time);
			map.put("date_num", date_num);
			
			return sqlSession.insert(namespace+"date_update", map);
		}
		public int update(DramaDTO dramaDTO) throws Exception{
			return sqlSession.update(namespace+"update", dramaDTO);
		}
		public int nextDramaNum() throws Exception{
			return sqlSession.selectOne(namespace+"nextDramaNum");
		}
			
		public int insert_dateList(int drama_num, Date drama_date, String drama_time) throws Exception{
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("drama_num", drama_num);
			map.put("drama_date", drama_date);
			map.put("drama_time", drama_time);
				
			return sqlSession.insert(namespace+"date_insert", map);
		}
		//------------------

	//orderlist 관련 1-26
	public int getTotalCount_orderList(String id) throws Exception{
		return sqlSession.selectOne(namespace+"getTotalCount_orderList", id);
	}
	public List<OrderListDTO> orderList(RowNum rowNum, String id) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("startRow", rowNum.getStartRow());
		map.put("lastRow", rowNum.getLastRow());
					
		List<OrderListDTO> orderList = sqlSession.selectList(namespace+"orderList", map);
					
		List<OrderListDTO> ar = new ArrayList<OrderListDTO>();
					
		for(OrderListDTO orderListDTO : orderList) {
			orderListDTO = sqlSession.selectOne(namespace+"orderListOne", orderListDTO);
			String file_name = sqlSession.selectOne(namespace+"orderFileName", orderListDTO.getFile_num());
			orderListDTO.setFile_name(file_name);

			ar.add(orderListDTO);
		}
					
		return ar;
	}
	//seat페이지 DB관련 01-10수정
	public int buyNum() throws Exception{
		return sqlSession.selectOne(namespace+"buyNum");
	}

	public int insertSeat(SeatDTO seatDTO) throws Exception{
		return sqlSession.insert(namespace+"insertSeat", seatDTO);
	}
	//-------------------------------

	public List<DramaListDTO> timeList(int drama_num, String drama_date) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("drama_num", drama_num);
		map.put("drama_date", drama_date);

		return sqlSession.selectList(namespace+"timeList", map);
	}
	
	public FileDTO fileList(int file_num) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("file_num", file_num);


		return sqlSession.selectOne(namespace+"fileList", map);
	}

	public int total_seat(int company_num) throws Exception{
		return sqlSession.selectOne(namespace+"total_seat", company_num);
	}
	public int search_dateNum(int drama_num,String drama_date, String drama_time) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("drama_num", drama_num);
		map.put("drama_date", drama_date);
		map.put("drama_time", drama_time);

		int dateNum = 0;
		try {
			dateNum= sqlSession.selectOne(namespace+"search_dateNum", map);
		}catch(Exception e) {
			dateNum = 0;
		}
		return dateNum;
	}
	public List<SeatDTO> selectSeat(int drama_num, int date_num) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("drama_num", drama_num);
		map.put("date_num", date_num);

		return sqlSession.selectList(namespace+"selectSeat", map);
	}
	public DramaDTO selectOne(int drama_num)throws Exception{
		return sqlSession.selectOne(namespace+"selectOne" , drama_num);

	}
	public List<DramaListDTO> dateList(int drama_num)throws Exception{

		return sqlSession.selectList(namespace+"dateList", drama_num);
	}
	public int searchCompany_num(int drama_num) throws Exception{
		return sqlSession.selectOne(namespace+"searchCompany_num", drama_num);
	}
	
	public int searchBuy_hit(int num) throws Exception{
		return sqlSession.selectOne(namespace+"searchBuy_hit", num);
	}
	
	public int searchCompany_num(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(namespace+"searchCompanyNum", memberDTO);
	}

	public int searchFile_num(DramaDTO dramaDTO) throws Exception{
		return sqlSession.selectOne(namespace+"searchFileNum", dramaDTO);
	}


	public int ticket_sell(int company_num)throws Exception{
		return sqlSession.selectOne(namespace+"ticket_sell", company_num);
	}  

	public List<DramaDTO> selectList(RowNum rowNum) throws Exception {
		Map<String, Object>  map = new HashMap<String, Object>();
		map.put("startRow", rowNum.getStartRow());
		map.put("lastRow", rowNum.getLastRow());
		map.put("kind", rowNum.getKind());
		map.put("search", rowNum.getSearch());

		return sqlSession.selectList(namespace+ "selectList", map);
	}
	public List<DramaDTO> selectList_write_title(RowNum rowNum) throws Exception {
		Map<String, Object>  map = new HashMap<String, Object>();
		map.put("startRow", rowNum.getStartRow());
		map.put("lastRow", rowNum.getLastRow());
		map.put("kind", rowNum.getKind());
		map.put("search", rowNum.getSearch());

		return sqlSession.selectList(namespace+ "selectList", map);
	}
	public DramaDTO drama_title(int drama_num) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("drama_num", drama_num);

		return sqlSession.selectOne(namespace+ "drama_title", map);
	}
	//안되서 일단 리스트로 해놓음 변경할것
	public ReviewDTO selectOne_review(int drama_num)throws Exception{
		return sqlSession.selectOne(namespace+"selectOne_review", drama_num);
	}

	public int totalCount(RowNum rowNum) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kind", "title");
		map.put("search", "%title%");

		return sqlSession.selectOne(namespace+"totalCount", map);
	}
	public int insert(DramaDTO dramaDTO) throws Exception {
		System.out.println("Before: "+dramaDTO.getDrama_num());
		int result = sqlSession.insert(namespace+"insert", dramaDTO);
		System.out.println("After: "+dramaDTO.getDrama_num());
		return result;
	}
	public List<ReviewDTO> selectList_review(int drama_num)throws Exception{
		return sqlSession.selectList(namespace+"selectList_review", drama_num);
	}
	public int totalcount_list(RowNum rowNum)throws Exception{
		return sqlSession.selectOne(namespace+"totalcount_list", rowNum);
	}
	public int totalcount(int buy_num)throws Exception{
		return sqlSession.selectOne(namespace+"totalcount", buy_num);
	}
	public int totalcount_qna(RowNum rowNum)throws Exception{
		return sqlSession.selectOne(namespace+"totalcount_qna", rowNum);
	}
	public Integer review_avg(int drama_num)throws Exception{
	
		return sqlSession.selectOne(namespace+"review_avg", drama_num);
	}
	public List<Qna_viewDTO> selectList_qna(RowNum rowNum)throws Exception{
		return sqlSession.selectList(namespace+"selectList_qna", rowNum);		
	}
	public Qna_viewDTO selectOne_qna(int qna_viewnum)throws Exception{
		return sqlSession.selectOne(namespace+"selectOne_qna", qna_viewnum);
	}
	public List<ReviewDTO> review_list(RowNum rowNum)throws Exception{
		return sqlSession.selectList(namespace+"review_list", rowNum);
	}
	/*	public int total_review(RowNum rowNum)throws Exception{
		return sqlSession.selectOne(namespace+"total_review", rowNum);
	}*/
	public int totalcount_review(RowNum rowNum)throws Exception{
		return sqlSession.selectOne(namespace+"totalcount_review", rowNum);
	}
	public int qna_insert(Qna_viewDTO qna_viewDTO)throws Exception{
		return sqlSession.insert(namespace+"qna_insert", qna_viewDTO);
	}
	public int delete_qnaview(int qna_viewnum)throws Exception{
		return sqlSession.delete(namespace+"delete_qnaview", qna_viewnum);
	}
	public List<ReviewDTO>dramaReviewList(RowNum rowNum)throws Exception{
		return sqlSession.selectList(namespace+"dramaReviewList", rowNum);
	}

/*	public int hitUpdate(int num) throws Exception {
		return sqlSession.update(namespace+"hitUpdate", num);
	}*/
	
	public ReviewDTO review_selectOne(int review_num)throws Exception{
		return sqlSession.selectOne(namespace+"review_selectOne", review_num);
	}
	public int totalcount_page(int drama_num)throws Exception{
		return sqlSession.selectOne(namespace+"totalcount_page", drama_num);
	}
	//dramaview page qna_delete(qna_viewnum을 넘겨줘야 redirect로 page 이동
		public Qna_viewDTO delete_drama_num(int qna_viewnum)throws Exception{
			return sqlSession.selectOne(namespace+"delete_drama_num", qna_viewnum);
		}

		//dramaview page qna_reply
		public int qna_reply(Qna_viewDTO qna_viewDTO)throws Exception{
			return sqlSession.insert(namespace+"qna_reply", qna_viewDTO);
		}
		//dramaview page qna_reply step update
		public int stepUpdate(Qna_viewDTO qna_viewDTO)throws Exception{
			return sqlSession.update(namespace+"stepUpdate", qna_viewDTO);
		}
		//연극리뷰 작성
		public int review_insert(ReviewDTO reviewDTO)throws Exception{
			int result = sqlSession.insert(namespace+"review_insert", reviewDTO);
			return result;
		}
/*	public List<DramaDTO> review_insert_select()throws Exception{
		
		return sqlSession.selectList(namespace+"review_insert");
	}*/
		//연극리뷰 이미지 번호
		public int review_file_num(ReviewDTO reviewDTO)throws Exception{
			return sqlSession.selectOne(namespace+"review_file_num", reviewDTO);
		}
		//연극리뷰 업데이트(수정)
		public int review_update(ReviewDTO reviewDTO)throws Exception{
			return sqlSession.update(namespace+"review_update", reviewDTO);
		}
		//연극리뷰 삭제
		public int review_delete(int review_num)throws Exception{
			return sqlSession.delete(namespace+"review_delete", review_num);
		}

		//drama selectOne 파일 가져오기
		public FileDTO selectFile(int file_num)throws Exception{
			return sqlSession.selectOne(namespace+"selectFile", file_num);
		}
		
	
		
		public List<DramaDTO> rank_List(RowNum rowNum)throws Exception{
			return sqlSession.selectList(namespace+"rankList", rowNum);	
		}
		public int review_totalcount(int drama_num)throws Exception{
			return sqlSession.selectOne(namespace+"review_totalcount",drama_num);
		}
		
}
