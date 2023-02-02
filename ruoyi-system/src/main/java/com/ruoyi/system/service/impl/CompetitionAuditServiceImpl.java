package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.CompetitionAuditMapper;
import com.ruoyi.system.domain.CompetitionAudit;
import com.ruoyi.system.service.ICompetitionAuditService;

/**
 * 竞赛审核Service业务层处理
 * 
 * @author Syy
 * @date 2022-09-04
 */
@Service
public class CompetitionAuditServiceImpl implements ICompetitionAuditService 
{
    @Autowired
    private CompetitionAuditMapper competitionAuditMapper;

    /**
     * 查询竞赛审核
     * 
     * @param activityId 竞赛审核主键
     * @return 竞赛审核
     */
    @Override
    public CompetitionAudit selectCompetitionAuditByActivityId(Long activityId)
    {
        return competitionAuditMapper.selectCompetitionAuditByActivityId(activityId);
    }

    /**
     * 查询竞赛审核列表
     * 
     * @param competitionAudit 竞赛审核
     * @return 竞赛审核
     */
    @Override
    public List<CompetitionAudit> selectCompetitionAuditList(CompetitionAudit competitionAudit)
    {
        return competitionAuditMapper.selectCompetitionAuditList(competitionAudit);
    }

    /**
     * 新增竞赛审核
     * 
     * @param competitionAudit 竞赛审核
     * @return 结果
     */
    @Override
    public int insertCompetitionAudit(CompetitionAudit competitionAudit)
    {
        return competitionAuditMapper.insertCompetitionAudit(competitionAudit);
    }

    /**
     * 修改竞赛审核
     * 
     * @param competitionAudit 竞赛审核
     * @return 结果
     */
    @Override
    public int updateCompetitionAudit(CompetitionAudit competitionAudit)
    {
        return competitionAuditMapper.updateCompetitionAudit(competitionAudit);
    }

    /**
     * 批量删除竞赛审核
     * 
     * @param activityIds 需要删除的竞赛审核主键
     * @return 结果
     */
    @Override
    public int deleteCompetitionAuditByActivityIds(Long[] activityIds)
    {
        return competitionAuditMapper.deleteCompetitionAuditByActivityIds(activityIds);
    }

    /**
     * 删除竞赛审核信息
     * 
     * @param activityId 竞赛审核主键
     * @return 结果
     */
    @Override
    public int deleteCompetitionAuditByActivityId(Long activityId)
    {
        return competitionAuditMapper.deleteCompetitionAuditByActivityId(activityId);
    }
}
