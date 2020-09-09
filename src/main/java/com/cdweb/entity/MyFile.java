package com.cdweb.entity;
import java.io.Serializable;
import org.springframework.web.multipart.MultipartFile;
public class MyFile implements Serializable {
    private static final long serialVersionUID = 1L;
    private MultipartFile multipartFile;
    private String folder;

    public MultipartFile getMultipartFile() {
        return multipartFile;
    }

    public void setMultipartFile(MultipartFile multipartFile) {
        this.multipartFile = multipartFile;
    }

    public String getFolder() {
        return folder;
    }

    public void setFolder(String folder) {
        this.folder = folder;
    }
}