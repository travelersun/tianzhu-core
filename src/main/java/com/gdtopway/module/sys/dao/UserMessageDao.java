package com.gdtopway.module.sys.dao;

import org.springframework.stereotype.Repository;

import com.gdtopway.core.dao.jpa.BaseDao;
import com.gdtopway.module.sys.entity.UserMessage;

@Repository
public interface UserMessageDao extends BaseDao<UserMessage, Long> {

}