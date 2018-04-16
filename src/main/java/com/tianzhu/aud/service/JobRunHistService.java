package com.tianzhu.aud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tianzhu.aud.dao.JobRunHistDao;
import com.tianzhu.aud.entity.JobRunHist;
import com.tianzhu.core.dao.jpa.BaseDao;
import com.tianzhu.core.service.BaseService;

@Service
@Transactional
public class JobRunHistService extends BaseService<JobRunHist, String> {

    @Autowired
    private JobRunHistDao jobRunHistDao;

    @Override
    protected BaseDao<JobRunHist, String> getEntityDao() {
        return jobRunHistDao;
    }
}
