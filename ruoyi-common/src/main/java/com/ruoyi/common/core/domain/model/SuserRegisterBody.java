package com.ruoyi.common.core.domain.model;

import com.ruoyi.common.core.domain.entity.SysSuser;


public class SuserRegisterBody {

    /**
     * 验证码
     */
    private String code;

    /**
     * 唯一标识
     */
    private String uuid;

    private SysSuser user;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public SysSuser getUser() {
        return user;
    }

    public void setUser(SysSuser user) {
        this.user = user;
    }
}
