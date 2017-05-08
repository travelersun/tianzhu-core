package com.gdtopway.aud.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdtopway.aud.dao.UserLogonLogDao;
import com.gdtopway.aud.entity.UserLogonLog;
import com.gdtopway.core.dao.jpa.BaseDao;
import com.gdtopway.core.dao.mybatis.MyBatisDao;
import com.gdtopway.core.service.BaseService;

@Service
@Transactional
public class UserLogonLogService extends BaseService<UserLogonLog, Long> {

    @Autowired
    private UserLogonLogDao userLogonLogDao;

    @Autowired
    private MyBatisDao myBatisDao;

    @Override
    protected BaseDao<UserLogonLog, Long> getEntityDao() {
        return userLogonLogDao;
    }

    @Transactional(readOnly = true)
    public UserLogonLog findBySessionId(String httpSessionId) {
        return userLogonLogDao.findByHttpSessionId(httpSessionId);
    }

    public List<Map<String, Object>> findGroupByLogonDay() {
        return myBatisDao.findList(UserLogonLog.class.getName(), "findGroupByLogonDay", null);
    }
}
