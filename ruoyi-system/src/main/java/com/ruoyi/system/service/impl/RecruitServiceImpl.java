package com.ruoyi.system.service.impl;

import com.ruoyi.system.mapper.RecruitDao;
import com.ruoyi.system.domain.Team;
import com.ruoyi.common.core.domain.entity.SysSuser;
import com.ruoyi.system.domain.UserTeam;
import com.ruoyi.system.service.ISysSuserService;
import com.ruoyi.system.service.RecruitService ;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.utils.SecurityUtils;
import java.util.List;


@Service
public class RecruitServiceImpl implements RecruitService {
    @Autowired
    private RecruitDao recruitDao;
    @Autowired
    private ISysSuserService userService;
    @Override
    public List<Team> findAllTeamByState(Integer teamState) {
        Long userId = SecurityUtils.getLoginUser().getUserId();
        SysSuser user = userService.selectUserById(userId);
        List<Team> teams = recruitDao.findAllTeamByState(teamState, user.getUserId());
        return teams;
    }

    @Override
    public List<UserTeam> findAllUserTeam(Long userId) {
        List<UserTeam> userTeams = recruitDao.findAllUserTeam(userId);
        return userTeams;
    }
}
