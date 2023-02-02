package com.ruoyi.system.service;

import com.ruoyi.system.domain.Apply;
import com.ruoyi.system.domain.Team;
import com.ruoyi.common.core.domain.entity.SysSuser;

import java.util.List;

/**
 * @author :syy
 * @date :2022/12/27 12:12
 */
public interface TeamService {

    /**
     * 保存新创建队伍信息
     *
     * @param team
     * @return
     */
    public void insertTeam(Team team);

    /**
     * 获取当前用户创建的所有队伍
     *
     * @param userId
     * @return
     */
    List<Team> findMyTeam(Long userId);

    /**
     * 根据队伍id和自己的id获得除自己以外的成员列表
     *
     * @param teamId
     * @param userId
     * @return
     */
    List<SysSuser> findUsersByTeamIdAndNotNowUser(String teamId, Long userId);

    /**
     * 根据队伍信息修改数据库队伍数据
     *
     * @param team
     * @return
     */
    void updateMyTeam(Team team);

    /**
     * 删除队伍中的成员
     *
     * @param teamId
     * @param userId
     */
    void deleteTeamUser(String teamId, Long userId);

    /**
     * 解散队伍，并清空队员
     *
     * @param teamId
     */
    void deleteTeam(String teamId);

    /**
     * 获取当前用户加入的所有队伍
     *
     * @param userId
     * @return
     */
    List<Team> findJoinTeam(Long userId);

    /**
     * 根据用户id和比赛id删除一个队伍成员
     *
     * @param teamId
     * @param userId
     */
    void deleteTeamOneUser(String teamId, Long userId);

    /**
     * 根据用户所有比赛获取所有处于正在申请状态申请
     *
     * @param teams
     * @return
     */
    List<Apply> findAllMyTeamApply(List<Team> teams);

    /**
     * 根据用户所有比赛获取该用户处理的所有通过或拒绝的申请
     *
     * @param teams
     * @return
     */
    List<Apply> findAllMyHistoryTeamApply(List<Team> teams);

    /**
     * 报名，修改队伍信息
     *
     * @param team
     */
    void updateTeam(Team team);

    /**
     * 根据用户id和竞赛id获取队伍
     *
     * @param userId
     * @param competitionId
     * @return
     */
    Team findTeamByCaptainIdAndCompetitionId(Long userId, String competitionId);

    /**
     * 取消队伍报名
     *
     * @param teamId
     */
    void updateTeamCancelApply(String teamId);

    /**
     * 根据竞赛id及已报名的状态（3），获取队伍列表
     *
     * @param competitionId
     * @return
     */
    List<Team> findTeamByCompetitionIdAndRegistered(String competitionId);

    /**
     * 根据队伍id和队长id获取队伍所有成员信息
     *
     * @param teamId
     * @param captainId
     * @return
     */
    List<SysSuser> findUserListByTeamIdAndCaptainId(String teamId, Long captainId);
}
