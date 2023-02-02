package com.ruoyi.system.service.impl;

import com.ruoyi.system.domain.*;
import com.ruoyi.system.mapper.*;
import com.ruoyi.common.core.domain.entity.SysSuser;
import com.ruoyi.system.service.CompetitionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author :syy
 * @date :2022/12/18 15:27
 */
@Service
public class CompetitionServiceImpl implements CompetitionService {
    @Autowired
    private CompetitionDao competitionDao;

    @Autowired
    private FileDao fileDao;

    @Autowired
    private ActivityMapper activityMapper;
    @Autowired
    private UserActivityMapper userActivityMapper;

    @Autowired
    TeamActivityMapper teamActivityMapper;

    @Override
    public Competition findCompetitionById(String competitionId) {
        Competition competition = competitionDao.findCompetitionById(competitionId);
        return competition;
    }

    @Override
    public void passUser(String competitionId,Long userId){
        competitionDao.passUserBycompetitionIdANDuserId(competitionId,userId);
        Activity activity = activityMapper.selectActivityFirst(competitionId);
        UserActivity userActivity = new UserActivity();
        userActivity.setActivityId(activity.getActivityId());
        userActivity.setUserId(userId);
        userActivity.setDate(System.currentTimeMillis());
        userActivity.setActivityState(0);
        userActivityMapper.insertUserActivity(userActivity);
    }

    @Override
    public void passTeam(String competitionId,String teamId){
        competitionDao.passTeamBycompetitionIdANDteamId(competitionId,teamId);
        Activity activity = activityMapper.selectActivityFirst(competitionId);
        TeamActivity teamActivity = new TeamActivity();
        teamActivity.setActivityId(activity.getActivityId());
        teamActivity.setTeamId(teamId);
        teamActivity.setDate(System.currentTimeMillis());
        teamActivity.setActivityState(0);
        teamActivityMapper.insertTeamActivity(teamActivity);
    }


    @Override
    public List<Competition> findAllCompetition() {
        List<Competition> competitions = competitionDao.findAllCompetition();
        return competitions;
    }


    @Override
    public List<CompetitionProcess> getUserCompetitionProcess(String competitionId,Long userId) {
        List<CompetitionProcess> competitionProcesses = competitionDao.getUserCompetitionProcess(competitionId,userId);
        return competitionProcesses;
    }

    @Override
    public List<CompetitionProcess> getTeamCompetitionProcess(String competitionId,String teamId) {
        List<CompetitionProcess> competitionProcesses = competitionDao.getTeamCompetitionProcess(competitionId,teamId);
        return competitionProcesses;
    }

    @Override
    public List<SysSuser> findUserByCompetitionId(String competitionId) {
        List<SysSuser> users = competitionDao.findUserByCompetitionId(competitionId);
        return users;
    }

    @Override
    public List<UserCompetition> findCompetitionListByUserId(Long userId) {
        List<UserCompetition> competitions = competitionDao.findCompetitionListByUserId(userId);
        //获取组队赛已报名列表
        List<UserCompetition> competitions1 = competitionDao.findTeamCompetitionListByUserId(userId);
        System.out.println("------------" + competitions1);
        competitions.addAll(competitions1);
        return competitions;
    }

    @Override
    public List<Competition> findAllTeamCompetition() {
        List<Competition> competitions = competitionDao.findAllTeamCompetition();
        return competitions;
    }

    @Override
    public List<UserCompetition> findUserList(String competitionId) {
        List<UserCompetition> usercompetitions = competitionDao.findUserList(competitionId);
        return usercompetitions;
    }

}
