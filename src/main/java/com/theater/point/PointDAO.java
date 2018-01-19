package com.theater.point;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.theater.member.MemberDTO;
import com.theater.member.UserDTO;
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
	//------------------------------
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
	//출석체크
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

	//출석체크
	//day_check==select
	public boolean day_Check(PointDTO pointDTO, Date d,String id ) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();

		Calendar c = Calendar.getInstance ();
		c.setTime ( d );

		map.put("id", id);
		map.put("reg_date",d.toString());
		PointDTO point = sqlSession.selectOne(namespace+"day_Check", map);
		boolean check = false;
		if(point != null){
			check = true;
		}
		return check;
	}

	public int day_Insert(String id,Date da) throws Exception{
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("reg_date",da);
		
		return sqlSession.insert(namespace+"day_Insert", map);
		
	}
public List<UserDTO> mSelect(String id)throws Exception{
	
	
	return sqlSession.selectList(namespace+"mSelect", id);
	
}
public int update(UserDTO userDTO) throws Exception{
	
	return sqlSession.update(namespace+"check_update",userDTO);
}

}
