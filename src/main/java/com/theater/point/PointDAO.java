package com.theater.point;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.theater.util.RowNum;

@Repository
public class PointDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "pointMapper.";	 
	
	
	public List<PointDTO> selectList(String id,RowNum rowNum) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("rowNum",rowNum);
		map.put("startRow",rowNum.getStartRow());
		map.put("lastRow",rowNum.getLastRow());
		
		return sqlSession.selectList(namespace+"selectList", map); 
	}
/*	public PointDTO selectOne(int num) throws Exception{
		return sqlSession.selectOne(namespace+"selectOne", num);	
	}*/
	
	public int totalCount(RowNum rowNum) throws Exception {
		return sqlSession.selectOne(namespace+"totalCount", rowNum);
	}

	public int updatePoint(PointDTO pointDTO) throws Exception{//포인트 플러스
		return sqlSession.update(namespace+"updatePoint",pointDTO);
		
	}
	public int attendCheck(PointDTO pointDTO,String id) throws Exception{//출석체크
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("total_point",pointDTO.getTotal_point());
		return sqlSession.insert(namespace+"pointcheck",map);
	}
	public int usePoint(PointDTO pointDTO)throws Exception{
		
		return sqlSession.update(namespace+"usePoint", pointDTO);
	}
	public int insert(PointDTO pointDTO) throws Exception{
		
		return sqlSession.insert(namespace+"insert",pointDTO);
	}
	
}
