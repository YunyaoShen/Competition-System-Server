package com.ruoyi.web.controller.system;

import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.RedisUtil;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.Activity;
import com.ruoyi.system.service.IActivityService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * ActivityController
 *
 * @author ruoyi
 * @date 2022-12-06
 */
@RestController
@RequestMapping("/system/activity")
public class ActivityController extends BaseController
{
    @Autowired
    private IActivityService activityService;

    @Autowired
    private RedisUtil redisUtil;
    /**
     * 查询Activity列表
     */
    @GetMapping("/list")
    public TableDataInfo list(String competitionId)
    {
        System.out.println(competitionId);
        redisUtil.set("competitionId", competitionId);
        startPage();
        List<Activity> list = activityService.selectActivityList(competitionId);
        return getDataTable(list);
    }

    /**
     * 导出Activity列表
     */
    @PostMapping("/export")
    public void export(HttpServletResponse response, String competitionId)
    {
        List<Activity> list = activityService.selectActivityList(competitionId);
        ExcelUtil<Activity> util = new ExcelUtil<Activity>(Activity.class);
        util.exportExcel(response, list, "Activity数据");
    }

    /**
     * 获取Activity详细信息
     */
    @GetMapping(value = "/{activityId}")
    public AjaxResult getInfo(@PathVariable("activityId") String activityId)
    {
        return AjaxResult.success(activityService.selectActivityByActivityId(activityId));
    }

    /**
     * 新增Activity
     */
    @PostMapping
    public AjaxResult add(@RequestBody Activity activity)
    {
        String activityId = UUID.randomUUID().toString();
        String competitionId = redisUtil.get("competitionId").toString();
        activity.setActivityId(activityId);
        activity.setCompetitionId(competitionId);
        return toAjax(activityService.insertActivity(activity));
    }

    /**
     * 修改Activity
     */

    @PutMapping
    public AjaxResult edit(@RequestBody Activity activity)
    {
        return toAjax(activityService.updateActivity(activity));
    }

    /**
     * 删除Activity
     */

    @DeleteMapping("/{activityIds}")
    public AjaxResult remove(@PathVariable String[] activityIds)
    {
        return toAjax(activityService.deleteActivityByActivityIds(activityIds));
    }
}

