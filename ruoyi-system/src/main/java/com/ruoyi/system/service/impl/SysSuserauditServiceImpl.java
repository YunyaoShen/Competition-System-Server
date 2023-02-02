package com.ruoyi.system.service.impl;

import com.ruoyi.common.annotation.DataScope;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysSuser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanValidators;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.system.domain.SysUserRole;
import com.ruoyi.system.mapper.SysRoleMapper;
import com.ruoyi.system.mapper.SysSuserMapper;
import com.ruoyi.system.mapper.SysSuserauditMapper;
import com.ruoyi.system.mapper.SysUserRoleMapper;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.ISysSuserService;
import com.ruoyi.system.service.ISysSuserauditService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import javax.validation.Validator;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
@Service
public class SysSuserauditServiceImpl implements ISysSuserauditService
{
    private static final Logger log = LoggerFactory.getLogger(SysSuserServiceImpl.class);

    @Autowired
    private SysSuserauditMapper userMapper;

    @Autowired
    private SysRoleMapper roleMapper;

    @Autowired
    private SysUserRoleMapper userRoleMapper;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    protected Validator validator;

    /**
     * 根据条件分页查询用户列表
     *
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    @Override
    @DataScope(userAlias = "u")
    public List<SysSuser> selectUserList(SysSuser user)
    {
        return userMapper.selectUserList(user);
    }


    /**
     * 通过用户ID查询用户
     *
     * @param userId 用户ID
     * @return 用户对象信息
     */
    @Override
    public SysSuser selectUserById(Long userId)
    {
        return userMapper.selectUserById(userId);
    }


    /**
     * 修改用户状态
     *
     * @param user 用户信息
     * @return 结果
     */
    @Override
    public int updateUserStatus(String status, ArrayList userIds)
    {
        return userMapper.updateUserStatus(status, userIds);
    }

    /**
     * 修改用户基本信息
     *
     * @param user 用户信息
     * @return 结果
     */


    /**
     * 批量删除用户信息
     *
     * @param userIds 需要删除的用户ID
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteUserByIds(Long[] userIds)
    {
        // 删除用户与角色关联
        userRoleMapper.deleteUserRole(userIds);
        return userMapper.deleteUserByIds(userIds);
    }

}
