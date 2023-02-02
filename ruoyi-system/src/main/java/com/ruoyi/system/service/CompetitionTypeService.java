package com.ruoyi.system.service;

import com.ruoyi.system.domain.CompetitionType;

import java.util.List;

/**
 * @author :syy
 * @date :2022/12/20 15:02
 */
public interface CompetitionTypeService {
    /**
     * 获取全部比赛类型
     *
     * @return
     */
    List<CompetitionType> findAllCompetitionType();
}
