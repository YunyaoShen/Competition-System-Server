package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.entity.SysSuser;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.List;

/**
 * UserActivity对象 t_user_activity
 *
 * @author ruoyi
 * @date 2022-12-07
 */
public class UserActivity extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户ID */
    private Long userId;

    /** 赛程ID */
    private String activityId;

    /** 日期 */
    @Excel(name = "日期")
    private Long date;

    private SysSuser user;

    private WorkFile file;
    /** 比赛作品 */

    private String fileId;

    private Integer score;

    /** 赛程状态 */
    @Excel(name = "赛程状态")
    private Integer activityState;

    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setActivityId(String activityId)
    {
        this.activityId = activityId;
    }

    public String getActivityId()
    {
        return activityId;
    }
    public void setDate(Long date)
    {
        this.date = date;
    }

    public Long getDate()
    {
        return date;
    }
    public void setFileId(String fileId)
    {
        this.fileId = fileId;
    }

    public String getFileId()
    {
        return fileId;
    }
    public void setActivityState(Integer activityState)
    {
        this.activityState = activityState;
    }

    public Integer getActivityState()
    {
        return activityState;
    }
    public SysSuser getUser() {
        return user;
    }

    public void setUser(SysSuser user) {
        this.user = user;
    }

    public WorkFile getFile() {
        return file;
    }

    public void setFile(WorkFile file) {
        this.file = file;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("userId", getUserId())
                .append("activityId", getActivityId())
                .append("date", getDate())
                .append("fileId", getFileId())
                .append("activityState", getActivityState())
                .append("file", getFile())
                .append("user", getUser())
                .append("score", getScore())
                .toString();
    }
}
