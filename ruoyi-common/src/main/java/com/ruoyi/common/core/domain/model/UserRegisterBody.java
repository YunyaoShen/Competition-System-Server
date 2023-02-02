package com.ruoyi.common.core.domain.model;
import com.ruoyi.common.core.domain.entity.SysSuser;
import com.ruoyi.common.core.domain.entity.SysUser;
/**
 * 用户注册对象
 *
 * @author ruoyi
 */
public class UserRegisterBody
{
    /**
     * 验证码
     */
    private String code;

    /**
     * 唯一标识
     */
    private String uuid;

    private SysUser user;

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

    public SysUser getUser() {
        return user;
    }

    public void setUser(SysUser user) {
        this.user = user;
    }

}
