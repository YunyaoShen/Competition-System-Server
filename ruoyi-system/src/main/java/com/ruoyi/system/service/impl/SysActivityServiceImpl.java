package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysActivityMapper;
import com.ruoyi.system.domain.SysActivity;
import com.ruoyi.system.service.ISysActivityService;

/**
 * 竞赛管理Service业务层处理
 * 
 * @author syy
 * @date 2022-09-08
 */
@Service
public class SysActivityServiceImpl implements ISysActivityService 
{
    @Autowired
    private SysActivityMapper sysActivityMapper;

    /**
     * 查询竞赛管理
     * 
     * @param activityId 竞赛管理主键
     * @return 竞赛管理
     */
    @Override
    public SysActivity selectSysActivityByActivityId(Long activityId)
    {
        return sysActivityMapper.selectSysActivityByActivityId(activityId);
    }

    /**
     * 查询竞赛管理列表
     * 
     * @param sysActivity 竞赛管理
     * @return 竞赛管理
     */
    @Override
    public List<SysActivity> selectSysActivityList(SysActivity sysActivity)
    {
        return sysActivityMapper.selectSysActivityList(sysActivity);
    }

    /**
     * 新增竞赛管理
     * 
     * @param sysActivity 竞赛管理
     * @return 结果
     */
    @Override
    public int insertSysActivity(SysActivity sysActivity)
    {
        return sysActivityMapper.insertSysActivity(sysActivity);
    }

    /**
     * 修改竞赛管理
     * 
     * @param sysActivity 竞赛管理
     * @return 结果
     */
    @Override
    public int updateSysActivity(SysActivity sysActivity)
    {
        return sysActivityMapper.updateSysActivity(sysActivity);
    }

    /**
     * 批量删除竞赛管理
     * 
     * @param activityIds 需要删除的竞赛管理主键
     * @return 结果
     */
    @Override
    public int deleteSysActivityByActivityIds(Long[] activityIds)
    {
        return sysActivityMapper.deleteSysActivityByActivityIds(activityIds);
    }

    /**
     * 删除竞赛管理信息
     * 
     * @param activityId 竞赛管理主键
     * @return 结果
     */
    @Override
    public int deleteSysActivityByActivityId(Long activityId)
    {
        return sysActivityMapper.deleteSysActivityByActivityId(activityId);
    }
}
