package com.ruoyi.system.service.impl;

import com.ruoyi.system.domain.File;
import com.ruoyi.system.mapper.FileDao;
import com.ruoyi.system.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author :syy
 * @date :2022/12/20 9:28
 */

@Service
public class FileServiceImpl implements FileService {
    @Autowired
    private FileDao fileDao;

    @Override
    public void insertFile(File file) {
        fileDao.insertFile(file);
    }

    @Override
    public List<File> findFileByCompetitionId(String competitionId) {
        List<File> files = fileDao.findFileByCompetitionId(competitionId);

        return files;
    }

    @Override
    public void deleteFileByCompetitionId(String CompetitionId) {
        fileDao.deleteFileByCompetitionId(CompetitionId);
    }

    @Override
    public File findFileById(String fileId) {
        File file = fileDao.findFileById(fileId);
        return file;
    }

    @Override
    public void deleteFileById(String fileId) {
        fileDao.deleteFileById(fileId);
    }

    @Override
    public List<File> findFileByNotificationId(String notificationId) {
        List<File> files = fileDao.findFileByNotificationId(notificationId);
        return files;
    }

}
