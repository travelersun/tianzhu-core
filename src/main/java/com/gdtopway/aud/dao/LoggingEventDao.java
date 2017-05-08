package com.gdtopway.aud.dao;

import org.springframework.stereotype.Repository;

import com.gdtopway.aud.entity.LoggingEvent;
import com.gdtopway.core.dao.jpa.BaseDao;

@Repository
public interface LoggingEventDao extends BaseDao<LoggingEvent, Long> {

}