package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * Activity对象 t_activity
 *
 * @author ruoyi
 * @date 2022-12-06
 */
public class Activity extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private String activityId;

    /** $column.columnComment */
    private String activityName;

    /** $column.columnComment */
    private String competitionId;

    private String competitionName;
    /** $column.columnComment */
    private Long ordernum;

    /** $column.columnComment */
    private Long activityStarttime;

    /** $column.columnComment */
    private Long activityEndtime;

    private Integer reviewStatus;

    public Integer getReviewStatus() {
        return reviewStatus;
    }

    public void setReviewStatus(Integer reviewStatus) {
        this.reviewStatus = reviewStatus;
    }

    public void setActivityId(String activityId)
    {
        this.activityId = activityId;
    }

    public String getActivityId()
    {
        return activityId;
    }
    public void setActivityName(String activityName)
    {
        this.activityName = activityName;
    }

    public String getActivityName()
    {
        return activityName;
    }
    public void setCompetitionId(String competitionId)
    {
        this.competitionId = competitionId;
    }

    public String getCompetitionId()
    {
        return competitionId;
    }
    public void setOrder(Long ordernum)
    {
        this.ordernum = ordernum;
    }

    public Long getOrder()
    {
        return ordernum;
    }

    public void setActivityStarttime(Long activityStarttime)
    {
        this.activityStarttime = activityStarttime;
    }

    public Long getActivityStarttime()
    {
        return activityStarttime;
    }

    public void setActivityEndtime(Long activityEndtime)
    {
        this.activityEndtime = activityEndtime;
    }

    public Long getActivityEndtime()
    {
        return activityEndtime;
    }

    public String getCompetitionName() {
        return competitionName;
    }

    public void setCompetitionName(String competitionName) {
        this.competitionName = competitionName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("activityId", getActivityId())
                .append("activityName", getActivityName())
                .append("competitionId", getCompetitionId())
                .append("competitionName", getCompetitionName())
                .append("ordernum", getOrder())
                .append("activityStarttime", getActivityStarttime())
                .append("activityEndtime", getActivityEndtime())
                .append("reviewStatus",getReviewStatus())
                .toString();
    }
}
