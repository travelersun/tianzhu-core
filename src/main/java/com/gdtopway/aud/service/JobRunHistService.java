package com.gdtopway.aud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdtopway.aud.dao.JobRunHistDao;
import com.gdtopway.aud.entity.JobRunHist;
import com.gdtopway.core.dao.jpa.BaseDao;
import com.gdtopway.core.service.BaseService;

@Service
@Transactional
public class JobRunHistService extends BaseService<JobRunHist, Long> {

    @Autowired
    private JobRunHistDao jobRunHistDao;

    @Override
    protected BaseDao<JobRunHist, Long> getEntityDao() {
        return jobRunHistDao;
    }
}
