package com.theater.notice;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.theater.util.RowNum;

@Repository
public class NoticeDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="noticeMapper.";
	
	public int hitUpdate(int num) throws Exception{
		return sqlSession.update(namespace+"hitUpdate", num);
	}
	
	public int getNotice_num() throws Exception{
		return sqlSession.selectOne(namespace+"getNotice_num");
	}
	
	public int totalCount(RowNum rowNum) throws Exception{
		return sqlSession.selectOne(namespace+"totalCount", rowNum);
	}
	
	public List<NoticeDTO> selectList(RowNum rowNum) throws Exception {
		return sqlSession.selectList(namespace+"selectList", rowNum);
	}
	
	public NoticeDTO selectOne(int num) throws Exception {
		return sqlSession.selectOne(namespace+"selectOne", num);
	}
		
	public int insert(NoticeDTO noticeDTO) throws Exception {
		int result = sqlSession.insert(namespace+"insert", noticeDTO);
		return result;
	}
	
	public int delete(int num) throws Exception {
		return sqlSession.delete(namespace+"delete", num);
	}
	
	public int update(NoticeDTO noticeDTO) throws Exception {
		return sqlSession.update(namespace+"update", noticeDTO);
	}
}
