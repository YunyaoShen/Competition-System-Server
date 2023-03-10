package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.entity.SysSuser;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.service.ApplyService;
import com.ruoyi.system.service.ISysSuserService;
import com.ruoyi.system.service.TeamService;
import com.ruoyi.common.utils.ResponseMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.UUID;

/**
 * 报名，申请web层
 *
 * @author :syy
 * @date :2022/12/18 16:40
 */
@Controller
@RequestMapping("/system/apply")
public class ApplyController extends BaseController {
    @Autowired
    private ApplyService applyService;

    @Autowired
    private TeamService teamService;

    @Autowired
    private ISysSuserService userService;



    /**
     * 个人赛报名
     *
     * @param competitionId
     * @return
     */
    @RequestMapping("/doApply")
    public @ResponseBody
    ResponseMessage doApply(String competitionId) {
        //创建中间表对象，封装报名信息
        UserCompetition userCompetition = new UserCompetition();
        Competition competition = new Competition();
        competition.setCompetitionId(competitionId);
        userCompetition.setCompetition(competition);
        Long userId = getLoginUser().getUserId();
        SysSuser user = userService.selectUserById(userId);
        userCompetition.setUser(user);
        userCompetition.setAuditState(0);
        //获取当前时间毫秒值,并存入封装对象
        userCompetition.setDate(System.currentTimeMillis());
        try {
            applyService.insertApply(userCompetition);
            return new ResponseMessage("1", "报名成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "报名失败");
        }

    }

    /**
     * 组队赛报名
     *
     * @param teamId
     * @return
     */
    @RequestMapping("/doApplyByTeam")
    public @ResponseBody
    ResponseMessage doApplyByTeam(String teamId) {
        //创建队伍对象，封装id和报名时间,队伍状态
        Team team = new Team();
        team.setTeamId(teamId);
        //设置队伍状态为3,即已报名
        team.setTeamState(3);
        team.setApplyTime(System.currentTimeMillis());
        team.setAuditState(0);
        try {
            teamService.updateTeam(team);
            return new ResponseMessage("1", "报名成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "报名失败");
        }
    }

    /**
     * 个人赛取消报名
     *
     * @param competitionId
     * @return
     */
    @RequestMapping("/cancelApply")
    public @ResponseBody
    ResponseMessage cancelApply(String competitionId) {
        //创建中间表对象，封装报名信息
        UserCompetition userCompetition = new UserCompetition();
        Competition competition = new Competition();
        competition.setCompetitionId(competitionId);
        userCompetition.setCompetition(competition);
        Long userId = getLoginUser().getUserId();
        SysSuser user = userService.selectUserById(userId);
        userCompetition.setUser(user);
        try {
            applyService.deleteApply(userCompetition);
            return new ResponseMessage("1", "取消报名成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "取消报名失败");
        }

    }

    /**
     * 管理员取消用户报名
     *
     * @param userCompetition
     * @return
     */
    @RequestMapping(value = "/adminCancelApply", method = RequestMethod.POST)
    public @ResponseBody
    ResponseMessage adminCancelApply(@RequestBody UserCompetition userCompetition) {
        System.out.println(userCompetition);
        try {
            applyService.deleteApply(userCompetition);
            return new ResponseMessage("1", "取消报名成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "取消报名失败");
        }

    }

    /**
     * 组队赛取消报名
     *
     * @param competitionId
     * @return
     */
    @RequestMapping("/cancelTeamApply")
    public @ResponseBody
    ResponseMessage cancelTeamApply(String competitionId) {
        Long userId = getLoginUser().getUserId();
        SysSuser user = userService.selectUserById(userId);
        try {
            Team team = teamService.findTeamByCaptainIdAndCompetitionId(user.getUserId(), competitionId);
            if (team != null && team.getApplyTime() != null) {
                if (team.getCaptain().getUserId().equals(user.getUserId())) {
                    teamService.updateTeamCancelApply(team.getTeamId());
                    return new ResponseMessage("1", "取消报名成功");
                } else {//非队长取消报名
                    return new ResponseMessage("1", "取消报名失败，队员无权取消报名，请联系队长");
                }
            } else {
                return new ResponseMessage("0", "未报名，取消报名失败");
            }

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "取消报名失败");
        }
    }

    /**
     * 管理员取消组队赛报名
     *
     * @param teamId
     * @return
     */
    @RequestMapping("/adminCancelTeamApply")
    public @ResponseBody
    ResponseMessage adminCancelTeamApply(String teamId) {
        try {
            Team team = new Team();
            team.setTeamId(teamId);
            team.setTeamState(2);
            System.out.println(team);
            teamService.updateTeam(team);
            return new ResponseMessage("1", "取消报名成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "取消报名失败");
        }
    }

    /**
     * 获得该用户对于该竞赛的的报名状态/已报名/未报名
     *
     * @param competitionId
     * @return
     */
    @RequestMapping("/loadApplyState")
    public @ResponseBody
    ResponseMessage loadApplyState(String competitionId) {
        //创建中间表对象，封装报名信息
        UserCompetition userCompetition = new UserCompetition();
        Competition competition = new Competition();
        competition.setCompetitionId(competitionId);
        userCompetition.setCompetition(competition);
        Long userId = getLoginUser().getUserId();
        SysSuser user = userService.selectUserById(userId);
        userCompetition.setUser(user);
        try {
            UserCompetition uc = applyService.findApplyByUserIdAndCompetitionId(userCompetition);
            ResponseMessage responseMessage = new ResponseMessage("1", "加载成功");
            responseMessage.getData().put("userCompetition", uc);
            return responseMessage;
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "加载失败");
        }

    }

    /**
     * 获得该队伍对于该竞赛的的报名状态/已报名/未报名
     *
     * @param competitionId
     * @return
     */
    @RequestMapping("/loadTeamApplyState")
    public @ResponseBody
    ResponseMessage loadTeamApplyState(String competitionId) {
        try {
            Long userId = getLoginUser().getUserId();
            SysSuser user = userService.selectUserById(userId);
            Team team = teamService.findTeamByCaptainIdAndCompetitionId(user.getUserId(), competitionId);
            if (team != null && team.getApplyTime() != null) {
                ResponseMessage responseMessage = new ResponseMessage("2", "有已报名该比赛队伍");
                responseMessage.getData().put("team", team);
                return responseMessage;
            }
            return new ResponseMessage("1", "无已报名该比赛队伍");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "加载失败");
        }

    }

    /**
     * 发起加入队伍申请
     *
     * @param apply
     * @return
     */
    @RequestMapping(value = "/joinTeam", method = RequestMethod.POST)
    public @ResponseBody
    ResponseMessage joinTeam(@RequestBody Apply apply) {
        Long userId = getLoginUser().getUserId();
        SysSuser user = userService.selectUserById(userId);
        apply.setUser(user);
        apply.setApplyState(0);
        //判断是否有正在加入该队伍的申请
        if (applyService.findApplyByUserIdAndApplyStateAndTeamId(apply)) {
            return new ResponseMessage("-1", "您有正在申请加入该队伍的申请，请前往“我的比赛·队伍 -> 我的申请”查看");
        }
        apply.setApplyId(UUID.randomUUID().toString());
        apply.setApplyTime(System.currentTimeMillis());
        try {
            applyService.insertTeamApply(apply);
            ResponseMessage responseMessage = new ResponseMessage("1", "提交申请成功");
            return responseMessage;
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "提交失败");
        }
    }

    /**
     * 通过加入队伍申请
     *
     * @param apply
     * @return
     */
    @RequestMapping(value = "/pass", method = RequestMethod.POST)
    public @ResponseBody
    ResponseMessage pass(@RequestBody Apply apply) {
        System.out.println(apply);
        apply.setApplyDisposeTime(System.currentTimeMillis());
        //设置申请状态为1，即通过
        apply.setApplyState(1);
        //队伍人数加1
        apply.getTeam().setTeamHeadcount(apply.getTeam().getTeamHeadcount() + 1);
        //若队伍人数等于竞赛规定人数
        if (apply.getTeam().getTeamHeadcount().equals(apply.getTeam().getCompetition().getCompetitionPeopleSum())) {
            //设置队伍状态为已满员
            apply.getTeam().setTeamState(2);
        } else {
            //设置为队伍状态招募中
            apply.getTeam().setTeamState(1);
        }
        try {
            applyService.updateApplyByDispose(apply);
            return new ResponseMessage("1", "处理成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "处理失败");
        }
    }

    /**
     * 拒绝加入队伍申请
     *
     * @param applyId
     * @return
     */
    @RequestMapping("/refuse")
    public @ResponseBody
    ResponseMessage refuse(String applyId) {
        Apply apply = new Apply();
        apply.setApplyId(applyId);
        apply.setApplyDisposeTime(System.currentTimeMillis());
        apply.setApplyState(2);
        try {
            applyService.updateApplyByDispose(apply);
            return new ResponseMessage("1", "处理成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "处理失败");
        }
    }

    /**
     * 获取用户正在申请的申请列表
     *
     * @return
     */
    @RequestMapping("/getMyJoinApplyList")
    public @ResponseBody
    ResponseMessage getMyJoinApplyList() {
        Long userId = getLoginUser().getUserId();
        SysSuser user = userService.selectUserById(userId);
        try {
            List<Apply> applies = applyService.findMyApplyList(user.getUserId(), 0);
            ResponseMessage responseMessage = new ResponseMessage("1", "获取成功");
            responseMessage.getData().put("applies", applies);
            return responseMessage;
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "获取失败");
        }
    }

    /**
     * 获取用户已结束的申请列表
     *
     * @return
     */
    @RequestMapping("/getHistoryJoinApplyList")
    public @ResponseBody
    ResponseMessage getHistoryJoinApplyList() {
        Long userId = getLoginUser().getUserId();
        SysSuser user = userService.selectUserById(userId);
        try {
            //除状态0以外都是已结束的申请
            List<Apply> applies = applyService.findMyHistoryApplyList(user.getUserId(), 0);
            ResponseMessage responseMessage = new ResponseMessage("1", "获取成功");
            responseMessage.getData().put("applies", applies);
            return responseMessage;
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "获取失败");
        }
    }

    /**
     * 撤销加入队伍申请
     *
     * @param applyId
     * @return
     */
    @RequestMapping("/cancelMyTeamApply")
    public @ResponseBody
    ResponseMessage cancelMyTeamApply(String applyId) {
        try {
            applyService.deleteTeamApply(applyId);
            return new ResponseMessage("1", "撤销成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "撤销失败");
        }

    }


}
