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
import com.ruoyi.system.domain.CompetitionAudit;
import com.ruoyi.system.service.ICompetitionAuditService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 竞赛审核Controller
 * 
 * @author Syy
 * @date 2022-09-04
 */
@RestController
@RequestMapping("/system/audit")
public class CompetitionAuditController extends BaseController
{
    @Autowired
    private ICompetitionAuditService competitionAuditService;

    /**
     * 查询竞赛审核列表
     */
    @PreAuthorize("@ss.hasPermi('system:audit:list')")
    @GetMapping("/list")
    public TableDataInfo list(CompetitionAudit competitionAudit)
    {
        startPage();
        List<CompetitionAudit> list = competitionAuditService.selectCompetitionAuditList(competitionAudit);
        return getDataTable(list);
    }

    /**
     * 导出竞赛审核列表
     */
    @PreAuthorize("@ss.hasPermi('system:audit:export')")
    @Log(title = "竞赛审核", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CompetitionAudit competitionAudit)
    {
        List<CompetitionAudit> list = competitionAuditService.selectCompetitionAuditList(competitionAudit);
        ExcelUtil<CompetitionAudit> util = new ExcelUtil<CompetitionAudit>(CompetitionAudit.class);
        util.exportExcel(response, list, "竞赛审核数据");
    }

    /**
     * 获取竞赛审核详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:audit:query')")
    @GetMapping(value = "/{activityId}")
    public AjaxResult getInfo(@PathVariable("activityId") Long activityId)
    {
        return AjaxResult.success(competitionAuditService.selectCompetitionAuditByActivityId(activityId));
    }

    /**
     * 新增竞赛审核
     */
    @PreAuthorize("@ss.hasPermi('system:audit:add')")
    @Log(title = "竞赛审核", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CompetitionAudit competitionAudit)
    {
        return toAjax(competitionAuditService.insertCompetitionAudit(competitionAudit));
    }

    /**
     * 修改竞赛审核
     */
    @PreAuthorize("@ss.hasPermi('system:audit:edit')")
    @Log(title = "竞赛审核", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CompetitionAudit competitionAudit)
    {
        return toAjax(competitionAuditService.updateCompetitionAudit(competitionAudit));
    }

    /**
     * 删除竞赛审核
     */
    @PreAuthorize("@ss.hasPermi('system:audit:remove')")
    @Log(title = "竞赛审核", businessType = BusinessType.DELETE)
	@DeleteMapping("/{activityIds}")
    public AjaxResult remove(@PathVariable Long[] activityIds)
    {
        return toAjax(competitionAuditService.deleteCompetitionAuditByActivityIds(activityIds));
    }
}
