package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * useractivity对象 t_team_activity
 *
 * @author ruoyi
 * @date 2022-12-07
 */
public class TeamActivity extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 队伍编号 */
    private String teamId;

    /** 赛程编号 */
    private String activityId;

    /** 日期 */
    @Excel(name = "日期")
    private Long date;

    /** 参赛作品 */
    private String fileId;

    private Integer score;

    private WorkFile file;

    private Team team;
    /** 参赛状态 */
    @Excel(name = "参赛状态")
    private Integer activityState;

    public void setTeamId(String teamId)
    {
        this.teamId = teamId;
    }

    public String getTeamId()
    {
        return teamId;
    }
    public void setActivityId(String activityId)
    {
        this.activityId = activityId;
    }

    public String getActivityId()
    {
        return activityId;
    }
    public void setDate(Long date)
    {
        this.date = date;
    }

    public Long getDate()
    {
        return date;
    }
    public void setFileId(String fileId)
    {
        this.fileId = fileId;
    }

    public String getFileId()
    {
        return fileId;
    }
    public void setActivityState(Integer activityState)
    {
        this.activityState = activityState;
    }

    public Integer getActivityState()
    {
        return activityState;
    }
    public WorkFile getFile() {
        return file;
    }

    public void setFile(WorkFile file) {
        this.file = file;
    }

    public Team getTeam() {
        return team;
    }

    public void setTeam(Team team) {
        this.team = team;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("teamId", getTeamId())
                .append("activityId", getActivityId())
                .append("date", getDate())
                .append("fileId", getFileId())
                .append("activityState", getActivityState())
                .append("team", getTeam())
                .append("file", getFile())
                .append("score", getScore())
                .toString();
    }
}
