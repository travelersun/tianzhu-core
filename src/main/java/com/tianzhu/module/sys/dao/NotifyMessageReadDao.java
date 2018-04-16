package com.tianzhu.module.sys.dao;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.tianzhu.core.dao.jpa.BaseDao;
import com.tianzhu.module.auth.entity.User;
import com.tianzhu.module.sys.entity.NotifyMessage;
import com.tianzhu.module.sys.entity.NotifyMessageRead;

@Repository
public interface NotifyMessageReadDao extends BaseDao<NotifyMessageRead, String> {

    NotifyMessageRead findByNotifyMessageAndReadUser(NotifyMessage notifyMessage, User user);

    @Query("from NotifyMessageRead where readUser.id=:readUserId and notifyMessage.id in (:scopeEffectiveMessageIds)")
    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE, value = "true") })
    public List<NotifyMessageRead> findByReadUserAndNotifyMessageIn(@Param("readUserId") String readUserId,
            @Param("scopeEffectiveMessageIds") List<String> scopeEffectiveMessageIds);

    @Query("select count(nm) from NotifyMessageRead nm where nm.notifyMessage.id=:notifyMessageId")
    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE, value = "true") })
    Integer countByNotifyMessage(@Param("notifyMessageId") String notifyMessageId);
}