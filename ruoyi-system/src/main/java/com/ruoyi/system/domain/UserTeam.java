package com.ruoyi.system.domain;

/**
 * @author syy
 * CreateTime 2022/12/13 11:10
 */
public class UserTeam {
    private Long userId;

    private String teamId;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId == null ? null : userId;
    }

    public String getTeamId() {
        return teamId;
    }

    public void setTeamId(String teamId) {
        this.teamId = teamId == null ? null : teamId.trim();
    }

    @Override
    public String toString() {
        return "UserTeam{" +
                "userId='" + userId + '\'' +
                ", teamId='" + teamId + '\'' +
                '}';
    }
}