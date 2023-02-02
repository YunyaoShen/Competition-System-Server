package com.ruoyi.system.domain;
import com.ruoyi.common.core.domain.entity.SysSuser;
/**
 * @author syy
 * CreateTime 2022/12/13 11:10
 */
public class UserCompetition {
    private String competitionId;
    private Long userId;


    private Competition competition;

    private SysSuser user;

    private Long date;

    private Integer winRanking;

    private String winLevelName;

    private Integer auditState;

    public Integer getWinRanking() {
        return winRanking;
    }

    public void setWinRanking(Integer winRanking) {
        this.winRanking = winRanking;
    }

    public String getWinLevelName() {
        return winLevelName;
    }

    public void setWinLevelName(String winLevelName) {
        this.winLevelName = winLevelName;
    }

    public Long getDate() {
        return date;
    }

    public void setDate(Long date) {
        this.date = date;
    }

    public Competition getCompetition() {
        return competition;
    }

    public void setCompetition(Competition competition) {
        this.competition = competition;
    }

    public SysSuser getUser() {
        return user;
    }

    public void setUser(SysSuser user) {
        this.user = user;
    }

    public Integer getAuditState() {
        return auditState;
    }

    public void setAuditState(Integer auditState) {
        this.auditState = auditState;
    }


    public String getCompetitionId() {
        return competitionId;
    }

    public void setCompetitionId(String competitionId) {
        this.competitionId = competitionId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
    @Override
    public String toString() {
        return "UserCompetition{" +
                "competitionId=" + competitionId +
                "userId=" + userId +
                "competition=" + competition +
                ", user=" + user +
                ", date=" + date +
                ", winRanking=" + winRanking +
                ", winLevelName='" + winLevelName + '\'' +
                ", auditState='" + auditState + '\'' +
                '}';
    }
}