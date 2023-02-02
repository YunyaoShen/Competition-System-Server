package com.ruoyi.system.domain;

import java.util.List;

/**
 * @author syy
 * CreateTime 2022/12/13 11:10
 */
public class Notification {
    private String notificationId;

    private String notificationContent;

    private Competition competition;

    private Long notificationTime;

    private String notificationTitle;

    private Integer notificationType;

    private Integer notificationState;

    private Long acuserId;

    private String acuserName;


    private List<File> files;

    private List<String> userIds;

    //手动录入获奖信息时使用
    public List<String> getUserIds() {
        return userIds;
    }

    public void setUserIds(List<String> userIds) {
        this.userIds = userIds;
    }

    public List<File> getFiles() {
        return files;
    }

    public void setFiles(List<File> files) {
        this.files = files;
    }

    public String getNotificationId() {
        return notificationId;
    }

    public void setNotificationId(String notificationId) {
        this.notificationId = notificationId == null ? null : notificationId.trim();
    }

    public String getNotificationContent() {
        return notificationContent;
    }

    public void setNotificationContent(String notificationContent) {
        this.notificationContent = notificationContent == null ? null : notificationContent.trim();
    }


    public Long getNotificationTime() {
        return notificationTime;
    }

    public void setNotificationTime(Long notificationTime) {
        this.notificationTime = notificationTime;
    }

    public String getNotificationTitle() {
        return notificationTitle;
    }

    public void setNotificationTitle(String notificationTitle) {
        this.notificationTitle = notificationTitle == null ? null : notificationTitle.trim();
    }

    public Integer getNotificationType() {
        return notificationType;
    }

    public void setNotificationType(Integer notificationType) {
        this.notificationType = notificationType;
    }

    public Integer getNotificationState() {
        return notificationState;
    }

    public void setNotificationState(Integer notificationState) {
        this.notificationState = notificationState;
    }

    public Competition getCompetition() {
        return competition;
    }

    public void setCompetition(Competition competition) {
        this.competition = competition;
    }

    public Long getAcuserId() {
        return acuserId;
    }

    public void setAcuserId(Long acuserId) {
        this.acuserId = acuserId;
    }

    public String getAcuserName() {
        return acuserName;
    }

    public void setAcuserName(String acuserName) {
        this.acuserName = acuserName;
    }

    @Override
    public String toString() {
        return "Notification{" +
                "notificationId='" + notificationId + '\'' +
                ", notificationContent='" + notificationContent + '\'' +
                ", competition=" + competition +
                ", notificationTime='" + notificationTime + '\'' +
                ", notificationTitle='" + notificationTitle + '\'' +
                ", notificationType=" + notificationType +
                ", notificationState=" + notificationState +
                ", files=" + files +
                ", acuserId=" + acuserId +
                ", acuserName=" + acuserName +
                '}';
    }
}