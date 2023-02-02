package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.RedisUtil;
import com.ruoyi.system.domain.*;
import com.ruoyi.common.utils.ResponseMessage;
import com.ruoyi.system.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


@RestController
@RequestMapping("/system/review")
public class ReviewController extends BaseController  {
    @Autowired
    private ReviewService reviewService;
    @Autowired
    private RedisUtil redisUtil;

    @RequestMapping(value = "/releasereview", method = RequestMethod.POST)
    public @ResponseBody
    ResponseMessage releaseReview(@RequestParam List<Long> teacherlist,@RequestParam String activityId, @RequestParam String competitionId,@RequestParam Integer competitionType) {
        try {
            if (competitionType == 0) {
                List<UserActivity> userActivities = reviewService.findUserActivity(activityId);
                List<List<UserActivity>> result = new ArrayList<List<UserActivity>>();
                if (teacherlist.size() > userActivities.size()) {
                    for (int i = 0; i < userActivities.size(); i++) {
                        List<UserActivity> r = new ArrayList<>();
                        r.add(userActivities.get(i));
                        result.add(r);
                    }
                } else {
                    int size = userActivities.size();
                    int n = teacherlist.size();
                    int quotient = size / n; // 商数
                    int remainder = size % n; // 余数
                    int offset = 0; // 偏移量
                    int len = quotient > 0 ? n : remainder; // 循环长度
                    int start = 0; // 起始下标
                    int end = 0; // 结束下标
                    List tempList = null;
                    for (int i = 0; i < len; i++) {
                        if (remainder != 0) {
                            remainder--;
                            offset = 1;
                        } else {
                            offset = 0;
                        }
                        end = start + quotient + offset;
                        tempList = userActivities.subList(start, end);
                        start = end;
                        result.add(tempList);
                    }
                }
                for(int i = 0;i<result.size();i++){
                    Review review = new Review();
                    String reviewId = UUID.randomUUID().toString();
                    review.setReviewId(reviewId);
                    review.setTuserId(teacherlist.get(i));
                    review.setCompetitionId(competitionId);
                    review.setActivityId(activityId);
                    review.setCompetitionType(competitionType);
                    reviewService.insertReview(review);
                    reviewService.insertUserReview(reviewId,result.get(i));
                }


            } else {
                List<TeamActivity> teamActivities = reviewService.findTeamActivity(activityId);
                List<List<TeamActivity>> result = new ArrayList<List<TeamActivity>>();
                if (teacherlist.size() > teamActivities.size()) {
                    for (int i = 0; i < teamActivities.size(); i++) {
                        List<TeamActivity> r = new ArrayList<>();
                        r.add(teamActivities.get(i));
                        result.add(r);
                    }
                } else {
                    int size = teamActivities.size();
                    int n = teacherlist.size();
                    int quotient = size / n; // 商数
                    int remainder = size % n; // 余数
                    int offset = 0; // 偏移量
                    int len = quotient > 0 ? n : remainder; // 循环长度
                    int start = 0; // 起始下标
                    int end = 0; // 结束下标
                    List tempList = null;
                    for (int i = 0; i < len; i++) {
                        if (remainder != 0) {
                            remainder--;
                            offset = 1;
                        } else {
                            offset = 0;
                        }
                        end = start + quotient + offset;
                        tempList = teamActivities.subList(start, end);
                        start = end;
                        result.add(tempList);
                    }
                }
                for(int i = 0;i<result.size();i++){
                    Review review = new Review();
                    String reviewId = UUID.randomUUID().toString();
                    review.setReviewId(reviewId);
                    review.setTuserId(teacherlist.get(i));
                    review.setCompetitionId(competitionId);
                    review.setActivityId(activityId);
                    review.setCompetitionType(competitionType);
                    reviewService.insertReview(review);
                    reviewService.insertTeamReview(reviewId,result.get(i));
                }
            }
            return new ResponseMessage("1", "发布成功");
        }catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "发布失败");
        }
     }


    @GetMapping("/list")
    public TableDataInfo list(Review review)
    {

        startPage();
        List<Review> list = reviewService.selectReviewList(review);
        return getDataTable(list);
    }

    @GetMapping("/userworklist")
    public TableDataInfo userworkList(String reviewId)
    {
        redisUtil.set("reviewId",reviewId);
        startPage();
        List<UserReview> list = reviewService.selectUserworkList(reviewId);
        return getDataTable(list);
    }

    @GetMapping("/teamworklist")
    public TableDataInfo teamworkList(String reviewId)
    {
        redisUtil.set("reviewId",reviewId);
        startPage();
        List<TeamReview> list = reviewService.selectTeamworkList(reviewId);
        return getDataTable(list);
    }

    @PutMapping("/handleuserreview")
    public ResponseMessage handleUserReview(@RequestBody UserActivity userActivity)
    {
        String reviewId = redisUtil.get("reviewId").toString();
        try{
            reviewService.handleUserReview(userActivity,reviewId);
            return new ResponseMessage("1", "评分成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "评分失败");
        }
    }

    @PutMapping("/handleteamreview")
    public ResponseMessage handleTeamReview(@RequestBody TeamActivity teamActivity)
    {
        String reviewId = redisUtil.get("reviewId").toString();
        try{
            reviewService.handleTeamReview(teamActivity,reviewId);
            return new ResponseMessage("1", "评分成功");
        }catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "评分失败");
        }

    }
}


