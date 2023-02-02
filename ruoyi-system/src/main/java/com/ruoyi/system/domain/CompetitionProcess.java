package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CompetitionProcess extends BaseEntity {
    private static final long serialVersionUID = 1L;

    private String activityId;


    private String activityName;


    private String competitionId;

    private Long activityStarttime;


    private Long activityEndtime;

    private Long ordernum;

    private Integer activityState;

    private WorkFile workfile;


    public String getActivityId() {
        return activityId;
    }

    public void setActivityId(String activityId) {
        this.activityId = activityId;
    }

    public String getActivityName() {
        return activityName;
    }

    public void setActivityName(String activityName) {
        this.activityName = activityName;
    }

    public String getCompetitionId() {
        return competitionId;
    }

    public void setCompetitionId(String competitionId) {
        this.competitionId = competitionId;
    }


    public Long getOrdernum() {
        return ordernum;
    }

    public void setOrdernum(Long ordernum) {
        this.ordernum = ordernum;
    }

    public Integer getActivityState() {
        return activityState;
    }

    public void setActivityState(Integer activityState) {
        this.activityState = activityState;
    }

    public Long getActivityStarttime() {
        return activityStarttime;
    }

    public void setActivityStarttime(Long activityStarttime) {
        this.activityStarttime = activityStarttime;
    }

    public Long getActivityEndtime() {
        return activityEndtime;
    }

    public void setActivityEndtime(Long activityEndtime) {
        this.activityEndtime = activityEndtime;
    }

    public WorkFile getWorkfile() {
        return workfile;
    }

    public void setWorkfile(WorkFile workfile) {
        this.workfile = workfile;
    }

    @Override
    public String toString() {
        return "CompetitionProcess{" +
                ", activityId='" + activityId + '\'' +
                ", activityName='" + activityName + '\'' +
                ", competitionId='" + competitionId + '\'' +
                ", activityStarttime='" + activityStarttime + '\'' +
                ", activityEndtime='" + activityEndtime + '\'' +
                ", ordernum=" + ordernum +
                ", activityState=" + activityState +
                ", workfile=" + workfile +
                '}';
    }
}
