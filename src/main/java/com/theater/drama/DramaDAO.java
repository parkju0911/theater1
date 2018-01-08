package com.theater.drama;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.theater.member.MemberDTO;
import com.theater.qna.Qna_viewDTO;
import com.theater.review.ReviewDTO;
import com.theater.util.RowNum;

@Repository
public class DramaDAO  {
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="dramaMapper.";
	
	public List<DramaListDTO> timeList(int drama_num, String drama_date) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("drama_num", drama_num);
		map.put("drama_date", drama_date);
		
		return sqlSession.selectList(namespace+"timeList", map);
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
	public ReviewDTO selectOne_review(int drama_num)throws Exception{
		return sqlSession.selectOne(namespace+"selectOne_review", drama_num);
	}
	public int totalcount(int drama_num)throws Exception{
		return sqlSession.selectOne(namespace+"totalcount", drama_num);
	}
	public int totalcount_qna(RowNum rowNum)throws Exception{
		return sqlSession.selectOne(namespace+"totalcount_qna", rowNum);
	}
	public int review_avg(int drama_num)throws Exception{
		return sqlSession.selectOne(namespace+"review_avg", drama_num);
	}
	public List<Qna_viewDTO> selectList_qna(RowNum rowNum)throws Exception{
		return sqlSession.selectList(namespace+"selectList_qna", rowNum);		
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
}
