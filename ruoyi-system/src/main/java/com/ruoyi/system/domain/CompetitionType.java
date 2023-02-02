package com.ruoyi.system.domain;

/**
 * @author :syy
 * @date :2022/12/20 14:57
 */
public class CompetitionType {

    private String competitionTypeId;
    private String competitionTypeName;

    public String getCompetitionTypeId() {
        return competitionTypeId;
    }

    public void setCompetitionTypeId(String competitionTypeId) {
        this.competitionTypeId = competitionTypeId;
    }

    public String getCompetitionTypeName() {
        return competitionTypeName;
    }

    public void setCompetitionTypeName(String competitionTypeName) {
        this.competitionTypeName = competitionTypeName;
    }

    @Override
    public String toString() {
        return "CompetitionType{" +
                "competitionTypeId='" + competitionTypeId + '\'' +
                ", competitionTypeName='" + competitionTypeName + '\'' +
                '}';
    }
}
