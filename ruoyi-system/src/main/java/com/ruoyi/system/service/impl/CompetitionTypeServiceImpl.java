package com.ruoyi.system.service.impl;


import com.ruoyi.common.utils.RedisUtil;
import com.ruoyi.system.domain.CompetitionType;
import com.ruoyi.system.mapper.CompetitionTypeDao;
import com.ruoyi.system.service.CompetitionTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author :syy
 * @date :2022/12/20 15:03
 */
@Service
public class CompetitionTypeServiceImpl implements CompetitionTypeService {
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private CompetitionTypeDao competitionTypeDao;

    @Override
    public List<CompetitionType> findAllCompetitionType() {
        List<CompetitionType> competitionTypes;
            competitionTypes = competitionTypeDao.findAllCompetitionType();
            System.out.println("数据库取出的竞赛类型");
        return competitionTypes;
    }
}
