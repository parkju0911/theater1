package com.theater.file;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FileListDTO {
	
	private MultipartFile [] files;
	private List<FileDTO> fileNames;

	public MultipartFile[] getFiles() {
		return files;
	}

	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}
	public List<FileDTO> getFileNames() {
		return fileNames;
	}
	
	public void setFileNames(List<FileDTO> fileNames) {
		this.fileNames = fileNames;
	}
}
