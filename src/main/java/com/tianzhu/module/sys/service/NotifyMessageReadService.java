package com.tianzhu.module.sys.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tianzhu.core.dao.jpa.BaseDao;
import com.tianzhu.core.service.BaseService;
import com.tianzhu.module.sys.dao.NotifyMessageReadDao;
import com.tianzhu.module.sys.entity.NotifyMessage;
import com.tianzhu.module.sys.entity.NotifyMessageRead;

@Service
@Transactional
public class NotifyMessageReadService extends BaseService<NotifyMessageRead, String> {

    @Autowired
    private NotifyMessageReadDao notifyMessageReadDao;

    @Override
    protected BaseDao<NotifyMessageRead, String> getEntityDao() {
        return notifyMessageReadDao;
    }

    public Integer countByNotifyMessage(NotifyMessage notifyMessage) {
        return notifyMessageReadDao.countByNotifyMessage(notifyMessage.getId());
    }

}
