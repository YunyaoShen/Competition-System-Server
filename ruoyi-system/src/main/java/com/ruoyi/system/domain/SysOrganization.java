package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 机构管理对象 sys_organization
 * 
 * @author syy
 * @date 2022-09-08
 */
public class SysOrganization extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 机构ID */
    private Long organizationId;

    /** 机构名称 */
    @Excel(name = "机构名称")
    private String organizationName;

    /** 机构地点 */
    @Excel(name = "机构地点")
    private String organizationField;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String organizationPho;

    /** 机构给描述 */
    @Excel(name = "机构描述")
    private String organizationRemark;

    public void setOrganizationId(Long organizationId) 
    {
        this.organizationId = organizationId;
    }

    public Long getOrganizationId() 
    {
        return organizationId;
    }
    public void setOrganizationName(String organizationName) 
    {
        this.organizationName = organizationName;
    }

    public String getOrganizationName() 
    {
        return organizationName;
    }
    public void setOrganizationField(String organizationField) 
    {
        this.organizationField = organizationField;
    }

    public String getOrganizationField() 
    {
        return organizationField;
    }
    public void setOrganizationPho(String organizationPho) 
    {
        this.organizationPho = organizationPho;
    }

    public String getOrganizationPho() 
    {
        return organizationPho;
    }
    public void setOrganizationRemark(String organizationRemark) 
    {
        this.organizationRemark = organizationRemark;
    }

    public String getOrganizationRemark() 
    {
        return organizationRemark;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("organizationId", getOrganizationId())
            .append("organizationName", getOrganizationName())
            .append("organizationField", getOrganizationField())
            .append("organizationPho", getOrganizationPho())
            .append("organizationRemark", getOrganizationRemark())
            .toString();
    }
}
