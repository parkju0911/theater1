package com.theater.point;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.theater.util.RowNum;

@Repository
public class PointDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "pointMapper.";	 
	
	
	public List<PointDTO> selectList(RowNum rowNum) throws Exception {
		return sqlSession.selectList(namespace+"selectList", rowNum); 
	}
	public PointDTO selectOne(int num) throws Exception{
		return sqlSession.selectOne(namespace+"selectOne", num);	
	}
	
	public int totalCount(RowNum rowNum) throws Exception {
		return sqlSession.selectOne(namespace+"totalCount", rowNum);
	}

	public int updatePoint(PointDTO pointDTO) throws Exception{//포인트 플러스
		return sqlSession.update(namespace+"updatePoint",pointDTO);
		
	}
	public int attendCheck(PointDTO pointDTO) throws Exception{//출석체크
		
		return sqlSession.insert(namespace+"attendCheck",pointDTO);
	}
}
