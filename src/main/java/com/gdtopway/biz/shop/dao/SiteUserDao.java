package com.gdtopway.biz.shop.dao;

import org.springframework.stereotype.Repository;

import com.gdtopway.biz.shop.entity.SiteUser;
import com.gdtopway.core.dao.jpa.BaseDao;
import com.gdtopway.module.auth.entity.User;

@Repository
public interface SiteUserDao extends BaseDao<SiteUser, Long> {

    SiteUser findByUser(User user);
}
