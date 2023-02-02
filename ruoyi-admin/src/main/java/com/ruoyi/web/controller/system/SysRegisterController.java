package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.model.SuserRegisterBody;
import com.ruoyi.common.core.domain.model.UserRegisterBody;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.web.service.SysRegisterService;
import com.ruoyi.system.service.ISysConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 注册验证
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/register")
public class SysRegisterController extends BaseController
{
    @Autowired
    private SysRegisterService registerService;

    @Autowired
    private ISysConfigService configService;

    @PostMapping("/tuserregister")
    public AjaxResult Tuserregister(@RequestBody UserRegisterBody registerbody)
    {
        String msg = registerService.Tuserregister(registerbody);
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }

    @PostMapping("/suserregister")
    public AjaxResult Suserregister(@RequestBody SuserRegisterBody registerbody)
    {
        String msg = registerService.Suserregister(registerbody);
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }
}
