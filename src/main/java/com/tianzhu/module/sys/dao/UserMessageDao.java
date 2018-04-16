package com.tianzhu.module.sys.dao;

import org.springframework.stereotype.Repository;

import com.tianzhu.core.dao.jpa.BaseDao;
import com.tianzhu.module.sys.entity.UserMessage;

@Repository
public interface UserMessageDao extends BaseDao<UserMessage, String> {

}