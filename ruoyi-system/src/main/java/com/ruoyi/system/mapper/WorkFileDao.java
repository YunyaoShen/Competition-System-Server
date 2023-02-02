package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.File;
import com.ruoyi.system.domain.WorkFile;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author :syy
 * @date :2022/12/19 23:31
 */
@Mapper
public interface WorkFileDao {
    /**
     * 插入新文件
     *
     * @param file
     * @return
     */
    void insertFile(WorkFile file);


    /**
     * 根据文件id搜索文件
     *
     * @param fileId
     * @return
     */
    WorkFile findFileById(String fileId);

    /**
     * 根据文件id删除文件
     *
     * @param fileId
     * @return
     */
    void deleteFileById(String fileId);


}
