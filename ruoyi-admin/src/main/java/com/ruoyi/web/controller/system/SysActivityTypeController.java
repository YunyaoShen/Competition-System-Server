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
import com.ruoyi.system.domain.SysActivityType;
import com.ruoyi.system.service.ISysActivityTypeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 活动类型Controller
 * 
 * @author syy
 * @date 2022-09-08
 */
@RestController
@RequestMapping("/system/activitytype")
public class SysActivityTypeController extends BaseController
{
    @Autowired
    private ISysActivityTypeService sysActivityTypeService;

    /**
     * 查询活动类型列表
     */
    @PreAuthorize("@ss.hasPermi('system:activitytype:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysActivityType sysActivityType)
    {
        startPage();
        List<SysActivityType> list = sysActivityTypeService.selectSysActivityTypeList(sysActivityType);
        return getDataTable(list);
    }

    /**
     * 导出活动类型列表
     */
    @PreAuthorize("@ss.hasPermi('system:activitytype:export')")
    @Log(title = "活动类型", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysActivityType sysActivityType)
    {
        List<SysActivityType> list = sysActivityTypeService.selectSysActivityTypeList(sysActivityType);
        ExcelUtil<SysActivityType> util = new ExcelUtil<SysActivityType>(SysActivityType.class);
        util.exportExcel(response, list, "活动类型数据");
    }

    /**
     * 获取活动类型详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:activitytype:query')")
    @GetMapping(value = "/{typeId}")
    public AjaxResult getInfo(@PathVariable("typeId") Long typeId)
    {
        return AjaxResult.success(sysActivityTypeService.selectSysActivityTypeByTypeId(typeId));
    }

    /**
     * 新增活动类型
     */
    @PreAuthorize("@ss.hasPermi('system:activitytype:add')")
    @Log(title = "活动类型", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysActivityType sysActivityType)
    {
        return toAjax(sysActivityTypeService.insertSysActivityType(sysActivityType));
    }

    /**
     * 修改活动类型
     */
    @PreAuthorize("@ss.hasPermi('system:activitytype:edit')")
    @Log(title = "活动类型", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysActivityType sysActivityType)
    {
        return toAjax(sysActivityTypeService.updateSysActivityType(sysActivityType));
    }

    /**
     * 删除活动类型
     */
    @PreAuthorize("@ss.hasPermi('system:activitytype:remove')")
    @Log(title = "活动类型", businessType = BusinessType.DELETE)
	@DeleteMapping("/{typeIds}")
    public AjaxResult remove(@PathVariable Long[] typeIds)
    {
        return toAjax(sysActivityTypeService.deleteSysActivityTypeByTypeIds(typeIds));
    }
}
