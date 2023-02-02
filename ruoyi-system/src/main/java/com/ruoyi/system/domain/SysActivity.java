package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 竞赛管理对象 sys_activity
 * 
 * @author syy
 * @date 2022-09-08
 */
public class SysActivity extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 竞赛ID */
    private Long activityId;

    /** 竞赛名称 */
    @Excel(name = "竞赛名称")
    private String activityName;

    /** 开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startTime;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endTime;

    /** 比赛规模 */
    @Excel(name = "比赛规模")
    private Long activityScale;

    /** 申报人 */
    @Excel(name = "申报人")
    private String activityDeclarer;

    /** 比赛地点 */
    @Excel(name = "比赛地点")
    private String activityPlace;

    /** 组织单位 */
    @Excel(name = "组织单位")
    private String activityOrganizer;

    /** 比赛类型 */
    @Excel(name = "比赛类型")
    private String activityType;

    /** 0待审核，1审核通过，2审核不通过 */
    @Excel(name = "0待审核，1审核通过，2审核不通过")
    private Long activityState;

    public void setActivityId(Long activityId) 
    {
        this.activityId = activityId;
    }

    public Long getActivityId() 
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
    public void setStartTime(Date startTime) 
    {
        this.startTime = startTime;
    }

    public Date getStartTime() 
    {
        return startTime;
    }
    public void setEndTime(Date endTime) 
    {
        this.endTime = endTime;
    }

    public Date getEndTime() 
    {
        return endTime;
    }
    public void setActivityScale(Long activityScale) 
    {
        this.activityScale = activityScale;
    }

    public Long getActivityScale() 
    {
        return activityScale;
    }
    public void setActivityDeclarer(String activityDeclarer) 
    {
        this.activityDeclarer = activityDeclarer;
    }

    public String getActivityDeclarer() 
    {
        return activityDeclarer;
    }
    public void setActivityPlace(String activityPlace) 
    {
        this.activityPlace = activityPlace;
    }

    public String getActivityPlace() 
    {
        return activityPlace;
    }
    public void setActivityOrganizer(String activityOrganizer) 
    {
        this.activityOrganizer = activityOrganizer;
    }

    public String getActivityOrganizer() 
    {
        return activityOrganizer;
    }
    public void setActivityType(String activityType) 
    {
        this.activityType = activityType;
    }

    public String getActivityType() 
    {
        return activityType;
    }
    public void setActivityState(Long activityState) 
    {
        this.activityState = activityState;
    }

    public Long getActivityState() 
    {
        return activityState;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("activityId", getActivityId())
            .append("activityName", getActivityName())
            .append("startTime", getStartTime())
            .append("endTime", getEndTime())
            .append("activityScale", getActivityScale())
            .append("activityDeclarer", getActivityDeclarer())
            .append("activityPlace", getActivityPlace())
            .append("activityOrganizer", getActivityOrganizer())
            .append("activityType", getActivityType())
            .append("activityState", getActivityState())
            .toString();
    }
}
