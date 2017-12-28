package com.theater.drama;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.theater.file.FileDTO;

public class DramaFileDTO {

	private MultipartFile[] files;
	private List<FileDTO> fileNames;

	public List<FileDTO> getFileNames() {
		return fileNames;
	}
	public void setFileNames(List<FileDTO> fileNames) {
		this.fileNames = fileNames;
	}
	public MultipartFile[] getFiles() {
		return files;
	}
	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}
}
