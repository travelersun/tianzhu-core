package com.tianzhu.aud.dao;

import org.springframework.stereotype.Repository;

import com.tianzhu.aud.entity.LoggingEvent;
import com.tianzhu.core.dao.jpa.BaseDao;

@Repository
public interface LoggingEventDao extends BaseDao<LoggingEvent, String> {

}