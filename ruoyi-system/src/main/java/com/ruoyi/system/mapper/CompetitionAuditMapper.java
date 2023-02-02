package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.CompetitionAudit;

/**
 * 竞赛审核Mapper接口
 * 
 * @author Syy
 * @date 2022-09-04
 */
public interface CompetitionAuditMapper 
{
    /**
     * 查询竞赛审核
     * 
     * @param activityId 竞赛审核主键
     * @return 竞赛审核
     */
    public CompetitionAudit selectCompetitionAuditByActivityId(Long activityId);

    /**
     * 查询竞赛审核列表
     * 
     * @param competitionAudit 竞赛审核
     * @return 竞赛审核集合
     */
    public List<CompetitionAudit> selectCompetitionAuditList(CompetitionAudit competitionAudit);

    /**
     * 新增竞赛审核
     * 
     * @param competitionAudit 竞赛审核
     * @return 结果
     */
    public int insertCompetitionAudit(CompetitionAudit competitionAudit);

    /**
     * 修改竞赛审核
     * 
     * @param competitionAudit 竞赛审核
     * @return 结果
     */
    public int updateCompetitionAudit(CompetitionAudit competitionAudit);

    /**
     * 删除竞赛审核
     * 
     * @param activityId 竞赛审核主键
     * @return 结果
     */
    public int deleteCompetitionAuditByActivityId(Long activityId);

    /**
     * 批量删除竞赛审核
     * 
     * @param activityIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCompetitionAuditByActivityIds(Long[] activityIds);
}
