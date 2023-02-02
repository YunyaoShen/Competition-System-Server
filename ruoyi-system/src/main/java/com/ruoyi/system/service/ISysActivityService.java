package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysActivity;

/**
 * 竞赛管理Service接口
 * 
 * @author syy
 * @date 2022-09-08
 */
public interface ISysActivityService 
{
    /**
     * 查询竞赛管理
     * 
     * @param activityId 竞赛管理主键
     * @return 竞赛管理
     */
    public SysActivity selectSysActivityByActivityId(Long activityId);

    /**
     * 查询竞赛管理列表
     * 
     * @param sysActivity 竞赛管理
     * @return 竞赛管理集合
     */
    public List<SysActivity> selectSysActivityList(SysActivity sysActivity);

    /**
     * 新增竞赛管理
     * 
     * @param sysActivity 竞赛管理
     * @return 结果
     */
    public int insertSysActivity(SysActivity sysActivity);

    /**
     * 修改竞赛管理
     * 
     * @param sysActivity 竞赛管理
     * @return 结果
     */
    public int updateSysActivity(SysActivity sysActivity);

    /**
     * 批量删除竞赛管理
     * 
     * @param activityIds 需要删除的竞赛管理主键集合
     * @return 结果
     */
    public int deleteSysActivityByActivityIds(Long[] activityIds);

    /**
     * 删除竞赛管理信息
     * 
     * @param activityId 竞赛管理主键
     * @return 结果
     */
    public int deleteSysActivityByActivityId(Long activityId);
}
