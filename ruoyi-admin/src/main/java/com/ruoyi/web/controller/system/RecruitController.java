package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.system.domain.Team;
import com.ruoyi.common.core.domain.entity.SysSuser;
import com.ruoyi.system.domain.UserTeam;
import com.ruoyi.system.service.ISysSuserService;
import com.ruoyi.system.service.RecruitService;
import com.ruoyi.system.service.TeamService;
import com.ruoyi.common.utils.ResponseMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * 招募web层
 *
 * @author :syy
 * @date :2022/12/30 11:31
 */
@Controller
@RequestMapping("/system/recruit")
public class RecruitController extends BaseController  {
    @Autowired
    private RecruitService recruitService;
    @Autowired
    private TeamService teamService;

    @Autowired
    private ISysSuserService userService;
    /**
     * 根据队伍状态获取正在招募的队伍列表
     *
     * @return
     */
    @RequestMapping("/findAllRecruitTeam")
    public @ResponseBody
    ResponseMessage findAllRecruitTeam() {
        try {
            //队伍状态为1的为未满员，正在招募
            List<Team> teams = recruitService.findAllTeamByState(1);
            Long userId = getLoginUser().getUserId();
            SysSuser user = userService.selectUserById(userId);
            List<UserTeam> userTeams = recruitService.findAllUserTeam(user.getUserId());
            //存放未加入且正在招募的队伍
            List<Team> teams1 = new ArrayList<Team>();
            int i;
            for (Team team : teams) {
                for (i = 0; i < userTeams.size(); i++) {
                    if (team.getTeamId().equals(userTeams.get(i).getTeamId())) {
                        break;
                    }
                }
                if (i == userTeams.size()) {
                    teams1.add(team);
                }

            }
            ResponseMessage responseMessage = new ResponseMessage("1", "获取成功");
            responseMessage.getData().put("teams", teams1);
            return responseMessage;
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "获取失败");
        }
    }

    @RequestMapping("/recruitUser")
    public @ResponseBody
    ResponseMessage recruitUser(String teamId) {
        Team team = new Team();
        team.setTeamId(teamId);
        //设置队伍状态为1,即招募中
        team.setTeamState(1);
        try {
            teamService.updateTeam(team);
            return new ResponseMessage("1", "发起招募成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "发起招募失败");
        }

    }

    @RequestMapping("/cancelRecruit")
    public @ResponseBody
    ResponseMessage cancelRecruit(String teamId) {
        Team team = new Team();
        team.setTeamId(teamId);
        //设置队伍状态为0,即未招募
        team.setTeamState(0);
        try {
            teamService.updateTeam(team);
            return new ResponseMessage("1", "取消招募成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "取消招募失败");
        }

    }
}
