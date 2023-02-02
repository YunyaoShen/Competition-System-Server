package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.Apply;
import com.ruoyi.system.domain.Team;
import com.ruoyi.common.core.domain.entity.SysSuser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author :syy
 * @date :2022/12/27 12:14
 */
@Mapper
public interface TeamDao {
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
    List<SysSuser> findUsersByTeamIdAndNotNowUser(@Param("teamId")String teamId, @Param("userId")Long userId);

    /**
     * 根据队伍id和自己的id增加到队伍中
     *
     * @param teamId
     * @param userId
     * @return
     */
    void insertUserTeam(@Param("teamId")String teamId, @Param("userId")Long userId);

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
    void deleteTeamUser(@Param("teamId")String teamId, @Param("userId")Long userId);

    /**
     * 解散队伍，并清空队员
     *
     * @param teamId
     */
    void deleteTeam(String teamId);

    /**
     * 通过队伍id删除所有队员
     *
     * @param teamId
     */
    void deleteTeamUserByTeamId(String teamId);

    /**
     * 获取当前用户加入的所有队伍
     *
     * @param userId
     * @return
     */
    List<Team> findJoinTeam(Long userId);

    /**
     * 根据用户所有比赛获取所有已处理的申请
     *
     * @param teams
     * @return
     */
    List<Apply> findAllMyDispose(List<Team> teams);

    /**
     * 根据用户所有比赛获取所有待处理的申请
     *
     * @param teams
     * @return
     */
    List<Apply> findAllMyTeamApply(List<Team> teams);

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
    Team findTeamByCaptainIdAndCompetitionId(@Param("userId")Long userId, @Param("competitionId")String competitionId);

    /**
     * 取消队伍报名
     *
     * @param teamId
     */
    void updateTeamCancelApply(String teamId);

    /**
     * 修改队伍的状态和人数
     *
     * @param team
     */
    void updateTeamStateAndHeadCount(Team team);

    /**
     * 根据竞赛id及已报名的状态（3），获取队伍列表
     *
     * @param competitionId
     * @return
     */
    List<Team> findTeamByCompetitionIdAndRegistered(String competitionId);

    /**
     * 修改队伍人数 为当前人数-1
     *
     * @param teamId
     */
    void updateTeamHeadcount(String teamId);

    /**
     * 根据队伍id获取除队长以外的队员信息
     *
     * @param teamId
     * @return
     */
    List<SysSuser> findUserListByTeamId(String teamId);

    /**
     * 根据id查询队伍
     *
     * @param teamId
     * @return
     */
    Team findTeamById(String teamId);
}
