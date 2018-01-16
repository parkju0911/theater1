package com.theater.qna;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.theater.util.RowNum;

@Repository
public class FaqDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="faqMapper.";
	
	public int insert(FaqDTO faqDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"insert", faqDTO);
	}
	
	public List<FaqDTO> selectList(RowNum rowNum) throws Exception {
		return sqlSession.selectList(NAMESPACE+"selectList", rowNum);
	}
	
	public int totalCount(RowNum rowNum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"totalCount", rowNum);
	}
	
	public FaqDTO selectOne(int num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"selectOne", num);
	}
	
	public int delete(int num) throws Exception {
		return sqlSession.delete(NAMESPACE+"delete", num);
	}
	
	public int update(FaqDTO faqDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"update", faqDTO);
	}
	
}
