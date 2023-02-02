package com.ruoyi.system.domain;

import java.util.List;
import com.ruoyi.common.core.domain.entity.SysSuser;
/**
 * @author syy
 * CreateTime 2022/12/13 11:10
 */
public class Competition {
    private String competitionId;

    private List<SysSuser> users;

    private String competitionName;

    private Integer competitionState;

    private String competitionFile;

    private String competitionContent;

    private String competitionType;

    private String competitionTime;

    private Long competitionStoptime;

    private Integer competitionLevel;

    private String competitionSite;

    private Integer competitionPeopleSum;

    private List<Notification> notifications;

    private List<File> files;

    private Win win;

    private List<Team> teams;


    public Integer getCompetitionPeopleSum() {
        return competitionPeopleSum;
    }

    public void setCompetitionPeopleSum(Integer competitionPeopleSum) {
        this.competitionPeopleSum = competitionPeopleSum;
    }

    public List<Team> getTeams() {
        return teams;
    }

    public void setTeams(List<Team> teams) {
        this.teams = teams;
    }

    public Win getWin() {
        return win;
    }

    public void setWin(Win win) {
        this.win = win;
    }

    public List<File> getFiles() {
        return files;
    }

    public void setFiles(List<File> files) {
        this.files = files;
    }

    public String getCompetitionId() {
        return competitionId;
    }

    public void setCompetitionId(String competitionId) {
        this.competitionId = competitionId == null ? null : competitionId.trim();
    }


    public String getCompetitionName() {
        return competitionName;
    }

    public void setCompetitionName(String competitionName) {
        this.competitionName = competitionName == null ? null : competitionName.trim();
    }

    public Integer getCompetitionState() {
        return competitionState;
    }

    public void setCompetitionState(Integer competitionState) {
        this.competitionState = competitionState;
    }

    public String getCompetitionFile() {
        return competitionFile;
    }

    public void setCompetitionFile(String competitionFile) {
        this.competitionFile = competitionFile == null ? null : competitionFile.trim();
    }

    public String getCompetitionContent() {
        return competitionContent;
    }

    public void setCompetitionContent(String competitionContent) {
        this.competitionContent = competitionContent == null ? null : competitionContent.trim();
    }

    public String getCompetitionType() {
        return competitionType;
    }

    public void setCompetitionType(String competitionType) {
        this.competitionType = competitionType == null ? null : competitionType.trim();
    }

    public String getCompetitionTime() {
        return competitionTime;
    }

    public void setCompetitionTime(String competitionTime) {
        this.competitionTime = competitionTime;
    }

    public Long getCompetitionStoptime() {
        return competitionStoptime;
    }

    public void setCompetitionStoptime(Long competitionStoptime) {
        this.competitionStoptime = competitionStoptime;
    }

    public Integer getCompetitionLevel() {
        return competitionLevel;
    }

    public void setCompetitionLevel(Integer competitionLevel) {
        this.competitionLevel = competitionLevel;
    }

    public String getCompetitionSite() {
        return competitionSite;
    }

    public void setCompetitionSite(String competitionSite) {
        this.competitionSite = competitionSite == null ? null : competitionSite.trim();
    }

    public List<SysSuser> getUsers() {
        return users;
    }

    public void setUsers(List<SysSuser> users) {
        this.users = users;
    }


    public List<Notification> getNotifications() {
        return notifications;
    }

    public void setNotifications(List<Notification> notifications) {
        this.notifications = notifications;
    }

    @Override
    public String toString() {
        return "Competition{" +
                "competitionId='" + competitionId + '\'' +
                ", users=" + users +
                ", competitionName='" + competitionName + '\'' +
                ", competitionState=" + competitionState +
                ", competitionFile='" + competitionFile + '\'' +
                ", competitionContent='" + competitionContent + '\'' +
                ", competitionType='" + competitionType + '\'' +
                ", competitionTime='" + competitionTime + '\'' +
                ", competitionStoptime=" + competitionStoptime +
                ", competitionLevel=" + competitionLevel +
                ", competitionSite='" + competitionSite + '\'' +
                ", competitionPeopleSum=" + competitionPeopleSum +
                ", notifications=" + notifications +
                ", files=" + files +
                ", win=" + win +
                ", teams=" + teams +
                '}';
    }
}