package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.*;
import com.ruoyi.common.core.domain.entity.SysSuser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface ReviewDao {

    public List<UserActivity> findUserActivity(String activityId);

    public void insertUserReview(@Param("reviewId") String reviewId,@Param("userActivities") List<UserActivity> userActivities);
    public List<TeamActivity> findTeamActivity(String activityId);

    public void insertTeamReview(@Param("reviewId") String reviewId,@Param("teamActivities") List<TeamActivity> teamActivities);

    public void insertReview(Review review);

    public void resetReviewState(String activityId);

    public List<Review> selectReviewList(Review review);

    public List<UserReview> selectUserworkList(String reviewId);

    public List<TeamReview> selectTeamworkList(String reviewId);

    public void setReviewUserstate(@Param("reviewId") String reviewId,@Param("userId") Long userId);

    public void setReviewTeamstate(@Param("reviewId") String reviewId,@Param("teamId") String teamId );
}
