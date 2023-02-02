package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysActivityType;

/**
 * 活动类型Service接口
 * 
 * @author syy
 * @date 2022-09-08
 */
public interface ISysActivityTypeService 
{
    /**
     * 查询活动类型
     * 
     * @param typeId 活动类型主键
     * @return 活动类型
     */
    public SysActivityType selectSysActivityTypeByTypeId(Long typeId);

    /**
     * 查询活动类型列表
     * 
     * @param sysActivityType 活动类型
     * @return 活动类型集合
     */
    public List<SysActivityType> selectSysActivityTypeList(SysActivityType sysActivityType);

    /**
     * 新增活动类型
     * 
     * @param sysActivityType 活动类型
     * @return 结果
     */
    public int insertSysActivityType(SysActivityType sysActivityType);

    /**
     * 修改活动类型
     * 
     * @param sysActivityType 活动类型
     * @return 结果
     */
    public int updateSysActivityType(SysActivityType sysActivityType);

    /**
     * 批量删除活动类型
     * 
     * @param typeIds 需要删除的活动类型主键集合
     * @return 结果
     */
    public int deleteSysActivityTypeByTypeIds(Long[] typeIds);

    /**
     * 删除活动类型信息
     * 
     * @param typeId 活动类型主键
     * @return 结果
     */
    public int deleteSysActivityTypeByTypeId(Long typeId);
}
