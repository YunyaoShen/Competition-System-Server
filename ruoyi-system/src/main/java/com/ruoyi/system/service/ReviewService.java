package com.ruoyi.system.service;

import com.ruoyi.system.domain.*;

import java.util.List;

public interface ReviewService {

    List<UserActivity> findUserActivity(String activityId);

    void  insertUserReview(String reviewId,List<UserActivity> userActivities);

    List<TeamActivity> findTeamActivity(String activityId);

    void  insertTeamReview(String reviewId,List<TeamActivity> teamActivities);

    void insertReview(Review review);

    List<Review> selectReviewList(Review review);

    List<UserReview> selectUserworkList(String reviewId);

    List<TeamReview> selectTeamworkList(String reviewId);

    void handleUserReview(UserActivity userActivity,String reviewId);

    void handleTeamReview(TeamActivity teamActivity,String reviewId);

    
}
