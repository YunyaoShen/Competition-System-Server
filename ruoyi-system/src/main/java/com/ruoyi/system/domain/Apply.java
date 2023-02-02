package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.entity.SysSuser;

/**
 * 队伍申请
 *
 * @author :syy
 * @date :2022/12/31 10:25
 */
public class Apply {
    private String applyId;

    private Long applyTime;

    private String applyContent;

    private Long applyDisposeTime;

    private Integer applyState;

    private SysSuser user;

    private Team team;


    public String getApplyId() {
        return applyId;
    }

    public void setApplyId(String applyId) {
        this.applyId = applyId;
    }

    public Long getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(Long applyTime) {
        this.applyTime = applyTime;
    }

    public String getApplyContent() {
        return applyContent;
    }

    public void setApplyContent(String applyContent) {
        this.applyContent = applyContent;
    }

    public Long getApplyDisposeTime() {
        return applyDisposeTime;
    }

    public void setApplyDisposeTime(Long applyDisposeTime) {
        this.applyDisposeTime = applyDisposeTime;
    }

    public Integer getApplyState() {
        return applyState;
    }

    public void setApplyState(Integer applyState) {
        this.applyState = applyState;
    }

    public SysSuser getUser() {
        return user;
    }

    public void setUser(SysSuser user) {
        this.user = user;
    }

    public Team getTeam() {
        return team;
    }

    public void setTeam(Team team) {
        this.team = team;
    }

    @Override
    public String toString() {
        return "Apply{" +
                "applyId='" + applyId + '\'' +
                ", applyTime=" + applyTime +
                ", applyContent='" + applyContent + '\'' +
                ", applyDisposeTime=" + applyDisposeTime +
                ", applyState=" + applyState +
                ", user=" + user +
                ", team=" + team +
                '}';
    }
}
