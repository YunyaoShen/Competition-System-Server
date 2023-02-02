package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.system.domain.Competition;
import com.ruoyi.system.domain.CompetitionProcess;
import com.ruoyi.system.domain.Team;
import com.ruoyi.common.core.domain.entity.SysSuser;
import com.ruoyi.system.domain.UserCompetition;
import com.ruoyi.system.service.CompetitionService;
import com.ruoyi.system.service.IActivityService;
import com.ruoyi.system.service.ISysSuserService;
import com.ruoyi.system.service.TeamService;
//import com.ruoyi.common.utils.POIUtils;
import com.ruoyi.common.utils.RedisUtil;
import com.ruoyi.common.utils.ResponseMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 */
@Controller
@RequestMapping("/system/competition")
public class CompetitionController extends BaseController {
    @Autowired
    private TeamService teamService;
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private CompetitionService competitionService;
    @Autowired
    private ISysSuserService userService;
    @Autowired
    private IActivityService activityService;

    /**
     * 根据比赛id获得比赛
     *
     * @param competitionId
     * @return
     */
    @RequestMapping("/findCompetitionById")
    public @ResponseBody
    ResponseMessage findCompetitionById(String competitionId) {
        try {
            Competition competition = competitionService.findCompetitionById(competitionId);
            ResponseMessage responseMessage = new ResponseMessage("1", "获取成功");
            responseMessage.getData().put("competition", competition);
            System.out.println(competition);
            return responseMessage;
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "获取失败");
        }
    }

    /**
     * 获得该竞赛已报名的用户列表
     *
     * @param competitionId
     * @return
     */
    @RequestMapping("/findUserByCompetitionId")
    public @ResponseBody
    ResponseMessage findUserByCompetitionId(String competitionId) {
        try {
            List<SysSuser> users = competitionService.findUserByCompetitionId(competitionId);
            ResponseMessage responseMessage = new ResponseMessage("1", "获取成功");
            responseMessage.getData().put("users", users);
            return responseMessage;
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "获取失败");
        }
    }

    /**
     * 获得所有比赛
     *
     * @return
     */
    @RequestMapping("/findAllCompetition")
    public @ResponseBody
    ResponseMessage findAllCompetition() {
        try {
            List<Competition> competitions = competitionService.findAllCompetition();
            ResponseMessage responseMessage = new ResponseMessage("1", "获取成功");
            responseMessage.getData().put("competitions", competitions);
            return responseMessage;
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "获取失败");
        }
    }

    /**
     * 根据当前用户id获得已参加的竞赛列表
     *
     * @return
     */
    @RequestMapping("/findCompetitionListByUserId")
    public @ResponseBody
    ResponseMessage findCompetitionListByUserId() {
        Long userId = getLoginUser().getUserId();
        SysSuser user = userService.selectUserById(userId);
        try {
            List<UserCompetition> userCompetitions = competitionService.findCompetitionListByUserId(user.getUserId());
            ResponseMessage responseMessage = new ResponseMessage("1", "获取成功");
            responseMessage.getData().put("userCompetitions", userCompetitions);
            return responseMessage;
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "获取失败");
        }
    }

    /**
     * 查询所有组队比赛
     *
     * @return
     */
    @RequestMapping("/findAllTeamCompetition")
    public @ResponseBody
    ResponseMessage findAllTeamCompetition() {
        try {
            List<Competition> competitions = competitionService.findAllTeamCompetition();
            System.out.println(competitions);
            ResponseMessage responseMessage = new ResponseMessage("1", "获取成功");
            responseMessage.getData().put("competitions", competitions);
            return responseMessage;
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "获取失败");
        }
    }

    /**
     * 通过竞赛id,查询报名该竞赛的用户列表
     *
     * @param competitionId
     * @return
     */
    @RequestMapping("/getUserReportList")
    public @ResponseBody
    ResponseMessage getUserReportList(String competitionId) {
        try {
            List<UserCompetition> usercompetitions = competitionService.findUserList(competitionId);
            ResponseMessage responseMessage = new ResponseMessage("1", "获取成功");
            responseMessage.getData().put("usercompetitions", usercompetitions);
            redisUtil.set("competitionId", competitionId);
            return responseMessage;
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "获取失败");
        }
    }


    @RequestMapping("/passUser")
    public @ResponseBody
    ResponseMessage passUser(String competitionId,Long userId) {
        try {
            if(activityService.selectActivityList(competitionId).size()>0){
                competitionService.passUser(competitionId,userId);
                return new ResponseMessage("1", "审核通过");
            }else{
                return new ResponseMessage("0", "请检查是否建立赛程");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "审核失败请联系管理员");
        }
    }

    @RequestMapping("/passTeam")
    public @ResponseBody
    ResponseMessage passTeam(String competitionId,String teamId) {
        try {
            if(activityService.selectActivityList(competitionId).size()>0){
                competitionService.passTeam(competitionId,teamId);
                return new ResponseMessage("1", "审核通过");
            }else{
                return new ResponseMessage("0", "请检查是否建立赛程");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "审核失败请联系管理员");
        }
    }

    @RequestMapping("/getCompetitionProcess")
    public @ResponseBody
    ResponseMessage getUserCompetitionProcess(String competitionId) {
        try {
            Long userId = getLoginUser().getUserId();
            Competition competition = competitionService.findCompetitionById(competitionId);
            if(competition.getCompetitionPeopleSum()==1){
                List<CompetitionProcess> competitionProcesses = competitionService.getUserCompetitionProcess(competitionId,userId);
                ResponseMessage responseMessage = new ResponseMessage("1", "获取成功");
                responseMessage.getData().put("competitionProcesses", competitionProcesses);
                return responseMessage;
            }else{
                Team team = teamService.findTeamByCaptainIdAndCompetitionId(userId,competitionId);
                String teamId = team.getTeamId();
                List<CompetitionProcess> competitionProcesses = competitionService.getTeamCompetitionProcess(competitionId,teamId);
                ResponseMessage responseMessage = new ResponseMessage("1", "获取成功");
                responseMessage.getData().put("competitionProcesses", competitionProcesses);
                return responseMessage;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "获取失败");
        }
    }

//    @RequestMapping("/teamCompetitionProcess")
//    public @ResponseBody
//    ResponseMessage getTeamCompetitionProcess(String competitionId, String teamId) {
//        try {
//            List<CompetitionProcess> competitionProcesses = competitionService.getTeamCompetitionProcess(competitionId,teamId);
//            ResponseMessage responseMessage = new ResponseMessage("1", "获取成功");
//            responseMessage.getData().put("competitionProcesses", competitionProcesses);
//            return responseMessage;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return new ResponseMessage("0", "获取失败");
//        }
//    }

//    @GetMapping("/export")
//    public ResponseEntity<byte[]> exportData() {
//        List<User> list = (List<User>) competitionService.findUserList(redisUtil.get("competitionId").toString());
//        return POIUtils.userExcel(list);
//    }
//
//    @GetMapping("/exportTeam")
//    public ResponseEntity<byte[]> exportTeamData() {
//        //根据竞赛id及已报名的状态（3），获取队伍列表
//        List<Team> teamList = teamService.findTeamByCompetitionIdAndRegistered(redisUtil.get("competitionId").toString());
//        for (Team team : teamList) {
//            //获取队伍成员放入队伍
//            team.setUsers(teamService.findUserListByTeamIdAndCaptainId(team.getTeamId(), team.getCaptain().getUserId()));
//        }
//        return POIUtils.teamExcel(teamList);
//    }

}
