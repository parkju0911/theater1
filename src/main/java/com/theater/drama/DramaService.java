package com.theater.drama;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.theater.file.FileDAO;
import com.theater.file.FileDTO;
import com.theater.notice.NoticeDTO;
import com.theater.util.FileSaver;
import com.theater.util.ListData;
import com.theater.util.Pager;
import com.theater.util.RowNum;

@Service 
//@Transactional
public class DramaService {

	@Inject
	private DramaDAO dramaDAO;
	@Inject
	private FileSaver fileSaver;
	@Inject
	private FileDAO fileDAO;
	
	public ModelAndView selectList(ListData listData) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(dramaDAO.totalCount(rowNum));
		List<DramaDTO> ar = dramaDAO.selectList(rowNum);
		
		mv.addObject("list", ar).addObject("pager", pager).addObject("board", "drama");
		
		return mv;
	}

	
	public int insert(DramaDTO dramaDTO, HttpSession session) throws Exception {
		int result = dramaDAO.insert(dramaDTO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("drama_num", dramaDTO.getDrama_num());
		map.put("title", dramaDTO.getTitle());
		map.put("contents", dramaDTO.getContents());
		
	
		
		MultipartFile[] files =((DramaDTO)dramaDTO).getFiles();
		
		System.out.println("NUM: "+ dramaDTO.getDrama_num());
		
		//저장 1. 저장경로 - realpath
		//List<FileDTO> names = new ArrayList<FileDTO>();
		for (MultipartFile multipartFile : files) {
			String name = fileSaver.fileSave(multipartFile, session, "upload");
			FileDTO fileDTO = new FileDTO();
			fileDTO.setFile_num(dramaDTO.getDrama_num()); // 먼저 noticeDAO.insert(boardDTO); 했긴 때문에 가능
			fileDTO.setFile_name(name);
			fileDTO.setFile_route(multipartFile.getOriginalFilename());
			//names.add(fileDTO);
			fileDAO.insert(fileDTO);
		}
		//((NoticeDTO)boardDTO).setFileNames(names);
		
		return result;
	}


}
