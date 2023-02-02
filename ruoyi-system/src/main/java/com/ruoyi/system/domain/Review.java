package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class Review extends BaseEntity {
    private static final long serialVersionUID = 1L;

    private String reviewId;

    private Long tuserId;

    private String tuserName;

    private String competitionId;

    private String activityId;

    private Integer competitionType;

    private String competitionName;

    private String activityName;

    public String getReviewId() {
        return reviewId;
    }

    public void setReviewId(String reviewId) {
        this.reviewId = reviewId;
    }

    public Long getTuserId() {
        return tuserId;
    }

    public void setTuserId(Long tuserId) {
        this.tuserId = tuserId;
    }

    public String getCompetitionId() {
        return competitionId;
    }

    public void setCompetitionId(String competitionId) {
        this.competitionId = competitionId;
    }

    public String getActivityId() {
        return activityId;
    }

    public void setActivityId(String activityId) {
        this.activityId = activityId;
    }

    public Integer getCompetitionType() {
        return competitionType;
    }

    public void setCompetitionType(Integer competitionType) {
        this.competitionType = competitionType;
    }

    public String getCompetitionName() {
        return competitionName;
    }

    public void setCompetitionName(String competitionName) {
        this.competitionName = competitionName;
    }

    public String getActivityName() {
        return activityName;
    }

    public void setActivityName(String activityName) {
        this.activityName = activityName;
    }

    public String getTuserName() {
        return tuserName;
    }

    public void setTuserName(String tuserName) {
        this.tuserName = tuserName;
    }

    @Override
    public String toString() {
        return "Review{" +
                "reviewId='" + reviewId + '\'' +
                ", tuserId=" + tuserId +
                ", competitionId='" + competitionId + '\'' +
                ", activityId='" + activityId + '\'' +
                ", competitionType=" + competitionType +
                ", competitionType=" + competitionName +
                ", competitionType=" + activityName +
                ", competitionType=" + tuserName +
                '}';
    }
}
