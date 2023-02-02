package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.Competition;
import com.ruoyi.common.core.domain.entity.SysSuser;
import com.ruoyi.system.domain.CompetitionProcess;
import com.ruoyi.system.domain.UserCompetition;
import com.ruoyi.common.utils.CompetitionNotificationVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author :syy
 * @date :2022/12/18 15:19
 */
@Mapper
public interface CompetitionDao {
    /**
     * 通过竞赛id查询比赛详情
     *
     * @param competitionId
     * @return
     */
    Competition findCompetitionById(String competitionId);

    /**
     * 通过竞赛id删除比赛
     *
     * @param competitionId
     * @return
     */
    void deleteCompetitionById(String competitionId);

    /**
     * 插入新比赛
     *
     * @param competition
     * @return
     */
    void insertCompetition(Competition competition);

    /**
     * 修改竞赛通知及竞赛文件，竞赛内容
     *
     * @param competitionNotificationVO
     * @return
     */
    void updateCompetition(CompetitionNotificationVO competitionNotificationVO);

    void passUserBycompetitionIdANDuserId(@Param("competitionId") String competitionId,@Param("userId") Long userId);
    void passTeamBycompetitionIdANDteamId(@Param("competitionId") String competitionId,@Param("teamId") String teamId);

    void competitionAudit(@Param("competitionId")String competitionId,@Param("competitionState") Integer competitionState);



    /**
     * 查询所有比赛详情
     *
     * @return
     */
    List<Competition> findAllCompetition();

    /**
     * 根据比赛id获得参赛列表
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

    /**
     * 获取组队赛已报名竞赛列表
     * @param userId
     * @return
     */
    List<UserCompetition> findTeamCompetitionListByUserId(Long userId);


    List<CompetitionProcess> getUserCompetitionProcess(@Param("competitionId") String competitionId,@Param("userId") Long userId);

    List<CompetitionProcess> getTeamCompetitionProcess(@Param("competitionId") String competitionId,@Param("teamId") String teamId);
}
