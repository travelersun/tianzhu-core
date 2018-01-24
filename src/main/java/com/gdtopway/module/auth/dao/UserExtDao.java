package com.gdtopway.module.auth.dao;

import org.springframework.stereotype.Repository;

import com.gdtopway.core.dao.jpa.BaseDao;
import com.gdtopway.module.auth.entity.UserExt;

@Repository
public interface UserExtDao extends BaseDao<UserExt, String> {

    UserExt findByRandomCode(String randomCode);
}