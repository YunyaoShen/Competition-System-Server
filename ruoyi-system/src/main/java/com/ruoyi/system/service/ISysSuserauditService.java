package com.ruoyi.system.service;

import com.ruoyi.common.core.domain.entity.SysSuser;

import java.util.ArrayList;
import java.util.List;

public interface ISysSuserauditService {
    /**
     * 根据条件分页查询用户列表
     *
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    public List<SysSuser> selectUserList(SysSuser user);

    /**
     * 根据条件分页查询已分配用户角色列表
     *
     * @param user 用户信息
     * @return 用户信息集合信息
     */

    public SysSuser selectUserById(Long userId);

     /*
     * 修改状态
     * @param user 用户信息
     * @return 结果
     */
    public int updateUserStatus(String status, ArrayList userIds);


    /**
     * 批量删除用户信息
     *
     * @param userIds 需要删除的用户ID
     * @return 结果
     */
    public int deleteUserByIds(Long[] userIds);


}
