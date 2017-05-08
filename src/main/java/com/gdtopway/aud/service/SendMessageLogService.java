package com.gdtopway.aud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdtopway.aud.dao.SendMessageLogDao;
import com.gdtopway.aud.entity.SendMessageLog;
import com.gdtopway.core.dao.jpa.BaseDao;
import com.gdtopway.core.service.BaseService;

@Service
@Transactional
public class SendMessageLogService extends BaseService<SendMessageLog, Long> {

    @Autowired
    private SendMessageLogDao sendMessageLogDao;

    @Override
    protected BaseDao<SendMessageLog, Long> getEntityDao() {
        return sendMessageLogDao;
    }

    @Async
    public void asyncSave(SendMessageLog entity) {
        sendMessageLogDao.save(entity);
    }
}
