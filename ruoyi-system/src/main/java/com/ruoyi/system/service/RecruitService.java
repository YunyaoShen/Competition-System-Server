package com.ruoyi.system.service;

import com.ruoyi.system.domain.Team;
import com.ruoyi.system.domain.UserTeam;

import java.util.List;

/**
 * @author :syy
 * @date :2022/12/30 11:37
 */
public interface RecruitService {

    /**
     * 根据队伍状态获取队伍列表
     *
     * @param teamState
     * @return
     */
    public List<Team> findAllTeamByState(Integer teamState);

    /**
     * 查询该用户的所有加入的队伍列表
     *
     * @param userId
     * @return
     */
    List<UserTeam> findAllUserTeam(Long userId);
}
