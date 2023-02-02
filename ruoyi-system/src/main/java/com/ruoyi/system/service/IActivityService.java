package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Activity;

/**
 * ActivityService接口
 *
 * @author ruoyi
 * @date 2022-12-06
 */
public interface IActivityService
{
    /**
     * 查询Activity
     *
     * @param activityId Activity主键
     * @return Activity
     */
    public Activity selectActivityByActivityId(String activityId);

    /**
     * 查询Activity列表
     *
     * @param activity Activity
     * @return Activity集合
     */
    public List<Activity> selectActivityList(String competitionId);

    /**
     * 新增Activity
     *
     * @param activity Activity
     * @return 结果
     */
    public int insertActivity(Activity activity);

    /**
     * 修改Activity
     *
     * @param activity Activity
     * @return 结果
     */
    public int updateActivity(Activity activity);

    /**
     * 批量删除Activity
     *
     * @param activityIds 需要删除的Activity主键集合
     * @return 结果
     */
    public int deleteActivityByActivityIds(String[] activityIds);

    /**
     * 删除Activity信息
     *
     * @param activityId Activity主键
     * @return 结果
     */
    public int deleteActivityByActivityId(String activityId);
}
