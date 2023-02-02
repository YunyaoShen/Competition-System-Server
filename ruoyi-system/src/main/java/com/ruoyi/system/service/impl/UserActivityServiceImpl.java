package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.UserActivityMapper;
import com.ruoyi.system.domain.UserActivity;
import com.ruoyi.system.service.IUserActivityService;

/**
 * UserActivityService业务层处理
 *
 * @author ruoyi
 * @date 2022-12-07
 */
@Service
public class UserActivityServiceImpl implements IUserActivityService
{
    @Autowired
    private UserActivityMapper userActivityMapper;

    /**
     * 查询UserActivity
     *
     * @param userId UserActivity主键
     * @return UserActivity
     */


    /**
     * 查询UserActivity列表
     *
     * @param
     * @return UserActivity
     */
    @Override
    public List<UserActivity> selectUserActivityList(String activityId)
    {
        return userActivityMapper.selectUserActivityList(activityId);
    }

    /**
     * 新增UserActivity
     *
     * @param userActivity UserActivity
     * @return 结果
     */
    @Override
    public int insertUserActivity(UserActivity userActivity)
    {
        return userActivityMapper.insertUserActivity(userActivity);
    }

    /**
     * 修改UserActivity
     *
     * @param userActivity UserActivity
     * @return 结果
     */
    @Override
    public int updateUserActivity(UserActivity userActivity)
    {
        return userActivityMapper.updateUserActivity(userActivity);
    }

    /**
     * 批量删除UserActivity
     *
     * @param userIds 需要删除的UserActivity主键
     * @return 结果
     */
    @Override
    public int deleteUserActivityByUserIds(Long[] userIds)
    {
        return userActivityMapper.deleteUserActivityByUserIds(userIds);
    }

    /**
     * 删除UserActivity信息
     *
     * @param userId UserActivity主键
     * @return 结果
     */

}
