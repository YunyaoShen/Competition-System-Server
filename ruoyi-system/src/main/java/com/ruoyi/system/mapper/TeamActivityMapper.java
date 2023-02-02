package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.TeamActivity;
import org.apache.ibatis.annotations.Param;

/**
 * useractivityMapper接口
 *
 * @author ruoyi
 * @date 2022-12-07
 */
public interface TeamActivityMapper
{
    /**
     * 查询useractivity
     *
     * @param teamId useractivity主键
     * @return useractivity
     */
    public TeamActivity selectTeamActivityByTeamIdANDActivityId(@Param("teamId") String teamId, @Param("activityId") String activityId);

    /**
     * 查询useractivity列表
     *
     * @param teamActivity useractivity
     * @return useractivity集合
     */
    public List<TeamActivity> selectTeamActivityList(String activityId);

    /**
     * 新增useractivity
     *
     * @param teamActivity useractivity
     * @return 结果
     */
    public int insertTeamActivity(TeamActivity teamActivity);

    /**
     * 修改useractivity
     *
     * @param teamActivity useractivity
     * @return 结果
     */
    public int updateTeamActivity(TeamActivity teamActivity);

    /**
     * 删除useractivity
     *
     * @param teamId useractivity主键
     * @return 结果
     */
    public int deleteTeamActivityByTeamIdANDActivityId(@Param("teamId") String teamId,@Param("activityId") String activityId);

    /**
     * 批量删除useractivity
     *
     * @param teamIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTeamActivityByTeamIds(String[] teamIds);
}

