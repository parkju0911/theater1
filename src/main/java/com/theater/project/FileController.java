package com.theater.project;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.theater.file.FileDTO;
import com.theater.file.PhotoDTO;
import com.theater.file.PhotoService;

@Controller
@RequestMapping(value="/file/*")
public class FileController {


	@Inject
	private PhotoService photoService;
	
	//smartEdiotr image upload

	


	@RequestMapping(value="photoUpload")
	public String photoUpload(PhotoDTO photoDTO, HttpSession session){
		return photoService.photoUpload(photoDTO, session);
	}
	

	@RequestMapping(value="fileDown")
	public ModelAndView fileDown(FileDTO fileDTO, HttpSession session){
		String filePath = session.getServletContext().getRealPath("resources/upload");
		//���옣�맆 �떎�젣 �뙆�씪 �씠由�
		File file = new File(filePath, fileDTO.getFile_name());
		ModelAndView mv = new ModelAndView();
		mv.addObject("down", file);
		mv.addObject("file_name", fileDTO.getFile_name());
		mv.addObject("file_route", fileDTO.getFile_route());
		//viewName�� 
		mv.setViewName("filedown");
		
		return mv;
	}
	


	

}
