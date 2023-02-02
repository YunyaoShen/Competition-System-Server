package com.ruoyi.system.domain;


import com.ruoyi.common.core.domain.BaseEntity;

import java.util.List;

/**
 * UserActivity对象 t_user_activity
 *
 * @author ruoyi
 * @date 2022-12-07
 */
public class TeamReview extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    private String reviewId;

    private String teamId;

    private Integer reviewState;

    private TeamActivity teamActivity;

    public String getReviewId() {
        return reviewId;
    }

    public void setReviewId(String reviewId) {
        this.reviewId = reviewId;
    }

    public String getTeamId() {
        return teamId;
    }

    public void setTeamId(String teamId) {
        this.teamId = teamId;
    }

    public Integer getReviewState() {
        return reviewState;
    }

    public void setReviewState(Integer reviewState) {
        this.reviewState = reviewState;
    }

    public TeamActivity getTeamActivity() {
        return teamActivity;
    }

    public void setTeamActivity(TeamActivity teamActivity) {
        this.teamActivity = teamActivity;
    }

    @Override
    public String toString() {
        return "TeamReview{" +
                "reviewId='" + reviewId + '\'' +
                ", teamId='" + teamId + '\'' +
                ", reviewState=" + reviewState +
                ", teamActivity=" + teamActivity +
                '}';
    }
}
