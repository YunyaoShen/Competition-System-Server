package com.ruoyi.web.controller.system;



import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysSuser;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.service.ISysRoleService;
import com.ruoyi.system.service.ISysSuserService;
import com.ruoyi.system.service.ISysSuserauditService;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 用户信息
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/system/suseraudit")
public class SysSuserauditController extends BaseController
{
    @Autowired
    private ISysSuserauditService userService;

    @Autowired
    private ISysRoleService roleService;

    /**
     * 获取用户列表
     */
    @GetMapping("/list")
    public TableDataInfo list(SysSuser user)
    {
        startPage();
        List<SysSuser> list = userService.selectUserList(user);
        return getDataTable(list);
    }

    @Log(title = "用户管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysSuser user)
    {
        List<SysSuser> list = userService.selectUserList(user);
        ExcelUtil<SysSuser> util = new ExcelUtil<SysSuser>(SysSuser.class);
        util.exportExcel(response, list, "用户数据");
    }

    /**
     * 根据用户编号获取详细信息
     */
    @GetMapping(value = { "/", "/{userId}" })
    public AjaxResult getInfo(@PathVariable(value = "userId", required = false) Long userId)
    {
        AjaxResult ajax = AjaxResult.success();
        List<SysRole> roles = roleService.selectRoleAll();
        ajax.put("roles", SysSuser.isAdmin(userId) ? roles : roles.stream().filter(r -> !r.isAdmin()).collect(Collectors.toList()));
        if (StringUtils.isNotNull(userId))
        {
            SysSuser sysUser = userService.selectUserById(userId);
            ajax.put(AjaxResult.DATA_TAG, sysUser);
            ajax.put("roleIds", sysUser.getRoles().stream().map(SysRole::getRoleId).collect(Collectors.toList()));
        }
        return ajax;
    }

    /**
     * 删除用户
     */
    @Log(title = "用户管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{userIds}")
    public AjaxResult remove(@PathVariable Long[] userIds)
    {
        if (ArrayUtils.contains(userIds, getUserId()))
        {
            return error("当前用户不能删除");
        }
        return toAjax(userService.deleteUserByIds(userIds));
    }


    /**
     * 状态修改
     */
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PostMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody Map<String,Object> hasaMap)
    {
        System.out.println("11111111");
        String status = hasaMap.get("status").toString();
        System.out.print(hasaMap.get("userIds"));
        ArrayList userIds = (ArrayList) hasaMap.get("userIds");

//        userService.checkUserAllowed(user);
//        userService.checkUserDataScope(user.getUserId());
//        user.setUpdateBy(getUsername());
        return toAjax(userService.updateUserStatus(status,userIds));
    }


}
