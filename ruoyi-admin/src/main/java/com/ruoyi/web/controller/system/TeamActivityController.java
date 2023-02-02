package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.TeamActivity;
import com.ruoyi.system.service.ITeamActivityService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * useractivityController
 *
 * @author ruoyi
 * @date 2022-12-07
 */
@RestController
@RequestMapping("/system/teamactivity")
public class TeamActivityController extends BaseController
{
    @Autowired
    private ITeamActivityService teamActivityService;

    /**
     * 查询useractivity列表
     */
    @GetMapping("/list")
    public TableDataInfo list(String activityId)
    {
        startPage();
        List<TeamActivity> list = teamActivityService.selectTeamActivityList(activityId);
        return getDataTable(list);
    }

    /**
     * 导出useractivity列表
     */
    @PostMapping("/export")
    public void export(HttpServletResponse response, String activityId)
    {
        List<TeamActivity> list = teamActivityService.selectTeamActivityList(activityId);
        ExcelUtil<TeamActivity> util = new ExcelUtil<TeamActivity>(TeamActivity.class);
        util.exportExcel(response, list, "useractivity数据");
    }



    /**
     * 新增useractivity
     */
    @PostMapping
    public AjaxResult add(@RequestBody TeamActivity teamActivity)
    {
        return toAjax(teamActivityService.insertTeamActivity(teamActivity));
    }

    /**
     * 修改useractivity
     */
    @PutMapping
    public AjaxResult edit(@RequestBody TeamActivity teamActivity)
    {
        return toAjax(teamActivityService.updateTeamActivity(teamActivity));
    }

    /**
     * 删除useractivity
     */
    @DeleteMapping("/{teamIds}")
    public AjaxResult remove(@PathVariable String[] teamIds)
    {
        return toAjax(teamActivityService.deleteTeamActivityByTeamIds(teamIds));
    }
}
