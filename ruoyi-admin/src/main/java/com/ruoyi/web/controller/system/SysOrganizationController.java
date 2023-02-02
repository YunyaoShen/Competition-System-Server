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
import com.ruoyi.system.domain.SysOrganization;
import com.ruoyi.system.service.ISysOrganizationService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 机构管理Controller
 * 
 * @author syy
 * @date 2022-09-08
 */
@RestController
@RequestMapping("/system/organization")
public class SysOrganizationController extends BaseController
{
    @Autowired
    private ISysOrganizationService sysOrganizationService;

    /**
     * 查询机构管理列表
     */
    @GetMapping("/list")
    public TableDataInfo list(SysOrganization sysOrganization)
    {
        startPage();
        List<SysOrganization> list = sysOrganizationService.selectSysOrganizationList(sysOrganization);
        return getDataTable(list);
    }

    /**
     * 导出机构管理列表
     */
    @Log(title = "机构管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysOrganization sysOrganization)
    {
        List<SysOrganization> list = sysOrganizationService.selectSysOrganizationList(sysOrganization);
        ExcelUtil<SysOrganization> util = new ExcelUtil<SysOrganization>(SysOrganization.class);
        util.exportExcel(response, list, "机构管理数据");
    }

    /**
     * 获取机构管理详细信息
     */
    @GetMapping(value = "/{organizationId}")
    public AjaxResult getInfo(@PathVariable("organizationId") Long organizationId)
    {
        return AjaxResult.success(sysOrganizationService.selectSysOrganizationByOrganizationId(organizationId));
    }

    /**
     * 新增机构管理
     */
    @Log(title = "机构管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysOrganization sysOrganization)
    {
        return toAjax(sysOrganizationService.insertSysOrganization(sysOrganization));
    }

    /**
     * 修改机构管理
     */
    @Log(title = "机构管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysOrganization sysOrganization)
    {
        return toAjax(sysOrganizationService.updateSysOrganization(sysOrganization));
    }

    /**
     * 删除机构管理
     */
    @Log(title = "机构管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{organizationIds}")
    public AjaxResult remove(@PathVariable Long[] organizationIds)
    {
        return toAjax(sysOrganizationService.deleteSysOrganizationByOrganizationIds(organizationIds));
    }
}
