package com.ruoyi.system.service;

import com.ruoyi.system.domain.Competition;
import com.ruoyi.common.core.domain.entity.SysSuser;
import com.ruoyi.system.domain.CompetitionProcess;
import com.ruoyi.system.domain.UserCompetition;

import java.util.List;

/**
 * @author :syy
 * @date :2022/12/18 15:26
 */
public interface CompetitionService {
    /**
     * 通过竞赛id查询比赛详情
     *
     * @param competitionId
     * @return
     */
    Competition findCompetitionById(String competitionId);
    void passUser(String competitionId,Long userId);
    void passTeam(String competitionId,String teamId);

    List<CompetitionProcess> getUserCompetitionProcess(String competitionId,Long userId);
    List<CompetitionProcess> getTeamCompetitionProcess(String competitionId, String teamId);
    /**
     * 查询所有比赛详情
     *
     * @return
     */
    List<Competition> findAllCompetition();

    /**
     * 根据比赛id获得比赛列表
     *
     * @param competitionId
     * @return
     */
    List<SysSuser> findUserByCompetitionId(String competitionId);

    /**
     * 根据当前用户id获得已参加列表
     *
     * @param userId
     * @return
     */
    List<UserCompetition> findCompetitionListByUserId(Long userId);

    /**
     * 查询所有组队比赛列表
     *
     * @return
     */
    List<Competition> findAllTeamCompetition();

    /**
     * 通过竞赛id,查询报名该竞赛的用户列表
     *
     * @param competitionId
     * @return
     */
    List<UserCompetition> findUserList(String competitionId);
}
