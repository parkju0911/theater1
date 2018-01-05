package com.theater.drama;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.theater.file.FileDAO;
import com.theater.file.FileDTO;
import com.theater.util.FileSaver;
import com.theater.util.ListData;
import com.theater.util.Pager;
import com.theater.util.RowNum;

@Service 
public class DramaService {

	@Inject
	private DramaDAO dramaDAO;
	@Inject
	private FileSaver fileSaver;
	@Inject
	private FileDAO fileDAO;
	
	public int search_dateNum(int drama_num, String drama_date, String drama_time) throws Exception{
		return dramaDAO.search_dateNum(drama_num, drama_date, drama_time);
	}
	public List<SeatDTO> selectSeat(int drama_num, int date_num) throws Exception{
		return dramaDAO.selectSeat(drama_num, date_num);
	}
	public DramaDTO selectOne(int drama_num) throws Exception{
		return dramaDAO.selectOne(drama_num);
	}
	
	public List<DramaListDTO> timeList(int drama_num, String drama_date) throws Exception{
		return dramaDAO.timeList(drama_num, drama_date);
	}
	public List<DramaListDTO> dramaList(int drama_num) throws Exception{
		return dramaDAO.dateList(drama_num);
	}
	public int total_seat(int drama_num) throws Exception{
		int company_num = dramaDAO.searchCompany_num(drama_num);
		
		return dramaDAO.total_seat(company_num);
	}
	
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
