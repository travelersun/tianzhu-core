package com.gdtopway.aud.dao;

import org.springframework.stereotype.Repository;

import com.gdtopway.aud.entity.UserLogonLog;
import com.gdtopway.core.dao.jpa.BaseDao;

@Repository
public interface UserLogonLogDao extends BaseDao<UserLogonLog, Long> {

    UserLogonLog findByHttpSessionId(String httpSessionId);

}