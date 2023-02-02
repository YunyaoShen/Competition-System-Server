package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.UserActivity;
import org.apache.ibatis.annotations.Param;

/**
 * UserActivityMapper接口
 *
 * @author ruoyi
 * @date 2022-12-07
 */
public interface UserActivityMapper
{
    /**
     * 查询UserActivity
     *
     * @param userId UserActivity主键
     * @return UserActivity
     */
    public UserActivity selectUserActivityByUserIdANDActivityId(@Param("userId") Long userId,@Param("activityId") String activityId);

    /**
     * 查询UserActivity列表
     *
     * @param
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
     * 删除UserActivity
     *
     * @param userId UserActivity主键
     * @return 结果
     */
    public int deleteUserActivityByUserIdANDActivityId(@Param("userId") Long userId,@Param("activityId") String activityId);

    /**
     * 批量删除UserActivity
     *
     * @param userIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteUserActivityByUserIds(Long[] userIds);
}
