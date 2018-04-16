package com.tianzhu.aud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tianzhu.aud.dao.SendMessageLogDao;
import com.tianzhu.aud.entity.SendMessageLog;
import com.tianzhu.core.dao.jpa.BaseDao;
import com.tianzhu.core.service.BaseService;

@Service
@Transactional
public class SendMessageLogService extends BaseService<SendMessageLog, String> {

    @Autowired
    private SendMessageLogDao sendMessageLogDao;

    @Override
    protected BaseDao<SendMessageLog, String> getEntityDao() {
        return sendMessageLogDao;
    }

    @Async
    public void asyncSave(SendMessageLog entity) {
        sendMessageLogDao.save(entity);
    }
}
