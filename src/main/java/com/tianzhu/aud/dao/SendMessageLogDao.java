package com.tianzhu.aud.dao;


import org.springframework.stereotype.Repository;

import com.tianzhu.aud.entity.SendMessageLog;
import com.tianzhu.core.dao.jpa.BaseDao;

@Repository
public interface SendMessageLogDao extends BaseDao<SendMessageLog, String> {

}