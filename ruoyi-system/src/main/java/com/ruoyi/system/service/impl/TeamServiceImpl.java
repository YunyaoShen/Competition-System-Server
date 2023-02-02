package com.ruoyi.system.service.impl;

import com.ruoyi.system.mapper.ApplyDao;
import com.ruoyi.system.mapper.TeamDao ;
import com.ruoyi.system.domain.Apply;
import com.ruoyi.system.domain.Team;
import com.ruoyi.common.core.domain.entity.SysSuser;
import com.ruoyi.system.service.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @author :syy
 * @date :2022/12/27 12:13
 */
@Service
public class TeamServiceImpl implements TeamService {
    @Autowired
    private TeamDao teamDao;
    @Autowired
    private ApplyDao applyDao;

    @Transactional(isolation = Isolation.REPEATABLE_READ, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    @Override
    public void insertTeam(Team team) {
        teamDao.insertTeam(team);
        //将自己增加到队伍中
        teamDao.insertUserTeam(team.getTeamId(), team.getCaptain().getUserId());
    }

    @Override
    public List<Team> findMyTeam(Long userId) {
        List<Team> teams = teamDao.findMyTeam(userId);
        return teams;
    }

    @Override
    public List<SysSuser> findUsersByTeamIdAndNotNowUser(String teamId, Long userId) {
        List<SysSuser> users = teamDao.findUsersByTeamIdAndNotNowUser(teamId, userId);
        return users;
    }

    @Override
    public void updateMyTeam(Team team) {
        teamDao.updateMyTeam(team);
    }

    @Transactional(isolation = Isolation.REPEATABLE_READ, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    @Override
    public void deleteTeamUser(String teamId, Long userId) {
        teamDao.deleteTeamUser(teamId, userId);
        Team team = teamDao.findTeamById(teamId);
        //判断当前队伍状态,如果为已满人，修改队伍状态，反之不修改
        if (team.getTeamState() == 2 ) {
            team.setTeamState(1);
        }
        //队伍人数减1
        team.setTeamHeadcount(team.getTeamHeadcount() - 1);
        teamDao.updateTeamStateAndHeadCount(team);
    }

    @Transactional(isolation = Isolation.REPEATABLE_READ, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    @Override
    public void deleteTeam(String teamId) {
        //通过队伍id删除所有队员
        teamDao.deleteTeamUserByTeamId(teamId);
        //删除所有申请
        applyDao.deleteApplyByTeamId(teamId);
        teamDao.deleteTeam(teamId);
    }

    @Override
    public List<Team> findJoinTeam(Long userId) {
        List<Team> teams = teamDao.findJoinTeam(userId);
        return teams;
    }

    @Transactional(isolation = Isolation.REPEATABLE_READ, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    @Override
    public void deleteTeamOneUser(String teamId, Long userId) {
        teamDao.deleteTeamUser(teamId, userId);
        //获得当前队伍
        Team team = teamDao.findTeamById(teamId);
        //判断当前队伍状态,如果为已满人或已报名，修改队伍状态，反之不修改
        if (team.getTeamState() == 2 ) {
            team.setTeamState(1);
        }
        //队伍人数减1
        team.setTeamHeadcount(team.getTeamHeadcount() - 1);
        teamDao.updateTeamStateAndHeadCount(team);
    }

    @Override
    public List<Apply> findAllMyTeamApply(List<Team> teams) {
        if (teams == null || teams.size() == 0) {
            return null;
        }
        List<Apply> applies = teamDao.findAllMyTeamApply(teams);
        return applies;
    }

    @Override
    public List<Apply> findAllMyHistoryTeamApply(List<Team> teams) {
        if (teams == null || teams.size() == 0) {
            return null;
        }
        //获取审批过的申请列表
        List<Apply> applies = teamDao.findAllMyDispose(teams);
        return applies;
    }

    @Override
    public void updateTeam(Team team) {
        teamDao.updateTeam(team);
    }

    @Override
    public Team findTeamByCaptainIdAndCompetitionId(Long userId, String competitionId) {
        Team team = teamDao.findTeamByCaptainIdAndCompetitionId(userId, competitionId);
        return team;
    }

    @Override
    public void updateTeamCancelApply(String teamId) {
        teamDao.updateTeamCancelApply(teamId);
    }

    @Override
    public List<Team> findTeamByCompetitionIdAndRegistered(String competitionId) {
        List<Team> teams = teamDao.findTeamByCompetitionIdAndRegistered(competitionId);
        return teams;
    }

    @Override
    public List<SysSuser> findUserListByTeamIdAndCaptainId(String teamId, Long captainId) {

        List<SysSuser> users = new ArrayList<SysSuser>();
        //获取队伍成员信息
        List<SysSuser> users1 = teamDao.findUserListByTeamId(teamId);
        System.out.println(users1);
        System.out.println(users1.size());
        for (SysSuser user : users1) {
            users.add(user);
        }
        return users;
    }
}
