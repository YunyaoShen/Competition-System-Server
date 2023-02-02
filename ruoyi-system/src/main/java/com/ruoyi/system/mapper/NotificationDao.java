package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.Notification;
import com.ruoyi.common.utils.CompetitionNotificationVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * @author :syy
 * @date :2022/12/18 10:30
 */
@Mapper
public interface NotificationDao {
    /**
     * 通知类型查找通知
     *
     * @param notificationType
     * @return
     */
    public List<Notification> findNotificationByType(@Param("notificationType") Integer notificationType,@Param("acuserId")Long acuserId);

    public List<Notification> findAuditNotificationByType(@Param("notificationType") Integer notificationType);

    void addAcUser(@Param("notificationId") String notificationId,@Param("userId") Long userId);
    /**
     * 通知类型和状态查找系统公告
     *
     * @param notificationType
     * @param notificationState
     * @return
     */
    List<Notification> findSystemNoticeByTypeAndState(Integer notificationType, Integer notificationState);

    /**
     * 插入新通知
     *
     * @param notification
     * @return
     */
    void insertNotification(Notification notification);

    /**
     * 根据通知id查找内容，用于回显修改通知的信息
     *
     * @param notificationId
     * @return
     */
    Notification findDataByNotificationId(String notificationId);

    /**
     * 根据通知id删除对应通知及文件，竞赛
     *
     * @param notificationId
     * @return
     */
    void deleteNotificationById(String notificationId);


    /**
     * 修改竞赛通知及竞赛文件，竞赛内容
     *
     * @param competitionNotificationVO
     * @return
     */
    void updateNotification(CompetitionNotificationVO competitionNotificationVO);
}
