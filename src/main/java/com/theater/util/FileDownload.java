package com.theater.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class FileDownload extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {

		File file = (File)model.get("down");
		response.setCharacterEncoding("UTF-8");
		response.setContentLength((int)file.length());   //�뙆�씪�쓽 �겕湲�
		//String filePath	= (String)model.get("file_route");
		String file_name = (String)model.get("file_name");
		//�뙆�씪紐낆쓣 UTF-8濡� �씤肄붾뵫
		file_name = URLEncoder.encode(file_name, "UTF-8");

		response.setHeader("Content-Disposition", "attachment;file_name=\""+file_name+"\"");
		response.setHeader("content-Transfer-Encoding", "binary");

		OutputStream out = response.getOutputStream();

		FileInputStream fi = new FileInputStream(file);

		FileCopyUtils.copy(fi, out);

		fi.close();
		out.close();
	}
}
