package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysActivityTypeMapper;
import com.ruoyi.system.domain.SysActivityType;
import com.ruoyi.system.service.ISysActivityTypeService;

/**
 * 活动类型Service业务层处理
 * 
 * @author syy
 * @date 2022-09-08
 */
@Service
public class SysActivityTypeServiceImpl implements ISysActivityTypeService 
{
    @Autowired
    private SysActivityTypeMapper sysActivityTypeMapper;

    /**
     * 查询活动类型
     * 
     * @param typeId 活动类型主键
     * @return 活动类型
     */
    @Override
    public SysActivityType selectSysActivityTypeByTypeId(Long typeId)
    {
        return sysActivityTypeMapper.selectSysActivityTypeByTypeId(typeId);
    }

    /**
     * 查询活动类型列表
     * 
     * @param sysActivityType 活动类型
     * @return 活动类型
     */
    @Override
    public List<SysActivityType> selectSysActivityTypeList(SysActivityType sysActivityType)
    {
        return sysActivityTypeMapper.selectSysActivityTypeList(sysActivityType);
    }

    /**
     * 新增活动类型
     * 
     * @param sysActivityType 活动类型
     * @return 结果
     */
    @Override
    public int insertSysActivityType(SysActivityType sysActivityType)
    {
        return sysActivityTypeMapper.insertSysActivityType(sysActivityType);
    }

    /**
     * 修改活动类型
     * 
     * @param sysActivityType 活动类型
     * @return 结果
     */
    @Override
    public int updateSysActivityType(SysActivityType sysActivityType)
    {
        return sysActivityTypeMapper.updateSysActivityType(sysActivityType);
    }

    /**
     * 批量删除活动类型
     * 
     * @param typeIds 需要删除的活动类型主键
     * @return 结果
     */
    @Override
    public int deleteSysActivityTypeByTypeIds(Long[] typeIds)
    {
        return sysActivityTypeMapper.deleteSysActivityTypeByTypeIds(typeIds);
    }

    /**
     * 删除活动类型信息
     * 
     * @param typeId 活动类型主键
     * @return 结果
     */
    @Override
    public int deleteSysActivityTypeByTypeId(Long typeId)
    {
        return sysActivityTypeMapper.deleteSysActivityTypeByTypeId(typeId);
    }
}
