package com.gdtopway.module.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdtopway.core.dao.jpa.BaseDao;
import com.gdtopway.core.service.BaseService;
import com.gdtopway.module.sys.dao.NotifyMessageReadDao;
import com.gdtopway.module.sys.entity.NotifyMessage;
import com.gdtopway.module.sys.entity.NotifyMessageRead;

@Service
@Transactional
public class NotifyMessageReadService extends BaseService<NotifyMessageRead, Long> {

    @Autowired
    private NotifyMessageReadDao notifyMessageReadDao;

    @Override
    protected BaseDao<NotifyMessageRead, Long> getEntityDao() {
        return notifyMessageReadDao;
    }

    public Integer countByNotifyMessage(NotifyMessage notifyMessage) {
        return notifyMessageReadDao.countByNotifyMessage(notifyMessage.getId());
    }

}
