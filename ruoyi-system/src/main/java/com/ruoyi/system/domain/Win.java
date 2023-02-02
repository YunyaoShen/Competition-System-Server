package com.ruoyi.system.domain;

import java.util.List;
import com.ruoyi.common.core.domain.entity.SysSuser;
/**
 * @author :syy
 * @date :2022/12/24 15:55
 */
public class Win {
    private String winId;

    private Integer winRanking;

    private String winName;

    private List<SysSuser> users;

    private Competition competition;

    public String getWinId() {
        return winId;
    }

    public void setWinId(String winId) {
        this.winId = winId;
    }

    public Integer getWinRanking() {
        return winRanking;
    }

    public void setWinRanking(Integer winRanking) {
        this.winRanking = winRanking;
    }

    public String getWinName() {
        return winName;
    }

    public void setWinName(String winName) {
        this.winName = winName;
    }

    public List<SysSuser> getUsers() {
        return users;
    }

    public void setUsers(List<SysSuser> users) {
        this.users = users;
    }

    public Competition getCompetition() {
        return competition;
    }

    public void setCompetition(Competition competition) {
        this.competition = competition;
    }

    @Override
    public String toString() {
        return "Win{" +
                "winId='" + winId + '\'' +
                ", winRanking=" + winRanking +
                ", winName='" + winName + '\'' +
                ", users=" + users +
                ", competition=" + competition +
                '}';
    }
}
