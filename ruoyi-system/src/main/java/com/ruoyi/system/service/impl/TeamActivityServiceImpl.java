package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.TeamActivityMapper;
import com.ruoyi.system.domain.TeamActivity;
import com.ruoyi.system.service.ITeamActivityService;

/**
 * useractivityService业务层处理
 *
 * @author ruoyi
 * @date 2022-12-07
 */
@Service
public class TeamActivityServiceImpl implements ITeamActivityService
{
    @Autowired
    private TeamActivityMapper teamActivityMapper;

    /**
     * 查询useractivity
     *
     * @param teamId useractivity主键
     * @return useractivity
     */


    /**
     * 查询useractivity列表
     *
     * @param teamActivity useractivity
     * @return useractivity
     */
    @Override
    public List<TeamActivity> selectTeamActivityList(String activityId)
    {
        return teamActivityMapper.selectTeamActivityList(activityId);
    }

    /**
     * 新增useractivity
     *
     * @param teamActivity useractivity
     * @return 结果
     */
    @Override
    public int insertTeamActivity(TeamActivity teamActivity)
    {
        return teamActivityMapper.insertTeamActivity(teamActivity);
    }

    /**
     * 修改useractivity
     *
     * @param teamActivity useractivity
     * @return 结果
     */
    @Override
    public int updateTeamActivity(TeamActivity teamActivity)
    {
        return teamActivityMapper.updateTeamActivity(teamActivity);
    }

    /**
     * 批量删除useractivity
     *
     * @param teamIds 需要删除的useractivity主键
     * @return 结果
     */
    @Override
    public int deleteTeamActivityByTeamIds(String[] teamIds)
    {
        return teamActivityMapper.deleteTeamActivityByTeamIds(teamIds);
    }

    /**
     * 删除useractivity信息
     *
     * @param teamId useractivity主键
     * @return 结果
     */

}
