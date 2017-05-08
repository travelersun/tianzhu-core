package com.gdtopway.aud.dao;


import org.springframework.stereotype.Repository;

import com.gdtopway.aud.entity.SendMessageLog;
import com.gdtopway.core.dao.jpa.BaseDao;

@Repository
public interface SendMessageLogDao extends BaseDao<SendMessageLog, Long> {

}