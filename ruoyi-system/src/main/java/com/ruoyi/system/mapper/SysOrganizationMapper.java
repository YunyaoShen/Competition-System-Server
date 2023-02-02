package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysOrganization;

/**
 * 机构管理Mapper接口
 * 
 * @author syy
 * @date 2022-09-08
 */
public interface SysOrganizationMapper 
{
    /**
     * 查询机构管理
     * 
     * @param organizationId 机构管理主键
     * @return 机构管理
     */
    public SysOrganization selectSysOrganizationByOrganizationId(Long organizationId);

    /**
     * 查询机构管理列表
     * 
     * @param sysOrganization 机构管理
     * @return 机构管理集合
     */
    public List<SysOrganization> selectSysOrganizationList(SysOrganization sysOrganization);

    /**
     * 新增机构管理
     * 
     * @param sysOrganization 机构管理
     * @return 结果
     */
    public int insertSysOrganization(SysOrganization sysOrganization);

    /**
     * 修改机构管理
     * 
     * @param sysOrganization 机构管理
     * @return 结果
     */
    public int updateSysOrganization(SysOrganization sysOrganization);

    /**
     * 删除机构管理
     * 
     * @param organizationId 机构管理主键
     * @return 结果
     */
    public int deleteSysOrganizationByOrganizationId(Long organizationId);

    /**
     * 批量删除机构管理
     * 
     * @param organizationIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysOrganizationByOrganizationIds(Long[] organizationIds);
}
