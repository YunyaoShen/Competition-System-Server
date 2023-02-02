package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.TeamActivity;

/**
 * useractivityService接口
 *
 * @author ruoyi
 * @date 2022-12-07
 */
public interface ITeamActivityService
{


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
     * 批量删除useractivity
     *
     * @param teamIds 需要删除的useractivity主键集合
     * @return 结果
     */
    public int deleteTeamActivityByTeamIds(String[] teamIds);



}
