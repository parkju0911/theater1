package com.theater.event;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.theater.event.EventDTO;
import com.theater.util.RowNum;

@Repository
public class EventDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="eventMapper.";
	
	public int hitUpdate(int num) throws Exception{
		return sqlSession.update(namespace+"hitUpdate", num);
	}
	
	public int getevent_num() throws Exception{
		return sqlSession.selectOne(namespace+"getevent_num");
	}
	
	public int totalCount(RowNum rowNum) throws Exception{
		return sqlSession.selectOne(namespace+"totalCount", rowNum);
	}
	
	public List<EventDTO> selectList(RowNum rowNum) throws Exception {
		return sqlSession.selectList(namespace+"selectList", rowNum);
	}
	
	public EventDTO selectOne(int num) throws Exception {
		return sqlSession.selectOne(namespace+"selectOne", num);
	}
		
	public int insert(EventDTO eventDTO) throws Exception {
		System.out.println("Before : "+eventDTO.getEvent_num());
		int result = sqlSession.insert(namespace+"insert", eventDTO);
		System.out.println("After : "+eventDTO.getEvent_num());
		return result;
	}
	
	public int delete(int num) throws Exception {
		return sqlSession.delete(namespace+"delete", num);
	}
	
	public int update(EventDTO eventDTO) throws Exception {
		return sqlSession.update(namespace+"update", eventDTO);
	}
}
