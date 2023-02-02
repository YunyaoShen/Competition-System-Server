package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 资源管理对象 sys_resources
 * @author xiaobai
 * @date 2022-03-27
 */
public class SysResources extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 文件id */
    @Excel(name = "文件id")
    private Long id;

    /** 文件名 */
    @Excel(name = "文件名")
    private String name;

    /** 文件链接 */
    @Excel(name = "文件链接")
    private String url;

    /** 文件类型 */
    @Excel(name = "文件类型")
    private String type;

    /** 文件大小（kb） */
    @Excel(name = "文件大小", readConverterExp = "k=b")
    private Long size;

    /** 逻辑删除（0正常，1禁用） */
    private Integer delFlag;

    /** 唯一标识 */
    private String md5;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUrl() {
        return url;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setSize(Long size) {
        this.size = size;
    }

    public Long getSize() {
        return size;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setMd5(String md5) {
        this.md5 = md5;
    }

    public String getMd5() {
        return md5;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("name", getName())
                .append("url", getUrl())
                .append("type", getType())
                .append("size", getSize())
                .append("delFlag", getDelFlag())
                .append("md5", getMd5())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}
