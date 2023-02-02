package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ActivityMapper;
import com.ruoyi.system.domain.Activity;
import com.ruoyi.system.service.IActivityService;

/**
 * ActivityService业务层处理
 *
 * @author ruoyi
 * @date 2022-12-06
 */
@Service
public class ActivityServiceImpl implements IActivityService
{
    @Autowired
    private ActivityMapper activityMapper;

    /**
     * 查询Activity
     *
     * @param activityId Activity主键
     * @return Activity
     */
    @Override
    public Activity selectActivityByActivityId(String activityId)
    {
        return activityMapper.selectActivityByActivityId(activityId);
    }

    /**
     * 查询Activity列表
     *
     * @param activity Activity
     * @return Activity
     */
    @Override
    public List<Activity> selectActivityList(String competitionId)
    {
        return activityMapper.selectActivityList(competitionId);
    }

    /**
     * 新增Activity
     *
     * @param activity Activity
     * @return 结果
     */
    @Override
    public int insertActivity(Activity activity)
    {
        return activityMapper.insertActivity(activity);
    }

    /**
     * 修改Activity
     *
     * @param activity Activity
     * @return 结果
     */
    @Override
    public int updateActivity(Activity activity)
    {
        return activityMapper.updateActivity(activity);
    }

    /**
     * 批量删除Activity
     *
     * @param activityIds 需要删除的Activity主键
     * @return 结果
     */
    @Override
    public int deleteActivityByActivityIds(String[] activityIds)
    {
        return activityMapper.deleteActivityByActivityIds(activityIds);
    }

    /**
     * 删除Activity信息
     *
     * @param activityId Activity主键
     * @return 结果
     */
    @Override
    public int deleteActivityByActivityId(String activityId)
    {
        return activityMapper.deleteActivityByActivityId(activityId);
    }
}
