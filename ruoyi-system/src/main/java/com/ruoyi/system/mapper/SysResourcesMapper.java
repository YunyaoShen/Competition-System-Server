package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.SysResources;

import java.util.List;

/**
 * 资源管理Mapper接口
 * @author xiaobai
 * @date 2022-03-27
 */
public interface SysResourcesMapper {
    /**
     * 查询资源管理
     *
     * @param id 资源管理主键
     * @return 资源管理
     */
    public SysResources selectSysResourcesById(Long id);

    /**
     * 查询资源管理列表
     *
     * @param sysResources 资源管理
     * @return 资源管理集合
     */
    public List<SysResources> selectSysResourcesList(SysResources sysResources);

    /**
     * 新增资源管理
     *
     * @param sysResources 资源管理
     * @return 结果
     */
    public int insertSysResources(SysResources sysResources);

    /**
     * 修改资源管理
     *
     * @param sysResources 资源管理
     * @return 结果
     */
    public int updateSysResources(SysResources sysResources);

    /**
     * 删除资源管理
     *
     * @param id 资源管理主键
     * @return 结果
     */
    public int deleteSysResourcesById(Long id);

    /**
     * 批量删除资源管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysResourcesByIds(Long[] ids);

    List<SysResources> selectMd5(String md5);
}
