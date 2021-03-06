package com.theater.file;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.theater.notice.NoticeDTO;

@Repository
public class FileDAO {


	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="fileMapper.";
	
	public int update(FileDTO fileDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"update", fileDTO);
	}
	
	public NoticeDTO test3() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"selectTest3");
	}
	
	public FileDTO test() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"selectTest", 1);
	}
	
	public int insert(FileDTO fileDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"insert", fileDTO);
	}
	
	public List<FileDTO> selectList(int num) throws Exception {
		return sqlSession.selectList(NAMESPACE+"selectList", num);
	}

	public int searchFile_num() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"searchFileNum");
	}

	public int selectOne(int file_num)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectOne", file_num );
	}

}
