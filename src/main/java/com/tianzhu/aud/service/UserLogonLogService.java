package com.tianzhu.aud.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tianzhu.aud.dao.UserLogonLogDao;
import com.tianzhu.aud.entity.UserLogonLog;
import com.tianzhu.core.dao.jpa.BaseDao;
import com.tianzhu.core.dao.mybatis.MyBatisDao;
import com.tianzhu.core.service.BaseService;

@Service
@Transactional
public class UserLogonLogService extends BaseService<UserLogonLog, String> {

    @Autowired
    private UserLogonLogDao userLogonLogDao;

    @Autowired
    private MyBatisDao myBatisDao;

    @Override
    protected BaseDao<UserLogonLog, String> getEntityDao() {
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
