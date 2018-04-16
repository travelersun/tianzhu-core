package com.tianzhu.aud.dao;

import org.springframework.stereotype.Repository;

import com.tianzhu.aud.entity.UserLogonLog;
import com.tianzhu.core.dao.jpa.BaseDao;

@Repository
public interface UserLogonLogDao extends BaseDao<UserLogonLog, String> {

    UserLogonLog findByHttpSessionId(String httpSessionId);

}