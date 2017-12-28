package com.theater.notice;



import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.theater.file.FileDAO;
import com.theater.file.FileDTO;
import com.theater.util.FileSaver;
import com.theater.util.ListData;
@Service
public class NoticeService {
	
	@Inject
	private NoticeDAO noticeDAO;
	@Inject
	private FileSaver fileSaver;
	@Inject
	private FileDAO fileDAO;

	public ModelAndView selectList(ListData listData) throws Exception {
		int totalCount = noticeDAO.totalCount(listData.makeRow());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("board/boardList");
		modelAndView.addObject("pager", listData.makePage(totalCount));
		List<NoticeDTO> ar =  noticeDAO.selectList(listData.makeRow());
		modelAndView.addObject("list", ar);
		modelAndView.addObject("board", "notice");
		return modelAndView;
	}

	 
	public NoticeDTO selectOne(int num) throws Exception {
		noticeDAO.hitUpdate(num);
		NoticeDTO noticeDTO = noticeDAO.selectOne(num);
		noticeDTO.setFileNames(fileDAO.selectList(num));
		return noticeDTO;
	}
		 
	public int insert(NoticeDTO noticeDTO, HttpSession session, String path) throws Exception {
		MultipartFile [] files = noticeDTO.getFiles();
		//???ž¥ 1. ???ž¥ê²½ë¡œ -> realpath
		//List<FileDTO> names = new ArrayList<FileDTO>();
		int result = noticeDAO.insert(noticeDTO);
		/*Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", 521);
		map.put("title", noticeDTO.getTitle());
		map.put("contents", noticeDTO.getContents());
		result = noticeDAO.insertMemo(map);*/
		for (MultipartFile multipartFile : files) {
			String name = fileSaver.fileSave(multipartFile, session, "upload");
			String filePath = session.getServletContext().getRealPath("resources/"+path);
			FileDTO fileDTO = new FileDTO();
			fileDTO.setFile_name(name);
			fileDTO.setFile_route(filePath);
			fileDAO.insert(fileDTO);
		}
		//fileDAO.insert(names);
		//((NoticeDTO)NoticeDTO).setFileNames(names);
		return result;
	}

	 
	public int update(NoticeDTO noticeDTO) throws Exception {
		int result = noticeDAO.update(noticeDTO);
		return result;
	}

	 
	public int delete(int num) throws Exception {
		int result = noticeDAO.delete(num);
		return result;
	}

}
