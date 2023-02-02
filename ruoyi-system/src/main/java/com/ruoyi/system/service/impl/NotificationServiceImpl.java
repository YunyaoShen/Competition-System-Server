package com.ruoyi.system.service.impl;

import com.ruoyi.system.mapper.CompetitionDao;
import com.ruoyi.system.mapper.NotificationDao;
import com.ruoyi.system.domain.Competition;
import com.ruoyi.system.domain.Notification;
import com.ruoyi.system.mapper.FileDao;
import com.ruoyi.system.service.NotificationService;
import com.ruoyi.common.utils.CompetitionNotificationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author :syy
 * @date :2022/12/18 10:29
 */

@Service
public class NotificationServiceImpl implements NotificationService {
    @Autowired
    private NotificationDao notificationDao;
    @Autowired
    private CompetitionDao competitionDao;
    @Autowired
    private FileDao fileDao;

    @Override
    public List<Notification> findNotificationByType(Integer notificationType,Long acuserId) {
        List<Notification> notifications = notificationDao.findNotificationByType(notificationType,acuserId);
        return notifications;
    }

    @Override
    public List<Notification> findAuditNotificationByType(Integer notificationType) {
        List<Notification> notifications = notificationDao.findAuditNotificationByType(notificationType);
        return notifications;
    }

    @Override
    public void competitionAudit(String notificationId,String competitionId,Integer competitionState,Long userId) {
        if(competitionState==2 && userId != null){
            competitionDao.competitionAudit(competitionId,competitionState);
            notificationDao.addAcUser(notificationId,userId);
        }
        if(competitionState==4)
        {
            competitionDao.competitionAudit(competitionId,competitionState);
        }

    }

    @Override
    public List<Notification> findSystemNoticeByTypeAndState(Integer notificationType, Integer notificationState) {
        List<Notification> notifications = notificationDao.findSystemNoticeByTypeAndState(notificationType, notificationState);
        return notifications;
    }

    @Transactional(isolation = Isolation.REPEATABLE_READ, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    @Override
    public void insertCompetitionAndNotification(Competition competition, Notification notification) {
        competitionDao.insertCompetition(competition);
        notificationDao.insertNotification(notification);
    }


    @Override
    public Notification findDataByNotificationId(String notificationId) {
        Notification notification = notificationDao.findDataByNotificationId(notificationId);
        return notification;
    }



    @Transactional(isolation = Isolation.REPEATABLE_READ, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    @Override
    public void deleteNotificationById(String notificationId, String competitionId) {
        //删通知
        notificationDao.deleteNotificationById(notificationId);
        //删竞赛文件
        fileDao.deleteFileByCompetitionId(competitionId);
        //删竞赛
        competitionDao.deleteCompetitionById(competitionId);

    }

    @Transactional(isolation = Isolation.REPEATABLE_READ, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    @Override
    public void updateNotification(CompetitionNotificationVO competitionNotificationVO) {
        notificationDao.updateNotification(competitionNotificationVO);
        competitionDao.updateCompetition(competitionNotificationVO);
    }
}
