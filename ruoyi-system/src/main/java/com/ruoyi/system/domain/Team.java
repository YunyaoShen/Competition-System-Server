package com.ruoyi.system.domain;
import com.ruoyi.common.core.domain.entity.SysSuser;
import java.util.List;

/**
 * @author syy
 * CreateTime 2022/12/13 11:10
 */
public class Team {
    private String teamId;

    private SysSuser captain;

    private Long applyTime;

    private String teamName;

    private Integer teamState;

    private Integer teamHeadcount;

    private Competition competition;

    private List<SysSuser> users;

    private String teamContent;

    private List<Apply> applies;

    private Integer auditState;

    public Long getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(Long applyTime) {
        this.applyTime = applyTime;
    }

    public List<Apply> getApplies() {
        return applies;
    }

    public void setApplies(List<Apply> applies) {
        this.applies = applies;
    }

    public String getTeamContent() {
        return teamContent;
    }

    public void setTeamContent(String teamContent) {
        this.teamContent = teamContent;
    }

    public Competition getCompetition() {
        return competition;
    }

    public void setCompetition(Competition competition) {
        this.competition = competition;
    }

    public String getTeamId() {
        return teamId;
    }

    public void setTeamId(String teamId) {
        this.teamId = teamId == null ? null : teamId.trim();
    }

    public SysSuser getCaptain() {
        return captain;
    }

    public void setCaptain(SysSuser captain) {
        this.captain = captain;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName == null ? null : teamName.trim();
    }

    public Integer getTeamState() {
        return teamState;
    }

    public void setTeamState(Integer teamState) {
        this.teamState = teamState;
    }

    public Integer getTeamHeadcount() {
        return teamHeadcount;
    }

    public void setTeamHeadcount(Integer teamHeadcount) {
        this.teamHeadcount = teamHeadcount;
    }


    public List<SysSuser> getUsers() {
        return users;
    }

    public void setUsers(List<SysSuser> users) {
        this.users = users;
    }

    public Integer getAuditState() {
        return auditState;
    }

    public void setAuditState(Integer auditState) {
        this.auditState = auditState;
    }

    @Override
    public String toString() {
        return "Team{" +
                "teamId='" + teamId + '\'' +
                ", captain=" + captain +
                ", applyTime=" + applyTime +
                ", teamName='" + teamName + '\'' +
                ", teamState=" + teamState +
                ", teamHeadcount=" + teamHeadcount +
                ", competition=" + competition +
                ", users=" + users +
                ", teamContent='" + teamContent + '\'' +
                ", applies=" + applies +
                ", auditState=" + auditState +
                '}';
    }
}