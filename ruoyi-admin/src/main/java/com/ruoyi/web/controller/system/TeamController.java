package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.system.domain.Apply;
import com.ruoyi.system.domain.Team;
import com.ruoyi.common.core.domain.entity.SysSuser;
import com.ruoyi.system.service.TeamService;
import com.ruoyi.system.service.ISysSuserService;
import com.ruoyi.common.utils.RedisUtil;
import com.ruoyi.common.utils.ResponseMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * @author :syy
 * @date :2022/12/27 12:03
 */

@Controller
@RequestMapping("/system/team")
public class TeamController extends BaseController {
    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private TeamService teamService;

    @Autowired
    private ISysSuserService userService;
    /**
     * 创建队伍
     *
     * @param team
     * @return
     */
    @RequestMapping(value = "/addTeam", method = RequestMethod.POST)
    public @ResponseBody
    ResponseMessage addTeam(@RequestBody Team team) {
        //生成id
        team.setTeamId(UUID.randomUUID().toString());
        //获得当前用户
        Long userId = getLoginUser().getUserId();
        SysSuser user = userService.selectUserById(userId);
        //设置队长为创建该队伍的当前用户
        team.setCaptain(user);
        //初始人数为1
        team.setTeamHeadcount(1);
        //初始状态为0（未满人，但不处于招募）
        team.setTeamState(0);
        try {
            teamService.insertTeam(team);
            return new ResponseMessage("1", "创建成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "创建失败");
        }
    }

    /**
     * 获取当前用户创建的所有队伍
     *
     * @return
     */
    @RequestMapping("/findMyTeam")
    public @ResponseBody
    ResponseMessage findMyTeam() {
        Long userId = getLoginUser().getUserId();
        SysSuser user = userService.selectUserById(userId);
        try {
            List<Team> teams = teamService.findMyTeam(user.getUserId());
            ResponseMessage responseMessage = new ResponseMessage("1", "获取成功");
            responseMessage.getData().put("teams", teams);
            return responseMessage;
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "获取失败");
        }
    }

    /**
     * 获取当前用户加入的所有队伍
     *
     * @return
     */
    @RequestMapping("/findJoinTeam")
    public @ResponseBody
    ResponseMessage findJoinTeam() {
        Long userId = getLoginUser().getUserId();
        SysSuser user = userService.selectUserById(userId);
        try {
            List<Team> teams = teamService.findJoinTeam(user.getUserId());
            ResponseMessage responseMessage = new ResponseMessage("1", "获取成功");
            responseMessage.getData().put("teams", teams);
            return responseMessage;
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "获取失败");
        }
    }

    /**
     * 根据队伍id获得队伍其他成员信息
     *
     * @param teamId
     * @return
     */
    @RequestMapping("/findUsersByTeamId")
    public @ResponseBody
    ResponseMessage findUsersByTeamId(String teamId) {
        Long userId = getLoginUser().getUserId();
        SysSuser user = userService.selectUserById(userId);
        try {
            List<SysSuser> users = teamService.findUsersByTeamIdAndNotNowUser(teamId, user.getUserId());
            ResponseMessage responseMessage = new ResponseMessage("1", "获取成功");
            responseMessage.getData().put("users", users);
            return responseMessage;
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "获取失败");
        }
    }

    /**
     * 根据队伍信息修改数据库队伍数据
     *
     * @param team
     * @return
     */
    @RequestMapping(value = "/updateMyTeam")
    public @ResponseBody
    ResponseMessage updateMyTeam(@RequestBody Team team) {
        try {
            teamService.updateMyTeam(team);
            return new ResponseMessage("1", "修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "修改失败");
        }
    }

    /**
     * 删除队伍中的成员
     *
     * @param teamId
     * @param userId
     */
    @RequestMapping("/deleteTeamUser")
    public @ResponseBody
    ResponseMessage deleteTeamUser(String teamId, Long userId) {
        try {
            teamService.deleteTeamUser(teamId, userId);
            return new ResponseMessage("1", "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "删除失败");
        }
    }

    /**
     * 解散队伍，并清空队员
     *
     * @param teamId
     */
    @RequestMapping("/deleteTeam")
    public @ResponseBody
    ResponseMessage deleteTeam(String teamId) {
        try {
            teamService.deleteTeam(teamId);
            return new ResponseMessage("1", "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "删除失败");
        }
    }

    /**
     * 退出队伍
     *
     * @param teamId
     * @return
     */
    @RequestMapping("/exitTeam")
    public @ResponseBody
    ResponseMessage exitTeam(String teamId) {
        Long userId = getLoginUser().getUserId();
        SysSuser user = userService.selectUserById(userId);

        try {
            teamService.deleteTeamOneUser(teamId, user.getUserId());
            return new ResponseMessage("1", "退出成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "退出失败");
        }
    }

    @RequestMapping("/joinMyTeamList")
    public @ResponseBody
    ResponseMessage joinMyTeamList() {
        try {
            Long userId = getLoginUser().getUserId();
            SysSuser user = userService.selectUserById(userId);
            List<Team> teams = teamService.findMyTeam(user.getUserId());
            List<Apply> applies = teamService.findAllMyTeamApply(teams);
            ResponseMessage responseMessage = new ResponseMessage("1", "获取成功");
            responseMessage.getData().put("applies", applies);
            return responseMessage;
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "获取失败");
        }
    }

    @RequestMapping("/myDisposeList")
    public @ResponseBody
    ResponseMessage myDisposeList() {
        try {
            Long userId = getLoginUser().getUserId();
            SysSuser user = userService.selectUserById(userId);
            List<Team> teams = teamService.findMyTeam(user.getUserId());
            List<Apply> applies = teamService.findAllMyHistoryTeamApply(teams);
            ResponseMessage responseMessage = new ResponseMessage("1", "获取成功");
            responseMessage.getData().put("applies", applies);
            return responseMessage;
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "获取失败");
        }
    }

    @RequestMapping("/getMyTeamByCompetitionId")
    public @ResponseBody
    ResponseMessage getMyTeamByCompetitionId(String competitionId) {
        Long userId = getLoginUser().getUserId();
        SysSuser user = userService.selectUserById(userId);
        try {
            List<Team> teams = teamService.findMyTeam(user.getUserId());
            List<Team> teams1 = new ArrayList<Team>();
            if (teams.size() != 0 && teams != null) {
                for (Team team : teams) {
                    if (team.getCompetition().getCompetitionId().equals(competitionId)) {
                        teams1.add(team);
                    }
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

    @RequestMapping("/getTeamReportList")
    public @ResponseBody
    ResponseMessage getTeamReportList(String competitionId) {
        try {
            //根据竞赛id及已报名的状态（3），获取队伍列表
            List<Team> teams = teamService.findTeamByCompetitionIdAndRegistered(competitionId);
            ResponseMessage responseMessage = new ResponseMessage("1", "获取成功");
            responseMessage.getData().put("teams", teams);
            //将id放入缓存，供导出用
            redisUtil.set("competitionId", competitionId);
            return responseMessage;
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "获取失败");
        }
    }

    /**
     * 根据队伍id和队长id获取队伍所有成员信息
     *
     * @param teamId
     * @param captainId
     * @return
     */
    @RequestMapping("/getTeamMembers")
    public @ResponseBody
    ResponseMessage getTeamMembers(String teamId, Long captainId) {
        try {
            List<SysSuser> users = teamService.findUserListByTeamIdAndCaptainId(teamId, captainId);
            ResponseMessage responseMessage = new ResponseMessage("1", "获取成功");
            responseMessage.getData().put("users", users);
            return responseMessage;
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "获取失败");
        }
    }

}
