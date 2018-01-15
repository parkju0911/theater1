package com.theater.point;

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
	
	//selectSeat 관련하여 01-15
	public int searchPoint_num() throws Exception{
		return sqlSession.selectOne(namespace+"searchPoint_num");
	}
	public int totalPoint(String id) throws Exception{
		List<PointDTO> pointList = sqlSession.selectList(namespace+"totalPointList", id);
		int totalPoint = 0;
		if(pointList.size()!=0) {
			totalPoint = pointList.get(0).getTotal_point();
		}
			
		return totalPoint;
	}
	public int insertPoint_seat(PointDTO pointDTO) throws Exception{
		return sqlSession.insert(namespace+"insertPoint_seat", pointDTO);
	}
	//-------------------------------
	public List<PointDTO> selectList(RowNum rowNum) throws Exception {
		return sqlSession.selectList(namespace+"selectList", rowNum); 
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
	public int attendCheck(Map<String, Object> map) throws Exception{//출석체크
		
		return sqlSession.insert(namespace+"pointcheck",map);
	}
	public int usePoint(PointDTO pointDTO)throws Exception{
		
		return sqlSession.update(namespace+"usePoint", pointDTO);
	}
	public int insert(PointDTO pointDTO) throws Exception{
		return sqlSession.insert(namespace+"insert",pointDTO);
	}
	
}
