package com.ruoyi.system.service.impl;

import com.ruoyi.system.domain.WorkFile;
import com.ruoyi.system.mapper.WorkFileDao;
import com.ruoyi.system.service.WorkFileService;
import com.ruoyi.system.service.WorkFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author :syy
 * @date :2022/12/20 9:28
 */

@Service
public class WorkFileServiceImpl implements WorkFileService {
    @Autowired
    private WorkFileDao workfileDao;

    @Override
    public void insertFile(WorkFile file) {
        workfileDao.insertFile(file);
    }

    @Override
    public WorkFile findFileById(String fileId) {
        WorkFile file = workfileDao.findFileById(fileId);
        return file;
    }

    @Override
    public void deleteFileById(String fileId) {
        workfileDao.deleteFileById(fileId);
    }



}
