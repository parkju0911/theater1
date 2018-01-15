package com.theater.qna;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE="faqMapper.";
	
	public int insert(FaqDTO faqDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"insert", faqDTO);
	}
	
}
