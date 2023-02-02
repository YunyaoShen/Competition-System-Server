package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;

public class WorkFile extends BaseEntity {
    private String fileId;
    private String fileName;
    private String filePath;

    public String getFileId() {
        return fileId;
    }

    public void setFileId(String fileId) {
        this.fileId = fileId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    @Override
    public String toString() {
        return "WorkFile{" +
                "fileId='" + fileId + '\'' +
                ", fileName='" + fileName + '\'' +
                ", filePath='" + filePath + '\'' +
                '}';
    }
}
