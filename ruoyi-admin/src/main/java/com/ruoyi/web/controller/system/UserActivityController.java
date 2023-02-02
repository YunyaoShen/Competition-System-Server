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
import com.ruoyi.system.domain.UserActivity;
import com.ruoyi.system.service.IUserActivityService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * UserActivityController
 *
 * @author ruoyi
 * @date 2022-12-07
 */
@RestController
@RequestMapping("/system/useractivity")
public class UserActivityController extends BaseController
{
    @Autowired
    private IUserActivityService userActivityService;

    /**
     * 查询UserActivity列表
     */
    @GetMapping("/list")
    public TableDataInfo list(String activityId)
    {
        startPage();
        List<UserActivity> list = userActivityService.selectUserActivityList(activityId);
        return getDataTable(list);
    }

    /**
     * 导出UserActivity列表
     */
    @PostMapping("/export")
    public void export(HttpServletResponse response, String activityId)
    {
        List<UserActivity> list = userActivityService.selectUserActivityList(activityId);
        ExcelUtil<UserActivity> util = new ExcelUtil<UserActivity>(UserActivity.class);
        util.exportExcel(response, list, "UserActivity数据");
    }



    /**
     * 新增UserActivity
     */
    @PostMapping
    public AjaxResult add(@RequestBody UserActivity userActivity)
    {
        return toAjax(userActivityService.insertUserActivity(userActivity));
    }

    /**
     * 修改UserActivity
     */
    @PutMapping
    public AjaxResult edit(@RequestBody UserActivity userActivity)
    {
        return toAjax(userActivityService.updateUserActivity(userActivity));
    }

    /**
     * 删除UserActivity
     */
    @DeleteMapping("/{userIds}")
    public AjaxResult remove(@PathVariable Long[] userIds)
    {
        return toAjax(userActivityService.deleteUserActivityByUserIds(userIds));
    }
}
