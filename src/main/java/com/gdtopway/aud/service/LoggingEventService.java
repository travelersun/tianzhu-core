package com.gdtopway.aud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdtopway.aud.dao.LoggingEventDao;
import com.gdtopway.aud.entity.LoggingEvent;
import com.gdtopway.core.dao.jpa.BaseDao;
import com.gdtopway.core.service.BaseService;

@Service
@Transactional
public class LoggingEventService extends BaseService<LoggingEvent, Long> {

    @Autowired
    private LoggingEventDao loggingEventDao;

    @Override
    protected BaseDao<LoggingEvent, Long> getEntityDao() {
        return loggingEventDao;
    }
}
