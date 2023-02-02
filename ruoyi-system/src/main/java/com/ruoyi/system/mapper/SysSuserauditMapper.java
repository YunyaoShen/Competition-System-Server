package com.ruoyi.system.mapper;

import com.ruoyi.common.core.domain.entity.SysSuser;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

public interface SysSuserauditMapper {

    /**
     * 根据条件分页查询用户列表
     *
     * @param sysSuser 用户信息
     * @return 用户信息集合信息
     */
    public List<SysSuser> selectUserList(SysSuser sysSuser);

    /**
     * 通过用户ID查询用户
     *
     * @param userId 用户ID
     * @return 用户对象信息
     */
    public SysSuser selectUserById(Long userId);


    /**
     * 批量删除用户信息
     *
     * @param userIds 需要删除的用户ID
     * @return 结果
     */
    public int deleteUserByIds(Long[] userIds);


    public int updateUserStatus(@Param("status")String status, @Param("userIds") ArrayList userIds);


}
