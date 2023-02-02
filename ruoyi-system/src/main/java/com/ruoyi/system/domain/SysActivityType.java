package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 活动类型对象 sys_activity_type
 * 
 * @author syy
 * @date 2022-09-08
 */
public class SysActivityType extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 类型ID */
    private Long typeId;

    /** 活动类型 */
    @Excel(name = "活动类型")
    private String typeName;

    /** 活动类型备注 */
    @Excel(name = "活动类型备注")
    private String typeRemark;

    public void setTypeId(Long typeId) 
    {
        this.typeId = typeId;
    }

    public Long getTypeId() 
    {
        return typeId;
    }
    public void setTypeName(String typeName) 
    {
        this.typeName = typeName;
    }

    public String getTypeName() 
    {
        return typeName;
    }
    public void setTypeRemark(String typeRemark) 
    {
        this.typeRemark = typeRemark;
    }

    public String getTypeRemark() 
    {
        return typeRemark;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("typeId", getTypeId())
            .append("typeName", getTypeName())
            .append("typeRemark", getTypeRemark())
            .toString();
    }
}
