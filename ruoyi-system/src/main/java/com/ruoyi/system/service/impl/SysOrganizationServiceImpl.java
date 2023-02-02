package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysOrganizationMapper;
import com.ruoyi.system.domain.SysOrganization;
import com.ruoyi.system.service.ISysOrganizationService;

/**
 * 机构管理Service业务层处理
 * 
 * @author syy
 * @date 2022-09-08
 */
@Service
public class SysOrganizationServiceImpl implements ISysOrganizationService 
{
    @Autowired
    private SysOrganizationMapper sysOrganizationMapper;

    /**
     * 查询机构管理
     * 
     * @param organizationId 机构管理主键
     * @return 机构管理
     */
    @Override
    public SysOrganization selectSysOrganizationByOrganizationId(Long organizationId)
    {
        return sysOrganizationMapper.selectSysOrganizationByOrganizationId(organizationId);
    }

    /**
     * 查询机构管理列表
     * 
     * @param sysOrganization 机构管理
     * @return 机构管理
     */
    @Override
    public List<SysOrganization> selectSysOrganizationList(SysOrganization sysOrganization)
    {
        return sysOrganizationMapper.selectSysOrganizationList(sysOrganization);
    }

    /**
     * 新增机构管理
     * 
     * @param sysOrganization 机构管理
     * @return 结果
     */
    @Override
    public int insertSysOrganization(SysOrganization sysOrganization)
    {
        return sysOrganizationMapper.insertSysOrganization(sysOrganization);
    }

    /**
     * 修改机构管理
     * 
     * @param sysOrganization 机构管理
     * @return 结果
     */
    @Override
    public int updateSysOrganization(SysOrganization sysOrganization)
    {
        return sysOrganizationMapper.updateSysOrganization(sysOrganization);
    }

    /**
     * 批量删除机构管理
     * 
     * @param organizationIds 需要删除的机构管理主键
     * @return 结果
     */
    @Override
    public int deleteSysOrganizationByOrganizationIds(Long[] organizationIds)
    {
        return sysOrganizationMapper.deleteSysOrganizationByOrganizationIds(organizationIds);
    }

    /**
     * 删除机构管理信息
     * 
     * @param organizationId 机构管理主键
     * @return 结果
     */
    @Override
    public int deleteSysOrganizationByOrganizationId(Long organizationId)
    {
        return sysOrganizationMapper.deleteSysOrganizationByOrganizationId(organizationId);
    }
}
