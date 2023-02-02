package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.Team;
import com.ruoyi.system.domain.UserTeam;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author :syy
 * @date :2022/12/30 11:39
 */

@Mapper
public interface RecruitDao {
    /**
     * 根据队伍状态获取队伍列表
     *
     * @param teamState
     * @param captainId
     * @return
     */
    public List<Team> findAllTeamByState(@Param("teamState") Integer teamState, @Param("captainId") Long captainId);

    /**
     * 查询该用户的所有加入的队伍列表
     *
     * @param userId
     * @return
     */
    List<UserTeam> findAllUserTeam(Long userId);
}
