package com.ruoyi.system.service.impl;

import com.ruoyi.system.domain.*;
import com.ruoyi.system.mapper.*;
import com.ruoyi.system.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author :syy
 * @date :2022/12/18 10:29
 */

@Service
public class ReviewServiceImpl implements ReviewService {
    @Autowired
    private ReviewDao reviewDao;
    @Autowired
    private UserActivityMapper userActivityMapper;
    @Autowired
    private TeamActivityMapper teamActivityMapper;

    @Autowired
    private ActivityMapper activityMapper;

    @Override
    public List<UserActivity> findUserActivity(String activityId) {
        List<UserActivity> userActivities = reviewDao.findUserActivity(activityId);
        return userActivities;
    }

    @Override
    public List<TeamActivity> findTeamActivity(String activityId) {
        List<TeamActivity> teamActivities = reviewDao.findTeamActivity(activityId);
        return teamActivities;
    }

    @Override
    public void insertReview(Review review) {
        reviewDao.insertReview(review);
        reviewDao.resetReviewState(review.getActivityId());
    }

    @Override
    public void insertUserReview(String reviewId,List<UserActivity> userActivities) {
        reviewDao.insertUserReview(reviewId,userActivities);
    }

    @Override
    public void insertTeamReview(String reviewId,List<TeamActivity> teamActivities){
        reviewDao.insertTeamReview(reviewId,teamActivities);
    }

    @Override
    public List<Review> selectReviewList(Review review){
        List<Review> reviews = reviewDao.selectReviewList(review);
        return reviews;
    }

    @Override
    public List<UserReview> selectUserworkList(String reviewId){
        List<UserReview> userReviews = reviewDao.selectUserworkList(reviewId);
        return userReviews;
    }

    @Override
    public List<TeamReview> selectTeamworkList(String reviewId){
        List<TeamReview> teamActivities = reviewDao.selectTeamworkList(reviewId);
        return teamActivities;
    }

    @Override
    public void handleUserReview(UserActivity userActivity,String reviewId){
        userActivityMapper.updateUserActivity(userActivity);
        reviewDao.setReviewUserstate(reviewId,userActivity.getUserId());
        Activity activity= activityMapper.selectActivityByActivityId(userActivity.getActivityId());
        List<Activity> activities = activityMapper.selectActivityList(activity.getCompetitionId());
        System.out.println(activities);
        int index = 0;
        for(int i=0;i<activities.size();i++){
            if(activity.getActivityId().equals(activities.get(i).getActivityId())){
                index = i;
                break;
            }
        }

        if(index < activities.size()-1){
            Activity newActivity = activities.get(index+1);
            String newActivityId = newActivity.getActivityId();
            if(userActivity.getActivityState()==1){
                if(userActivityMapper.selectUserActivityByUserIdANDActivityId(userActivity.getUserId(),newActivityId) == null){
                    UserActivity newUserActivity = new UserActivity();
                    newUserActivity.setActivityId(newActivityId);
                    newUserActivity.setUserId(userActivity.getUserId());
                    newUserActivity.setDate(System.currentTimeMillis());
                    newUserActivity.setFileId(userActivity.getFileId());
                    newUserActivity.setActivityState(0);
                    userActivityMapper.insertUserActivity(newUserActivity);
                }
            }
            if(userActivity.getActivityState()==2){
                if(userActivityMapper.selectUserActivityByUserIdANDActivityId(userActivity.getUserId(),newActivityId) != null){
                    userActivityMapper.deleteUserActivityByUserIdANDActivityId(userActivity.getUserId(),newActivityId);
                }
            }
        }
    }
//    teamActivityMapper
    @Override
    public void handleTeamReview(TeamActivity teamActivity,String reviewId){
        teamActivityMapper.updateTeamActivity(teamActivity);
        reviewDao.setReviewTeamstate(reviewId,teamActivity.getTeamId());
        Activity activity= activityMapper.selectActivityByActivityId(teamActivity.getActivityId());
        List<Activity> activities = activityMapper.selectActivityList(activity.getCompetitionId());
        int index = 0;
        for(int i=0;i<activities.size();i++){
            if(activity.getActivityId().equals(activities.get(i).getActivityId())){
                index = i;
                break;
            }
        }
        if(index < activities.size()-1){
            Activity newActivity = activities.get(index+1);
            String newActivityId = newActivity.getActivityId();
            if(teamActivity.getActivityState()==1){
                if(teamActivityMapper.selectTeamActivityByTeamIdANDActivityId(teamActivity.getTeamId(),newActivityId) == null){
                    TeamActivity newTeamActivity = new TeamActivity();
                    newTeamActivity.setActivityId(newActivityId);
                    newTeamActivity.setTeamId(teamActivity.getTeamId());
                    newTeamActivity.setDate(System.currentTimeMillis());
                    newTeamActivity.setFileId(teamActivity.getFileId());
                    newTeamActivity.setActivityState(0);
                    teamActivityMapper.insertTeamActivity(newTeamActivity);
                }
            }
            if(teamActivity.getActivityState()==2){
                if(teamActivityMapper.selectTeamActivityByTeamIdANDActivityId(teamActivity.getTeamId(),newActivityId) != null){
                    teamActivityMapper.deleteTeamActivityByTeamIdANDActivityId(teamActivity.getTeamId(),newActivityId);
                }
            }
        }
    }

}
