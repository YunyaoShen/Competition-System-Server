package com.ruoyi.system.mapper;


import com.ruoyi.system.domain.CompetitionType;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author :syy
 * @date :2022/12/20 15:00
 */

@Mapper
public interface CompetitionTypeDao {
    /**
     * 获取全部比赛类型
     *
     * @return
     */
    List<CompetitionType> findAllCompetitionType();
}
