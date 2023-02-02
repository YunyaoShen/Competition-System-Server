package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.UserActivity;

/**
 * UserActivityService接口
 *
 * @author ruoyi
 * @date 2022-12-07
 */
public interface IUserActivityService
{
    /**
     * 查询UserActivity
     *
     * @param userId UserActivity主键
     * @return UserActivity
     */


    /**
     * 查询UserActivity列表
     *
     * @param userActivity UserActivity
     * @return UserActivity集合
     */
    public List<UserActivity> selectUserActivityList(String activityId);

    /**
     * 新增UserActivity
     *
     * @param userActivity UserActivity
     * @return 结果
     */
    public int insertUserActivity(UserActivity userActivity);

    /**
     * 修改UserActivity
     *
     * @param userActivity UserActivity
     * @return 结果
     */
    public int updateUserActivity(UserActivity userActivity);

    /**
     * 批量删除UserActivity
     *
     * @param userIds 需要删除的UserActivity主键集合
     * @return 结果
     */
    public int deleteUserActivityByUserIds(Long[] userIds);


}
