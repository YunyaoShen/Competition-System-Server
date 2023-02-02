package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Activity;

/**
 * ActivityMapper接口
 *
 * @author ruoyi
 * @date 2022-12-06
 */
public interface ActivityMapper
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
     * @param  Activity
     * @return Activity集合
     */
    public List<Activity> selectActivityList(String competitionId);

    public Activity selectActivityFirst(String competitionId);
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
     * 删除Activity
     *
     * @param activityId Activity主键
     * @return 结果
     */
    public int deleteActivityByActivityId(String activityId);

    /**
     * 批量删除Activity
     *
     * @param activityIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteActivityByActivityIds(String[] activityIds);
}
