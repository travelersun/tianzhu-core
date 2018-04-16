package com.tianzhu.aud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tianzhu.aud.dao.LoggingEventDao;
import com.tianzhu.aud.entity.LoggingEvent;
import com.tianzhu.core.dao.jpa.BaseDao;
import com.tianzhu.core.service.BaseService;

@Service
@Transactional
public class LoggingEventService extends BaseService<LoggingEvent, String> {

    @Autowired
    private LoggingEventDao loggingEventDao;

    @Override
    protected BaseDao<LoggingEvent, String> getEntityDao() {
        return loggingEventDao;
    }
}
