package com.ruoyi.system.domain;


import com.ruoyi.common.core.domain.BaseEntity;

import java.util.List;

/**
 * UserActivity对象 t_user_activity
 *
 * @author ruoyi
 * @date 2022-12-07
 */
public class UserReview extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    private String reviewId;

    private Long userId;

    private Integer reviewState;

    private UserActivity userActivity;

    public String getReviewId() {
        return reviewId;
    }

    public void setReviewId(String reviewId) {
        this.reviewId = reviewId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Integer getReviewState() {
        return reviewState;
    }

    public void setReviewState(Integer reviewState) {
        this.reviewState = reviewState;
    }

    public UserActivity getUserActivity() {
        return userActivity;
    }

    public void setUserActivity(UserActivity userActivity) {
        this.userActivity = userActivity;
    }

    @Override
    public String toString() {
        return "UserReview{" +
                "reviewId='" + reviewId + '\'' +
                ", userId=" + userId +
                ", reviewState=" + reviewState +
                ", userActivity=" + userActivity +
                '}';
    }
}
