package com.ruoyi.system.service;

import com.ruoyi.system.domain.File;
import com.ruoyi.system.domain.WorkFile;

import java.util.List;

/**
 * @author :syy
 * @date :2022/12/20 9:28
 */
public interface WorkFileService {
    /**
     * 插入新文件
     *
     * @param file
     * @return
     */
    void insertFile(WorkFile file);

    WorkFile findFileById(String fileId);

    /**
     * 根据文件id删除文件
     *
     * @param fileId
     * @return
     */
    void deleteFileById(String fileId);

}
