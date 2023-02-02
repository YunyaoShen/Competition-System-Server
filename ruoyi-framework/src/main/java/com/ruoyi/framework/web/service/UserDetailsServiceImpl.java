package com.ruoyi.framework.web.service;

import com.alibaba.fastjson2.JSON;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.entity.SysSuser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.core.domain.model.NameHelper;
import com.ruoyi.common.enums.UserStatus;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.service.ISysSuserService;
import com.ruoyi.system.service.ISysUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * 用户验证处理
 *
 * @author ruoyi
 */
@Service
public class UserDetailsServiceImpl implements UserDetailsService
{
    private static final Logger log = LoggerFactory.getLogger(UserDetailsServiceImpl.class);

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysSuserService suserService;
    @Autowired
    private SysPermissionService permissionService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException
    {
        NameHelper nameHelper = JSON.parseObject(username,NameHelper.class);
        username = nameHelper.getName();
        if(nameHelper.getUserType().equals("admin")){
            SysUser user = userService.selectUserByUserName(username);

        if (StringUtils.isNull(user))
        {
            log.info("登录用户：{} 不存在.", username);
            throw new ServiceException("登录用户：" + username + " 不存在");
        }
        else if (UserStatus.DELETED.getCode().equals(user.getDelFlag()))
        {
            log.info("登录用户：{} 已被删除.", username);
            throw new ServiceException("对不起，您的账号：" + username + " 已被删除");
        }
        else if (UserStatus.DISABLE.getCode().equals(user.getStatus()))
        {
            log.info("登录用户：{} 已被停用.", username);
            throw new ServiceException("对不起，您的账号：" + username + " 已停用");
        }
        else if (UserStatus.AUDIT.getCode().equals(user.getStatus()))
        {
            log.info("登录用户：{} 正在审核.", username);
            throw new ServiceException("对不起，您的账号：" + username + "审核中");
        }
        return createLoginUser(user);
        }else{
            SysSuser user = suserService.selectUserByUserName(username);

            if (StringUtils.isNull(user))
            {
                log.info("登录用户：{} 不存在.", username);
                throw new ServiceException("登录用户：" + username + " 不存在");
            }
            else if (UserStatus.DELETED.getCode().equals(user.getDelFlag()))
            {
                log.info("登录用户：{} 已被删除.", username);
                throw new ServiceException("对不起，您的账号：" + username + " 已被删除");
            }
            else if (UserStatus.DISABLE.getCode().equals(user.getStatus()))
            {
                log.info("登录用户：{} 已被停用.", username);
                throw new ServiceException("对不起，您的账号：" + username + " 已停用");
            }
            else if (UserStatus.AUDIT.getCode().equals(user.getStatus()))
            {
                log.info("登录用户：{} 正在审核.", username);
                throw new ServiceException("对不起，您的账号：" + username + "审核中");
            }

            return createLoginSuser(user);
        }

    }

    public UserDetails createLoginUser(SysUser user)
    {
        return new LoginUser(user.getUserId(), user, permissionService.getMenuPermission(user));
    }

    public UserDetails createLoginSuser(SysSuser user)
    {

        return new LoginUser(user.getUserId(), user);
    }
}
