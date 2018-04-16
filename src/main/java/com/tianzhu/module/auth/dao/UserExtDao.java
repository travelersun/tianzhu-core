package com.tianzhu.module.auth.dao;

import org.springframework.stereotype.Repository;

import com.tianzhu.core.dao.jpa.BaseDao;
import com.tianzhu.module.auth.entity.UserExt;

@Repository
public interface UserExtDao extends BaseDao<UserExt, String> {

    UserExt findByRandomCode(String randomCode);
}